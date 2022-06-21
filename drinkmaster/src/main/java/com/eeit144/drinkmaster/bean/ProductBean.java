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

import lombok.Data;

@Entity
@Table(name = "product")
@Data
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
		super();
	}

	
	
}
