package com.eeit144.drinkmaster.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.eeit144.drinkmaster.bean.CommentBean;
import com.eeit144.drinkmaster.dao.CommentRepostiory;
import com.eeit144.drinkmaster.model.CommentService;

@Service
public class CommentServiceImp implements CommentService {
	
	@Autowired
	private CommentRepostiory commentDao;

	@Override
	public void insertComment(CommentBean comment) {
		
		commentDao.save(comment);
		
	}

	@Override
	public CommentBean findById(Integer id) {
		Optional<CommentBean> optional = commentDao.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		
		return null;
	}

//	@Override
//	public Page<CommentBean> findAll() {
//		return null;
//	}

	

	@Override
	public void deleteById(Integer id) {
		commentDao.deleteById(id);
	}
	
	@Override
	public Page<CommentBean> findByPage(Integer pageNumber){
		
		Pageable pgb = PageRequest.of(pageNumber-1, 3 , Sort.Direction.DESC ,"createTime");
		
		
		
		Page<CommentBean> page = commentDao.findAll(pgb);
		
		return page;
	}
	
	
	public CommentBean getLastest() {
		return commentDao.findFirstByOrderByCreateTimeDesc();
}

	
}
