package com.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.beans.ProductBean;
import com.test.beans.UserBean;
import com.test.service.ProductService;
import com.test.service.UserService;

@Controller
public class ManagerController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private UserService userService;
	
	@GetMapping("/manager/main")
	public String manager_main() {
		return "manager/main";
	}
	@GetMapping("/manager/user/user_list")
	public String manager_user_list(Model model) {
		List<UserBean> userList = userService.getUserList();
		model.addAttribute("userList",userList);		
		return "manager/user/list";
	}
	@GetMapping("/manager/user/manager_list")
	public String manager_manager_list(Model model) {
		List<UserBean> userList = userService.getManagerList();
		model.addAttribute("userList",userList);
		return "manager/user/list";
	}
	@PostMapping("manager/user/modify_user")
	public String manager_user_modify_user(UserBean userBean) {
		
		userService.modifyUserGrade(userBean);
		
		return "manager/user/modify_user";
//		if(userBean.getUser_grade()==1) {
//			return "redirect:/manager/user/user_list";
//		}else {
//			return "manager/user/manager_list";
//		}
	}
	@GetMapping("/manager/product/add_product")
	public String manager_product_list() {
		return "manager/product/add_product";
	}
	@PostMapping("/manager/product/add_product_pro")
	public String manager_product_add_product(ProductBean productBean, HttpServletRequest request) {
		
		String path=request.getServletContext().getRealPath("/WEB-INF/resources/upload");
		String str1 = productService.saveUploadFile(productBean.getUpload_file1(), path);
		String str2 = productService.saveUploadFile(productBean.getUpload_file2(), path);
				
		productBean.setProduct_image(str1);
		productBean.setProduct_detail_image(str2);
		productBean.setProduct_ip(request.getRemoteAddr());
		productService.addProduct(productBean);
		
		return "manager/product/add_product_pro";
	}
	
}
