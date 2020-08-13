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
			System.out.println("ok");
			return "ok";
			
		}else {
			System.out.println(id);
			return id;
			
		}
	}
	public void addUser(UserBean bean) {
		userDao.addUser(bean);
	}
	
}
