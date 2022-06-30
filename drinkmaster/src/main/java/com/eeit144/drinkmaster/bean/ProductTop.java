package com.eeit144.drinkmaster.bean;

public class ProductTop {
		
	private Integer productId;
	
	private String productName;
	
	private String productImage;
	
	private    StoreBean storeBean;
	
	private Long count;
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

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}



	public StoreBean getStoreBean() {
		return storeBean;
	}

	public void setStoreBean(StoreBean storeBean) {
		this.storeBean = storeBean;
	}

	public ProductTop() {
		// TODO Auto-generated constructor stub
	}

}
