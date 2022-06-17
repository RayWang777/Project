package com.eeit144.drinkmaster.service;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.eeit144.drinkmaster.bean.CommentBean;
import com.eeit144.drinkmaster.model.CommentService;

@Service
public class CommentServiceImp implements CommentService {

	@Override
	public Optional<CommentBean> findById(Integer id) {
		return null;
	}

	@Override
	public Page<CommentBean> findAll() {
		return null;
	}

	

	@Override
	public void deleteById(Integer id) {
	}

	@Override
	public void insertComment(CommentBean comment) {
		
	}

}
