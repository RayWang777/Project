package com.eeit144.drinkmaster.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.eeit144.drinkmaster.bean.CommentBean;


@Repository
public interface CommentRepostiory extends JpaRepository<CommentBean, Integer> {

	public CommentBean findFirstByOrderByCreateTimeDesc();
	
	@Query(value="select * from comment where storeid = :storeId",nativeQuery = true)
	public List<CommentBean> findCommentByStoreid(@Param(value="storeId")Integer storeId);
	
	@Query(value="select * from comment where storeid = :storeId",nativeQuery = true)
	public Page<CommentBean> findCommentByStoreidPage(@Param(value="storeId")Integer storeId,Pageable pageable);

	//	@Query(value="select * from comment order by score DESC",nativeQuery = true)
//	public List<CommentBean> findCommentOrderByScoreDesc();
//	
//	@Query(value="select * from comment order by score ASC",nativeQuery = true)
//	public List<CommentBean> findCommentOrderByScoreAsc();
	
//	public Page<CommentBean> findPageByOrderByScoreAsc(Integer pageNumber);
	
	public List<CommentBean> findAllByOrderByScoreAsc();
	
	public List<CommentBean> findAllByOrderByScoreDesc();
	
	public List<CommentBean> findAllByOrderByCreateTimeAsc();
	
	public List<CommentBean> findAllByOrderByCreateTimeDesc();
	
	
	@Query(value="select * from comment where userid = :userId and storeid = :storeId",nativeQuery = true)
	public List<CommentBean> findCommentByUseridAndStoreid(@Param(value="userId")Integer userId, @Param(value="storeId")Integer storeId);
	
//	public Page<CommentBean> findByStoreBean_storeId(Integer storeId, Pageable pageable);
	
	
	
}
