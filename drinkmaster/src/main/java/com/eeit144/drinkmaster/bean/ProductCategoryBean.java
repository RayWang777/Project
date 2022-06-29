package com.eeit144.drinkmaster.bean;

import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
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
@Table(name = "productcategory")
public class ProductCategoryBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "productcategoryid")
	private Integer productCategoryId;
	@Transient
	@Column(name = "storeid")
	private Integer storeId;
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "storeId",nullable = false)
	private StoreBean storeBean;
	@Column(name = "productcategoryname" ,columnDefinition = "nvarchar(20)")
	private String productCategoryName;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "productCategoryBean",cascade =CascadeType.ALL)
	private List<ProductBean> products = new LinkedList<ProductBean>();
	
	public ProductCategoryBean() {
		super();
	}

	public Integer getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(Integer productCategoryId) {
		this.productCategoryId = productCategoryId;
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

	public String getProductCategoryName() {
		return productCategoryName;
	}

	public void setProductCategoryName(String productCategoryName) {
		this.productCategoryName = productCategoryName;
	}

	public List<ProductBean> getProducts() {
		return products;
	}

	public void setProducts(List<ProductBean> products) {
		this.products = products;
	}
	
}
