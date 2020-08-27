package com.test.beans;

import org.springframework.web.multipart.MultipartFile;

public class ProductBean {
	private int product_idx;
	private String product_ip;
	private int product_status;
	private String product_date;
	private String product_name;
	private int product_price;
	private String product_image;
	private String product_detail_image;
	private int product_category1_idx;
	private int product_category2_idx;
	
	private MultipartFile upload_file1;
	private MultipartFile upload_file2;	
	
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public String getProduct_ip() {
		return product_ip;
	}
	public void setProduct_ip(String product_ip) {
		this.product_ip = product_ip;
	}
	public int getProduct_status() {
		return product_status;
	}
	public void setProduct_status(int product_status) {
		this.product_status = product_status;
	}
	public String getProduct_date() {
		return product_date;
	}
	public void setProduct_date(String product_date) {
		this.product_date = product_date;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public String getProduct_detail_image() {
		return product_detail_image;
	}
	public void setProduct_detail_image(String product_detail_image) {
		this.product_detail_image = product_detail_image;
	}
	public int getProduct_category1_idx() {
		return product_category1_idx;
	}
	public void setProduct_category1_idx(int product_category1_idx) {
		this.product_category1_idx = product_category1_idx;
	}
	public int getProduct_category2_idx() {
		return product_category2_idx;
	}
	public void setProduct_category2_idx(int product_category2_idx) {
		this.product_category2_idx = product_category2_idx;
	}
	public MultipartFile getUpload_file1() {
		return upload_file1;
	}
	public void setUpload_file1(MultipartFile upload_file1) {
		this.upload_file1 = upload_file1;
	}
	public MultipartFile getUpload_file2() {
		return upload_file2;
	}
	public void setUpload_file2(MultipartFile upload_file2) {
		this.upload_file2 = upload_file2;
	}	
}

