package com.test.beans;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class UserBean {
	
	private Integer user_idx;
	private String user_ip;
	private Integer user_status;
	private String user_date;
	private Integer user_grade;
	
	@Size(min=2,max=10)
	@Pattern(regexp = "[가-힣]*")
	private String user_name;
	
	@Size(min=4, max = 15)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String user_id;
	
	@Size(min=4, max=15)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String user_pw;
	
	private String user_pw2;
	private String user_postcode;
	private String user_address1;
	private String user_address2;	
	private String user_phone1;
	
	@Size(min=3, max=4)
	@Pattern(regexp = "[0-9]*")
	private String user_phone2;
	
	@Size(min=3, max=4)
	@Pattern(regexp = "[0-9]*")
	private String user_phone3;
	
	public Integer getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(Integer user_idx) {
		this.user_idx = user_idx;
	}
	public String getUser_ip() {
		return user_ip;
	}
	public void setUser_ip(String user_ip) {
		this.user_ip = user_ip;
	}
	public Integer getUser_status() {
		return user_status;
	}
	public void setUser_status(Integer user_status) {
		this.user_status = user_status;
	}
	public String getUser_date() {
		return user_date;
	}
	public void setUser_date(String user_date) {
		this.user_date = user_date;
	}
	public Integer getUser_grade() {
		return user_grade;
	}
	public void setUser_grade(Integer user_grade) {
		this.user_grade = user_grade;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}	
	public String getUser_pw2() {
		return user_pw2;
	}
	public void setUser_pw2(String user_pw2) {
		this.user_pw2 = user_pw2;
	}
	public String getUser_postcode() {
		return user_postcode;
	}
	public void setUser_postcode(String user_postcode) {
		this.user_postcode = user_postcode;
	}
	public String getUser_address1() {
		return user_address1;
	}
	public void setUser_address1(String user_address1) {
		this.user_address1 = user_address1;
	}
	public String getUser_address2() {
		return user_address2;
	}
	public void setUser_address2(String user_address2) {
		this.user_address2 = user_address2;
	}	
	public String getUser_phone1() {
		return user_phone1;
	}
	public void setUser_phone1(String user_phone1) {
		this.user_phone1 = user_phone1;
	}
	public String getUser_phone2() {
		return user_phone2;
	}
	public void setUser_phone2(String user_phone2) {
		this.user_phone2 = user_phone2;
	}
	public String getUser_phone3() {
		return user_phone3;
	}
	public void setUser_phone3(String user_phone3) {
		this.user_phone3 = user_phone3;
	}	
	
}
