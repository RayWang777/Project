package com.eeit144.drinkmaster.bean;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "orders")
public class OrderBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderid")
	private Integer orderId;

	@Transient
	@Column(name = "shopcarid")
	private Integer shopCarId;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "shopcarid")
	private ShopCarBean shopCarBean;

	@Transient
	@Column(name = "storeid")
	private Integer storeId;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "storeid")
	private StoreBean storeBean;

	@Column(name = "totalprice",nullable = false)
	private Integer totalPrice;

	@Column(name = "orderstatus",nullable = false, columnDefinition = "nvarchar(10)")
	private String orderStatus;

	@Column(name = "orderphone",nullable = false)
	private String orderPhone;

	@Column(name = "orderaddress",nullable = false, columnDefinition = "nvarchar(50)")
	private String orderAddress;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") // JSP DATE
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") // MVC DATE
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createtime",nullable = false, columnDefinition = "smalldatetime")
	private Date createTime;

	public OrderBean() {
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getShopCarId() {
		return shopCarId;
	}

	public void setShopCarId(Integer shopCarId) {
		this.shopCarId = shopCarId;
	}

	public ShopCarBean getShopCarBean() {
		return shopCarBean;
	}

	public void setShopCarBean(ShopCarBean shopCarBean) {
		this.shopCarBean = shopCarBean;
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

}
