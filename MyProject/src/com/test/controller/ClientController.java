package com.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ClientController {
	
	@GetMapping("/main")
	public String main() {
		return "client/main";
	}
	@GetMapping("/user/login")
	public String user_login() {
		return "client/user/login";
	}
}
