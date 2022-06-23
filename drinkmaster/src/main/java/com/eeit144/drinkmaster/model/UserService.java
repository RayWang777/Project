package com.eeit144.drinkmaster.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;

import com.eeit144.drinkmaster.bean.UserBean;

public interface UserService {

	public UserBean findById(Integer id);

	public Page<UserBean> findAll(Integer pageNumber);

	public void insertUser(UserBean userBean);

	public void deleteById(Integer id);

	public Page<UserBean> select(Integer pageNumber, String string);

	//firm need no delete
	public List<UserBean> findAllUsers();
}
