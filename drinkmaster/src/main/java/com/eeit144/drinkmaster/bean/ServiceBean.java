package com.eeit144.drinkmaster.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "service")
public class ServiceBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="serviceid")
	private Integer serviceId;
	
	@Transient
	@Column(name = "userid")
	private Integer userId;
		
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userid")  //,nullable = false
	private UserBean userBean;
		
	@Column(name="answer",nullable = false, columnDefinition = "nvarchar(max)")
	private String answer;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8" )
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") 
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="answertime",nullable = false,columnDefinition = "datetime")
	private Date answerTime;
	
	@Column(name="status")
	private String status;

	@PrePersist
	public void onCreate() {
		if(answerTime == null) {
			this.answerTime = new Date();
		}
	}
	public ServiceBean() {
	}

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Date getAnswerTime() {
		return answerTime;
	}

	public void setAnswerTime(Date answerTime) {
		this.answerTime = answerTime;
	}
	public UserBean getUserBean() {
		return userBean;
	}
	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	
}
