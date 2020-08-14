package com.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.beans.UserBean;
import com.test.dao.UserDAO;

@Service
public class UserService {

	@Autowired
	private UserDAO userDao;
	
	public String checkUserId(String newId) {
		String id = userDao.checkUserId(newId);
		if(id==null) {		
			return "ok";
			
		}else {			
			return id;			
		}
	}
	
	public void addUser(UserBean bean) {
		userDao.addUser(bean);
	}
	
	public void login(UserBean bean, UserBean loginUserBean) {
		UserBean tempBean = userDao.getUserLoginInfo(bean);
		if(tempBean!=null) {
			loginUserBean.setUser_idx(tempBean.getUser_idx());
			loginUserBean.setUser_grade(tempBean.getUser_grade());
			loginUserBean.setUser_name(tempBean.getUser_name());			
		}
	}
	public UserBean getUserInfo(int user_idx) {
		UserBean userInfoBean = userDao.getUserInfo(user_idx);
		return userInfoBean;
	}
	public void modifyUserInfo(UserBean bean) {		
		userDao.modifyUserInfo(bean);
	}
	
}
