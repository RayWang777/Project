package com.eeit144.drinkmaster.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit144.drinkmaster.bean.CommentBean;


@Repository
public interface CommentRepostiory extends JpaRepository<CommentBean, Integer> {

	public CommentBean findFirstByOrderByCreateTimeDesc();
	
	
}
