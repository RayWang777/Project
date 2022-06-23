package com.eeit144.drinkmaster.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.eeit144.drinkmaster.bean.UserBean;

public interface UserRepostiory extends JpaRepository<UserBean, Integer> {
	Page<UserBean> findByUserNameLike(Pageable pageable, String userName);
	
}
