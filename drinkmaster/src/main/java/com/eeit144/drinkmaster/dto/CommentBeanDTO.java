package com.eeit144.drinkmaster.dto;

import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;


public class CommentBeanDTO {

	
	private Integer commentId;	
	private Integer userId;
	private Integer storeId;
	private Integer productId;
	private String score;
	private String content;
	private Integer scoreType;
	private Date createTime;
	private String commentPhoto;

	public CommentBeanDTO() {
	}

	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getStoreId() {
		return storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getScoreType() {
		return scoreType;
	}

	public void setScoreType(Integer scoreType) {
		this.scoreType = scoreType;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCommentPhoto() {
		return commentPhoto;
	}

	public void setCommentPhoto(String commentPhoto) {
		this.commentPhoto = commentPhoto;
	}

	@Override
	public String toString() {
		return "CommentBeanDTO [commentId=" + commentId + ", userId=" + userId + ", storeId=" + storeId + ", productId="
				+ productId + ", score=" + score + ", content=" + content + ", scoreType=" + scoreType + ", createTime="
				+ createTime + ", commentPhoto=" + commentPhoto + "]";
	}



}
