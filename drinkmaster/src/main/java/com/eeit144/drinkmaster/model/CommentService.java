package com.eeit144.drinkmaster.model;

import java.util.Optional;

import org.springframework.data.domain.Page;

import com.eeit144.drinkmaster.bean.CommentBean;

public interface CommentService {
	
	public Optional<CommentBean> findById(Integer id);

	public Page<CommentBean> findAll();

	public void insertComment(CommentBean comment);

	public void deleteById(Integer id);

}
