package com.piyush.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import jakarta.mail.internet.ParseException;
import jakarta.servlet.http.HttpSession;

import com.piyush.models.User;
import com.piyush.models.UserDetails;
import com.piyush.services.Appservice;

@Controller
public class UserController {

	@Autowired
	private Appservice appService;

	private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	@GetMapping("/oauth2success")
	public String googleLoginSuccess(@AuthenticationPrincipal OAuth2User principal, HttpSession session) {
		String email = principal.getAttribute("email");
		String name = principal.getAttribute("name");
		String phone = principal.getAttribute("phone_number"); // might be null
		System.out.println(email);
		System.out.println(name);

		User user = appService.getUser(email);

		if (user == null) {
			// Register the user if not already in DB
			user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPhone((phone != null && !phone.isBlank()) ? phone : null);
			user.setPassword(passwordEncoder.encode("jggJHGH@jgjhgjU%465")); // Consider storing a flag that it's a
																				// social login
			appService.registerUser(user);
		}
		user = appService.getUser(email);
		session.setAttribute("userLogin", user);
		return "index.jsp";
	}

	// Register New User
	@PostMapping("/registerUser")
	public String registerUser(@ModelAttribute User user, ModelMap m, HttpSession session) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));

		User existingUser = appService.getUser(user.getEmail());

		if (existingUser != null) {
			m.addAttribute("msg", "User Already Exists!");
		} else {
			User saveUser = appService.registerUser(user);
			session.setAttribute("saveUser", saveUser);
			m.addAttribute("msg", "Registration successful! Please log in.");
		}
		return "Userlogin.jsp";
	}

	// Show Login Page
	@GetMapping("/Userlogin")
	public String login() {
		return "Userlogin.jsp";
	}

	@GetMapping("/Register")
	public String Register() {
		return "Register.jsp";
	}

	// User Login Action
	@PostMapping("/Userlogin")
	public String userLogin(@RequestParam String email, @RequestParam String password, ModelMap m,
			HttpSession session) {
		User user = appService.getUser(email);
		if (user == null) {
			m.addAttribute("msg", "User not found!");
			return "Userlogin.jsp";
		}
		if (passwordEncoder.matches(password, user.getPassword())) {
			session.setAttribute("userLogin", user);
			return "index.jsp";
		} else {
			m.addAttribute("msg", "Invalid id or password!");
			return "Userlogin.jsp";

		}
	}

	// Show Home Page
	@GetMapping("/UserHome")
	public String userHome(ModelMap m, HttpSession session) {
		String name = (String) session.getAttribute("name");
		if (name == null) {
			m.addAttribute("msg", "Please Login First!");
			return "Userlogin.jsp";
		}
		return "index.jsp";
	}

	// User Logout
	@PostMapping("/Userlogout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index.jsp";
	}

	// Update Password
	@PostMapping("/updateuserPassword")
	public String updateuserPassword(@RequestParam String opass, @RequestParam String npass, @RequestParam String rpass,
			ModelMap m, HttpSession session) {
		String email = (String) session.getAttribute("email");
		String msg = appService.updateuserPassword(opass, npass, rpass, email);
		m.addAttribute("msg", msg);
		return "index.jsp";
	}

	// Forget Password
	@PostMapping("/forgetuserPassword")
	public String forgetuserPassword(@RequestParam String email, ModelMap m) {
		String msg = appService.forgetuserPassword(email);
		m.addAttribute("msg", msg);
		return "Userlogin.jsp";
	}

	@PostMapping("/updateUserDetails")
	public String updateUserDetails(@RequestParam String name, @RequestParam String phone, @RequestParam String gender, @RequestParam String dob,
			HttpSession session, ModelMap m) throws java.text.ParseException, ParseException {
		User user = (User) session.getAttribute("userLogin");
		if (user == null) {
			return "Userlogin.jsp";
		}

		// Update user basic info
		user.setName(name);
		user.setPhone(phone);
		appService.updateUser(user);

		// Update or create user details
		UserDetails userDetails = appService.getUserDetails(user.getEmail());
		if (userDetails == null) {
			userDetails = new UserDetails();
			userDetails.setUser(user);
		}

		userDetails.setGender(gender);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date dateOfBirth = dateFormat.parse(dob);
		userDetails.setDob(dateOfBirth);

		appService.updateUserDetails(userDetails);
		
		// ✅ Refresh userDetails after update
	    userDetails = appService.getUserDetails(user.getEmail());
	    m.addAttribute("userDetails", userDetails); // important!
		m.addAttribute("msg", "Profile updated successfully!");
		return "EditUserDetails.jsp";
	}

	@GetMapping("/edit-profile")
	public String showEditProfile(HttpSession session, ModelMap m) {
		User user = (User) session.getAttribute("userLogin");
		if (user == null) {
			return "Userlogin.jsp";
		}

		UserDetails userDetails = appService.getUserDetails(user.getEmail());
		m.addAttribute("userDetails", userDetails);
		return "EditUserDetails.jsp";
	}

}
