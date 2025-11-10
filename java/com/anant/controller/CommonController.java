package com.piyush.controller;



import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;

import ch.qos.logback.core.model.Model;

import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class CommonController {
	
	@ModelAttribute
	public void commonValues(ModelMap m) {
		m.addAttribute("appName","Book App");
	}
	
	@GetMapping("/")
	public String home() {
		return "index.jsp";
	}
	
	@GetMapping("/about")
	public String AboutUs() {
		return "About.jsp";
	}
	
	@GetMapping("/privacypolicy")
	public String privacypolicy() {
		return "PrivacyPolicy.jsp";
	}
	
	@GetMapping("/terms")
	public String terms() {
		return "Terms.jsp";
	}
	
}
