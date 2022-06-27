package com.eeit144.drinkmaster.dto;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import cn.afterturn.easypoi.excel.annotation.Excel;


public class OrderBeanxslx {

	@Excel(name="訂單編號", orderNum="1",width = 15)
	private Integer orderId;
	
	@Excel(name="使用者", orderNum="2",width = 15)
	private String userName;
	

	@Excel(name="店家", orderNum="3",width = 30)
	private String storeName;

	
	@Excel(name="商品", orderNum="4",width = 15)
	private String productName;
	

	@Excel(name="總金額", orderNum="5",width = 30)
	private Integer totalPrice;

	@Excel(name="狀態", orderNum="6",width = 15)
	private String orderStatus;

	@Excel(name="電話", orderNum="7",width = 30)
	private String orderPhone;

	@Excel(name="地址", orderNum="8",width = 50)
	private String orderAddress;

	@Excel(name="下單時間", orderNum="9",width = 30)
	private Date createTime;

	public OrderBeanxslx() {
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
