package com.test.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.beans.BoardCategoryBean;
import com.test.beans.ContentBean;
import com.test.beans.PageBean;
import com.test.beans.UserBean;
import com.test.service.BoardService;
import com.test.service.UserService;

@Controller
public class ClientController {
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BoardService boardService;
	
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
	public String user_login() {
		
		return "client/user/login";
	}
	@PostMapping("/user/login_pro")
	public String user_login_pro(UserBean bean) {
		userService.login(bean, loginUserBean);
		return "client/user/login_pro";
	}
	@GetMapping("/user/info")
	public String user_info(Model model) {
		UserBean userInfoBean =userService.getUserInfo(loginUserBean.getUser_idx());
		model.addAttribute("userInfoBean", userInfoBean);
		return "client/user/info";
	}
	@PostMapping("/user/modify_user_info")
	public String user_modify_info(@Valid @ModelAttribute("userInfoBean") UserBean bean, BindingResult result) {
		if(result.hasErrors()) {
			return "client/user/info";
		}
		bean.setUser_idx(loginUserBean.getUser_idx());
		userService.modifyUserInfo(bean);
		return "client/user/modify_user_info";
	}
	@GetMapping("/user/logout")
	public String user_logout(HttpSession session) {
		session.invalidate();
		return "client/user/logout";
	}
	
	@GetMapping("/board/list")
	public String board_list(@RequestParam(defaultValue="1") int board_category_idx, @RequestParam (defaultValue="1") int page, Model model) {
		
		//get categoryBean
		BoardCategoryBean boardCategoryBean = boardService.getBoardCategoryInfo(board_category_idx);
		model.addAttribute("boardCategoryBean", boardCategoryBean);
		//get contentBean list
		List<ContentBean> contentList = boardService.getContentList(board_category_idx, page);
		model.addAttribute("contentList",contentList);
		//get pageBean
		PageBean pageBean= boardService.getPageBean(board_category_idx, page);
		model.addAttribute("pageBean",pageBean);
		
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
