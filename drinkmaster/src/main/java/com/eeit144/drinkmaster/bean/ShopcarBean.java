package com.eeit144.drinkmaster.bean;

import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

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
	
	private Map<Integer, OrderItems> shopcart = new LinkedHashMap<Integer, OrderItems>();
	
	
	
	public void additem(Integer productId,OrderItems orderItems) {
		
		if(shopcart.get(productId) == null) {
			shopcart.put(productId, orderItems);
	}else {
		OrderItems oiBean = shopcart.get(productId);
		oiBean.setQuantity(orderItems.getQuantity() + oiBean.getQuantity());
	}
}
	
	public boolean modifyQty(Integer productId, Integer newQty) {
		if ( shopcart.get(productId) != null ) {
			OrderItems  oibean = shopcart.get(productId);
		   oibean.setQuantity(newQty);
	       return true;
		} else {
		   return false;
		}
	}

	
	public Integer deleteBook(Integer productId) {
		if ( shopcart.get(productId) != null ) {
			shopcart.remove(productId);  
	       return 1;
		} else {
		   return 0;
		}
	}
	public int getItemNumber(){   // ShoppingCart.itemNumber
		return shopcart.size();
	}
	
	//計算購物車內所有商品的合計金額(每項商品的單價*數量的總和)
	public double getSubtotal(){
		double subTotal = 0 ;
		Set<Integer> set = shopcart.keySet();
		for(int n : set){
			OrderItems oi = shopcart.get(n);
			double price    = oi.getPrice();
//			double discount = oi.getDiscount();
			Integer qty      = oi.getQuantity();
			subTotal +=  price * qty;
		}
		return subTotal;
	}
	
	
	
	
	public Map<Integer, OrderItems> getShopcart() {
		return shopcart;
	}

	public void setShopcart(Map<Integer, OrderItems> shopcart) {
		this.shopcart = shopcart;
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




	
	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
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
