package com.eeit144.drinkmaster.bean;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

public class ShopcarBuy {

private Map<Integer, OrderItems> cart = new LinkedHashMap< >();
	
	public ShopcarBuy() {
	}
	
	public Map<Integer, OrderItems>  getContent() { 
		return cart;
	}
	
	public void addToCart(Integer productId, OrderItems  oi) {
//		if (oi.getQuantity() <= 0 ) {
//			return;
//		}
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( cart.get(productId) == null ) {
		    cart.put(productId, oi);
		} 
//		else {
//	        // 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
//			OrderItems orderItems = cart.get(productId);
//			// 加購的數量：bean.getQuantity()
//			// 原有的數量：oBean.getQuantity()			
//			orderItems.setQuantity(oi.getQuantity() + orderItems.getQuantity());
//		}
	}

	public boolean modifyQty(Integer productId, Integer newQty) {
		if ( cart.get(productId) != null ) {
			OrderItems  bean = cart.get(productId);
		   bean.setQuantity(newQty);
	       return true;
		} else {
		   return false;
		}
	}
	// 刪除某項商品
	public Integer deleteProduct(Integer productId) {
		if ( cart.get(productId) != null ) {
	       cart.remove(productId);  // Map介面的remove()方法
	       return 1;
		} else {
		   return 0;
		}
	}
	public int getItemNumber(){   // ShoppingCart.itemNumber
		return cart.size();
	}
	//計算購物車內所有商品的合計金額(每項商品的單價*數量的總和)
	public double getSubtotal(){
		double subTotal = 0 ;
		Set<Integer> set = cart.keySet();
		for(int n : set){
			OrderItems oi = cart.get(n);
			Integer price = oi.getPrice();
			
			Integer qty = oi.getQuantity();
			subTotal += price * qty;
		}
		return subTotal;
	}
}
