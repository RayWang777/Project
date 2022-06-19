package com.eeit144.drinkmaster.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eeit144.drinkmaster.bean.CommentBean;

public interface CommentRepostiory extends JpaRepository<CommentBean, Integer> {

	
}
