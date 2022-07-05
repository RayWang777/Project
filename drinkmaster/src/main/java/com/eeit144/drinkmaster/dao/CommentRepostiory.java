package com.eeit144.drinkmaster.dao;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.eeit144.drinkmaster.bean.CommentBean;
import com.eeit144.drinkmaster.bean.StoreBean;


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
	
	
	
//	public Page<CommentBean> findAllByOrderByScoreAsc(Integer storeId, Pageable pageable);
//	
//	public Page<CommentBean> findAllByOrderByScoreDesc(Integer storeId, Pageable pageable);
//	
//	public Page<CommentBean> findAllByOrderByCreateTimeAsc(Integer storeId, Pageable pageable);
//	
//	public Page<CommentBean> findAllByOrderByCreateTimeDesc(Integer storeId, Pageable pageable);
	
	
	@Query(value="select * from comment where userid = :userId and storeid = :storeId",nativeQuery = true)
	public List<CommentBean> findCommentByUseridAndStoreid(@Param(value="userId")Integer userId, @Param(value="storeId")Integer storeId);
	
//	public Page<CommentBean> findByStoreBean_storeId(Integer storeId, Pageable pageable);
	
	
	@Query(value="SELECT COUNT(storeid) FROM comment WHERE storeid = :storeId",nativeQuery = true)
	public Integer countStoreidByStoreid(@Param(value="storeId")Integer storeId);
	
	@Query(value="SELECT COUNT(score) FROM comment WHERE storeid = :storeId and score = :score",nativeQuery = true)
	public Integer countScoreByStoreidScore(@Param(value="storeId")Integer storeId,@Param(value="score")Integer score);

	
	@Query(value="SELECT ROUND(avg(score),1) FROM comment where storeid = :storeId",nativeQuery = true)
	public Double avgScoreByStoreid(@Param(value="storeId")Integer storeId);

	
	public List<CommentBean> findByStoreBean_storeId(Integer storeId);
	
	
	@Query(value="select * from comment where userid = :userId",nativeQuery = true)
	public List<CommentBean> findCommentByUserid(@Param(value="userId")Integer storeId);
	
	
	@Query(value="select storeid from comment group by storeid order by avg(score) DESC",nativeQuery = true)
	public List<Integer> findCommentByAvgDesc();
	
	@Query(value="select storeid from comment group by storeid order by avg(score) ASC",nativeQuery = true)
	public List<Integer> findCommentByAvgAsc();
	
	@Query(value="select storeid from ( select storeid,avg(score) as a from comment group by storeid) AS B where a > :avgScore",nativeQuery = true)
	public List<Integer> findStoreIdByAvgUPThanNum(Double avg);

	
	
	
	
}
