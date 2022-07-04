package com.eeit144.drinkmaster.bean;

import java.util.LinkedHashMap;
import java.util.Map;

public class ShopcarBean {

	private Integer productId;
	private String productName;
	private String productImage;
	private Integer price;
	private Integer quantity;
	private String sweet;
	private String coldhot;
	private Integer totalPrice;
	private String phone;
	private String address;
	private String storeName;
	private Integer storeId;
	
	public Integer getStoreId() {
		return storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}


	private Map<Integer, OrderItems> cart = new LinkedHashMap< >();
	
	private Map<Integer, ShopcarBean> shopcart = new LinkedHashMap< >();
	
	
	


	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public Map<Integer, ShopcarBean> getShopcart() {
		return shopcart;
	}

	public void setShopcart(Map<Integer, ShopcarBean> shopcart) {
		this.shopcart = shopcart;
	}

	public Map<Integer, OrderItems>  getContent() { 
		return cart;
	}
	
	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public Map<Integer, OrderItems> getCart() {
		return cart;
	}

	public void setCart(Map<Integer, OrderItems> cart) {
		this.cart = cart;
	}

	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public ShopcarBean() {
	}


	public Integer getProductId() {
		return productId;
	}


	public void setProductId(Integer productId) {
		this.productId = productId;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getProductImage() {
		return productImage;
	}


	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}


	public Integer getPrice() {
		return price;
	}


	public void setPrice(Integer price) {
		this.price = price;
	}


	public Integer getQuantity() {
		return quantity;
	}


	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}




	public String getSweet() {
		return sweet;
	}

	public void setSweet(String sweet) {
		this.sweet = sweet;
	}

	public String getColdhot() {
		return coldhot;
	}


	public void setColdhot(String coldhot) {
		this.coldhot = coldhot;
	}


	public Integer getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

}
