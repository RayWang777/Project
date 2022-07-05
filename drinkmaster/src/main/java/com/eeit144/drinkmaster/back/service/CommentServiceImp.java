package com.eeit144.drinkmaster.back.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
	
//	@Override
//	public Page<CommentBean> findAllByOrderByCreateTimeDesc(Integer storeId, Pageable pageable){
//		return commentDao.findAllByOrderByCreateTimeDesc(storeId, pageable);
//	}
//	
//	
//	@Override
//	public Page<CommentBean> findAllByOrderByCreateTimeAsc(Integer storeId, Pageable pageable){
//		return commentDao.findAllByOrderByCreateTimeAsc(storeId, pageable);
//	}
//	
//	@Override
//	public Page<CommentBean> findAllByOrderByScoreDesc(Integer storeId, Pageable pageable){
//		return commentDao.findAllByOrderByScoreDesc(storeId, pageable);
//	}
//	
//	@Override
//	public Page<CommentBean> findAllByOrderByScoreAsc(Integer storeId, Pageable pageable){
//		return commentDao.findAllByOrderByScoreAsc(storeId, pageable);
//	}
	
	
	
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

	@Override
	public Page<CommentBean> findCommentByStoreidPage(Integer storeId, Pageable pageable) {
		return commentDao.findCommentByStoreidPage(storeId,pageable);
	}
	
//	@Override
//	public Page<CommentBean> findPageByOrderByScoreAsc(Integer pageNumber){
//		return commentDao.findPageByOrderByScoreAsc(pageNumber);
//	}
	
	public Integer countStoreidByStoreid(Integer storeId) {
		return commentDao.countStoreidByStoreid(storeId);
	}
	
	public Integer countScoreByStoreidScore(Integer storeId, Integer score) {
		return commentDao.countScoreByStoreidScore(storeId, score);
	}

	

	public Double avgScoreByStoreid(Integer storeId) {
		return commentDao.avgScoreByStoreid(storeId);
	}

	
	
	public List<CommentBean> findCommentByUserid(Integer storeId) {
		return commentDao.findCommentByUserid(storeId);
	}
	
	
	public List<Integer> findCommentByAvgDesc(){
		return commentDao.findCommentByAvgDesc();
	}
	
	public List<Integer> findCommentByAvgAsc(){
		return commentDao.findCommentByAvgAsc();
	}
	
	
	public List<Integer> findStoreIdByAvgUPThanNum(Double avg){
		return commentDao.findStoreIdByAvgUPThanNum(avg);
	}
	
}
