package com.eeit144.drinkmaster.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.eeit144.drinkmaster.bean.UserBean;
//import com.eeit144.drinkmaster.bean.UserBeanDTO;
import com.eeit144.drinkmaster.model.UserService;

@Controller
@Transactional

public class UserController {

//	@Autowired
//	private UserService userService;
//	
//	@PostMapping("/user/insert")
//	public String insertUser(@RequestBody UserBeanDTO user, Model m) {
//		Integer userId = user.getUserId();
//		
//		System.out.println(userId);
//		
//		UserBean userBean = new UserBean();
//		
//		userBean.setUserName(user.getUserName());
//		userBean.setUserAccount(user.getUserAccount());
//		userBean.setUserPassword(user.getUserPassword());
//		userBean.setUserAddress(user.getUserAddress());
//		userBean.setPhone(user.getPhone());
//		userBean.setRole(user.getRole());
//		userBean.setGender(user.getGender());
//		userBean.setCreatedate(user.getCreatedate());
//		
//		userService.insertUser(userBean);
//		
//		return null;
//	}
	
}
