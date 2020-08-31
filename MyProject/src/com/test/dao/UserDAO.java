package com.test.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.beans.UserBean;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public String checkUserId(String newId) {
		String id = sql.selectOne("user_mapper.checkUserId",newId);
		return id;
	}
	public void addUser(UserBean bean) {
		sql.insert("user_mapper.addUser",bean);
	}
	public UserBean getUserLoginInfo(UserBean bean) {
		UserBean loginUserBean = sql.selectOne("user_mapper.getUserLoginInfo",bean);
		return loginUserBean;
	}
	public UserBean getUserInfo(int user_idx) {
		UserBean userInfoBean = sql.selectOne("user_mapper.getUserInfo",user_idx);
		return userInfoBean;
	}
	public void modifyUserInfo(UserBean bean) {
		sql.update("user_mapper.modifyUserInfo",bean);
	}
	public List<UserBean> getUserList(){
		List<UserBean> list = sql.selectList("user_mapper.getUserList");
		return list;
	}
	public List<UserBean> getManagerList(){
		List<UserBean> list = sql.selectList("user_mapper.getManagerList");
		return list;
	}
	public void modifyUserGrade(UserBean userBean) {
		sql.update("user_mapper.modifyUserGrade",userBean);		
	}
}
