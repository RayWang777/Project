package com.eeit144.drinkmaster.back.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.eeit144.drinkmaster.back.model.CommentService;
import com.eeit144.drinkmaster.bean.CommentBean;
import com.eeit144.drinkmaster.dao.CommentRepostiory;

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

	@Override
	public List<CommentBean> findAll() {
		
		List<CommentBean> findAll = commentDao.findAll();
		
		return findAll;
	}

	

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

	@Override
	public List<CommentBean> findCommentByStoreid(Integer storeId) {
		return commentDao.findCommentByStoreid(storeId);
	}
	
	
	public List<CommentBean> getScoreAsc() {
		return commentDao.findAllByOrderByScoreAsc();
	}
	
	public List<CommentBean> getScoreDesc() {
		return commentDao.findAllByOrderByScoreDesc();
	}
	
	public List<CommentBean> getCreateTimeAsc() {
		return commentDao.findAllByOrderByCreateTimeAsc();
	}
	
	public List<CommentBean> getCreateTimeDesc() {
		return commentDao.findAllByOrderByCreateTimeDesc();
	}
	
	@Override
	public List<CommentBean> findCommentByUseridAndStoreid(Integer userId, Integer storeId){
		return commentDao.findCommentByUseridAndStoreid(userId,storeId);
	}
	
	
}
