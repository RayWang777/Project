package com.eeit144.drinkmaster.bean;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

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

@Entity
@Table(name = "orders")
public class OrderBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderid")
	@Excel(name="訂單編號", orderNum="1",width = 15)
	private Integer orderId;
	
	@Transient
	@Column(name = "userid")
	@Excel(name="使用者編號", orderNum="2",width = 15)
	private Integer userId;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userid",nullable = false)
	private UserBean userBean;

	@Transient
	@Column(name = "storeid")
	@Excel(name="店家編號", orderNum="3",width = 15)
	private Integer storeId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "storeid")
	private StoreBean storeBean;	

	@Column(name = "totalprice",nullable = false)
	@Excel(name="總金額", orderNum="5",width = 30)
	private Integer totalPrice;

	@Column(name = "orderstatus",nullable = false, columnDefinition = "nvarchar(10)")
	@Excel(name="狀態", orderNum="6",width = 15)
	private String orderStatus;

	@Column(name = "orderphone",nullable = false)
	@Excel(name="電話", orderNum="7",width = 30)
	private String orderPhone;

	@Column(name = "orderaddress",nullable = false, columnDefinition = "nvarchar(50)")
	@Excel(name="地址", orderNum="8",width = 50)
	private String orderAddress;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") // JSP DATE
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") // MVC DATE
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createtime",nullable = false, columnDefinition = "smalldatetime")
	@Excel(name="下單時間", orderNum="9",width = 30)
	private Date createTime;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "orderBean",cascade = CascadeType.ALL)
	private Set<OrderItems> orderItems = new LinkedHashSet<OrderItems>(); 

	public OrderBean() {
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getUserId() {
		return userBean.getUserId();
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public UserBean getUserBean() {
		return userBean;
	}

	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	public Integer getStoreId() {
		return storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	public StoreBean getStoreBean() {
		return storeBean;
	}

	public void setStoreBean(StoreBean storeBean) {
		this.storeBean = storeBean;
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

	public Set<OrderItems> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(Set<OrderItems> orderItems) {
		this.orderItems = orderItems;
	}

	

}
