package com.piyush.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.piyush.services.Appservice;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminController {
	@Autowired
	private Appservice appService;
	

	@GetMapping("/login")
	public String login() {
		return "AdminLogin.jsp";
	}
	@PostMapping("/adminLogin")
	public String adminLogin(@RequestParam String id,@RequestParam String password,ModelMap m,HttpSession session) {
		String name=appService.login(id, password);
		if(name==null) {
			m.addAttribute("msg","Invalid Id or Password!");
			return "AdminLogin.jsp";
		}else {
			session.setAttribute("name", name);
			session.setAttribute("id", id);
			return "AdminHome.jsp";
		}
	}
	@GetMapping("/adminHome")
	public String adminHome(ModelMap m,HttpSession session) {
		String name=(String)session.getAttribute("name");
		if(name==null) {
			m.addAttribute("msg","Please Login First!");
			return "AdminLogin.jsp";
		}
		return "AdminHome.jsp";
	}

	@GetMapping("/Adminlogout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "AdminLogin.jsp";
	}

	@PostMapping("/updatePassword")
	public String updatePassword(String opass,String npass,String rpass,ModelMap m,HttpSession session) {
		String id=(String)session.getAttribute("id");
		String msg=appService.updatePassword(opass,npass,rpass,id);
		m.addAttribute("msg",msg);
		return "AdminHome.jsp";
	}
	@PostMapping("/forgetPassword")
	public String forgetPassword(String email,ModelMap m) {
		String msg=appService.forgetPassword(email);
		m.addAttribute("msg",msg);
		return "AdminLogin.jsp";
	}
}
