package com.test.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.beans.ProductBean;
import com.test.service.ProductService;

@Controller
public class ManagerController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/manager/main")
	public String manager_main() {
		return "manager/main";
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
