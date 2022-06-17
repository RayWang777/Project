package com.eeit144.drinkmaster.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eeit144.drinkmaster.bean.UserBean;

public interface UserRepostiory extends JpaRepository<UserBean, Integer> {

	
}
