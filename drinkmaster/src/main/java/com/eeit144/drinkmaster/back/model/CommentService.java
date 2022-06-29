package com.eeit144.drinkmaster.back.model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.eeit144.drinkmaster.bean.CommentBean;

public interface CommentService {
	
	public CommentBean findById(Integer id);

	public List<CommentBean> findAll();

	public void insertComment(CommentBean comment);

	public void deleteById(Integer id);
	
	public Page<CommentBean> findByPageTimeDesc(Integer StoreId, Pageable pageable);
	
	public Page<CommentBean> findByPageTimeAsc(Integer StoreId, Pageable pageable);
	
	public Page<CommentBean> findByPageScoreDesc(Integer StoreId, Pageable pageable);
	
	public Page<CommentBean> findByPageScoreAsc(Integer StoreId, Pageable pageable);

	public CommentBean getLastest();
		
	public List<CommentBean> findCommentByStoreid(Integer storeId);

	public Page<CommentBean> findCommentByStoreidPage(Integer storeId,Pageable pageable);

	public List<CommentBean> getScoreAsc();
	
	public List<CommentBean> getScoreDesc();
	
	public List<CommentBean> getCreateTimeAsc();
	
	public List<CommentBean> getCreateTimeDesc();
	
	public List<CommentBean> findCommentByUseridAndStoreid(Integer userId, Integer storeId);

//	public Page<CommentBean> findPageByOrderByScoreAsc(Integer pageNumber);
	
	public Integer countStoreidByStoreid(Integer storeId);
	
	public Integer countScoreByStoreidScore(Integer storeId, Integer score);
	
	
}
