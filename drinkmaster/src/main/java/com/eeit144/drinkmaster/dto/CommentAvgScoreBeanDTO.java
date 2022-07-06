package com.eeit144.drinkmaster.dto;

public class CommentAvgScoreBeanDTO {

	private Integer storeId;
	private String storeName;
	private Integer firmId;
	private String firmName;
	private Double avgScore;
	private Double newAvgScore;
	private Integer countScore;
	

	public CommentAvgScoreBeanDTO() {
	}


	public Integer getStoreId() {
		return storeId;
	}


	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}


	public String getStoreName() {
		return storeName;
	}


	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}


	public Double getAvgScore() {
		return avgScore;
	}


	public void setAvgScore(Double avgScore) {
		this.avgScore = avgScore;
	}


	public Double getNewAvgScore() {
		return newAvgScore;
	}


	public void setNewAvgScore(Double newAvgScore) {
		this.newAvgScore = newAvgScore;
	}


	public String getFirmName() {
		return firmName;
	}


	public void setFirmName(String firmName) {
		this.firmName = firmName;
	}


	public Integer getFirmId() {
		return firmId;
	}


	public void setFirmId(Integer firmId) {
		this.firmId = firmId;
	}


	public Integer getCountScore() {
		return countScore;
	}


	public void setCountScore(Integer countScore) {
		this.countScore = countScore;
	}







}
