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

	@Column(name = "productname",nullable = false, columnDefinition = "nvarchar(50)")
	private String productName;

	@Column(name = "price",nullable = false)
	private Integer price;

	@Column(name = "productimage", columnDefinition = "nvarchar(max)")
	private String productImage;
	
	@Column(name = "coldhot", columnDefinition = "nvarchar(10)")
	private String coldHot;
	
	@Transient
	@Column(name = "productcategoryid")
	private Integer productCategoryId;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "productCategoryId",nullable = false)
	private ProductCategoryBean productCategoryBean;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "productBean",cascade = CascadeType.ALL)
	private Set<CommentBean> comments = new LinkedHashSet<CommentBean>();

	@Column(name = "status")
	private boolean status;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "productBean",cascade = CascadeType.ALL)
	private Set<OrderItems> orderItems = new LinkedHashSet<OrderItems>();  

	public ProductBean() {
		super();
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

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getColdHot() {
		return coldHot;
	}

	public void setColdHot(String coldHot) {
		this.coldHot = coldHot;
	}

	public Integer getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(Integer productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public ProductCategoryBean getProductCategoryBean() {
		return productCategoryBean;
	}

	public void setProductCategoryBean(ProductCategoryBean productCategoryBean) {
		this.productCategoryBean = productCategoryBean;
	}


	public Set<CommentBean> getComments() {
		return comments;
	}

	public void setComments(Set<CommentBean> comments) {
		this.comments = comments;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}


}
