package com.test.controller;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.beans.UserBean;
import com.test.service.UserService;

@Controller
public class ClientController {
	@Resource(name="longinUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/main")
	public String main() {
		return "client/main";
	}	
	@GetMapping("/user/join")
	public String user_join(@ModelAttribute("joinUserBean") UserBean bean) {
		return "client/user/join";
	}
	@GetMapping("/user/check_user_id")
	public String user_check_user_id(@RequestParam String new_id, Model model) {
		String id = userService.checkUserId(new_id);
		model.addAttribute("check",id);
		return "client/user/check_user_join_id";
	}
	@PostMapping("/user/join_pro")
	public String user_join_pro(@Valid @ModelAttribute("joinUserBean") UserBean bean, BindingResult result, HttpServletRequest request) {
		if(result.hasErrors()) {
			return "client/user/join";
		}
		bean.setUser_grade(1);
		bean.setUser_status(1);
		bean.setUser_ip(request.getRemoteAddr());
		
		userService.addUser(bean);
		
		return "client/user/join_pro";
	}
	@GetMapping("/user/login")
	public String user_login(UserBean bean) {
		
		return "client/user/login";
	}
	@PostMapping("/user/login")
	public String user_login_pro() {
		
		return "user/login_pro";
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
