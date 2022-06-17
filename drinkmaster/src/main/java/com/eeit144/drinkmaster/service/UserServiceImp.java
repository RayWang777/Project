package com.eeit144.drinkmaster.service;

import java.util.Optional;

import org.springframework.data.domain.Page;

import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.model.UserService;

public class UserServiceImp implements UserService {

	@Override
	public Optional<UserBean> findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<UserBean> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertUser() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		
	}

}
