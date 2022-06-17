package com.eeit144.drinkmaster.model;

import java.util.Optional;

import org.springframework.data.domain.Page;

import com.eeit144.drinkmaster.bean.UserBean;

public interface UserService {

	public Optional<UserBean> findById(Integer id);

	public Page<UserBean> findAll();

	public void insertUser();

	public void deleteById(Integer id);

}
