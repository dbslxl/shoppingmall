package com.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	@GetMapping("/user/join")
	public String user_join() {
		return "client/user/join";
	}
	@PostMapping("/user/join_pro")
	public String user_join_pro() {
		return "client/user/join_pro";
	}
	
	@GetMapping("/board/list")
	public String board_list() {
		return "client/board/list";
	}
	@GetMapping("/board/read")
	public String borard_read() {
		return "client/board/read";
	}
	@GetMapping("/board/write")
	public String board_write(){
		return "client/board/write";
	}
	
	@GetMapping("product/list")
	public String product_list() {
		return "client/product/list";
	}
	@GetMapping("product/detail")
	public String product_detail() {
		return "client/product/detail";
	}
}
