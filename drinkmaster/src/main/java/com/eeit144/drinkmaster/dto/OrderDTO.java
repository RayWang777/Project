package com.eeit144.drinkmaster.dto;

import java.util.Date;

import com.eeit144.drinkmaster.bean.ShopCarBean;
import com.eeit144.drinkmaster.bean.StoreBean;



public class OrderDTO {

	private Integer orderId;

	private Integer shopCarId;

//	private ShopCarBean shopCarBean;

	private Integer storeId;

//	private StoreBean storeBean;

	private Integer totalPrice;

	private String orderStatus;

	private String orderPhone;

	private String orderAddress;

	private Date createTime;

	public OrderDTO() {
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

//	public ShopCarBean getShopCarBean() {
//		return shopCarBean;
//	}
//
//	public void setShopCarBean(ShopCarBean shopCarBean) {
//		this.shopCarBean = shopCarBean;
//	}

	public Integer getStoreId() {
		return storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

//	public StoreBean getStoreBean() {
//		return storeBean;
//	}
//
//	public void setStoreBean(StoreBean storeBean) {
//		this.storeBean = storeBean;
//	}

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
