package com.eeit144.drinkmaster.bean;

public class ShopcarBean {

	private Integer productId;
	private String productName;
	private String productImage;
	private Integer price;
	private Integer quantity;
	private String sweet;
	private String coldhot;
	private Integer totalPrice;
	
	
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
