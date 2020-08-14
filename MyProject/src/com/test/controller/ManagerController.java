package com.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManagerController {

	@GetMapping("/manager/main")
	public String manager_main() {
		return "manager/main";
	}
}
