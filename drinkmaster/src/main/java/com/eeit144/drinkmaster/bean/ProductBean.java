package com.eeit144.drinkmaster.bean;

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
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "product")
public class ProductBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "productid")
	private Integer productId;

	@Column(name = "productname",nullable = false)
	private String productName;

	@Column(name = "price",nullable = false)
	private Integer price;

	@Column(name = "productimage")
	private byte[] productImage;

	@Column(name = "coldhot")
	private String coldHot;

	@Transient
	@Column(name = "storeid")
	private Integer storeId;

	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "storeid",nullable = false)
	private StoreBean storeBean;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "productBean",cascade = CascadeType.ALL)
	private Set<ShopCarBean> shopCars = new LinkedHashSet<ShopCarBean>();
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "productBean",cascade = CascadeType.ALL)
	private Set<CommentBean> comments = new LinkedHashSet<CommentBean>();

	@Column(name = "status")
	private boolean status;

	public ProductBean() {
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

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public byte[] getProductImage() {
		return productImage;
	}

	public void setProductImage(byte[] productImage) {
		this.productImage = productImage;
	}

	public String getColdHot() {
		return coldHot;
	}

	public void setColdHot(String coldHot) {
		this.coldHot = coldHot;
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

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	
}
