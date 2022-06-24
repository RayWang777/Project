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
@Table(name = "store")
public class StoreBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "storeid")
	private Integer storeId;

	@Transient
	@Column(name = "firmid")
	private Integer firmId;

	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "firmId", nullable = false)
	private FirmBean firmBean;

	@Column(name = "storename", nullable = false, columnDefinition = "nvarchar(50)")
	private String storeName;

	@Column(name = "storeaddress", nullable = false, columnDefinition = "nvarchar(50)")
	private String storeAddress;

	@Column(name = "storephone", nullable = false)
	private String storePhone;

	@Column(name = "opentime", nullable = false)
	private String openTime;

	@Column(name = "longitude")
	private Double longitude;

	@Column(name = "latitude")
	private Double latitude;

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "storeBean", cascade = CascadeType.ALL)
	private Set<ProductCategoryBean> productCategory = new LinkedHashSet<ProductCategoryBean>();

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "storeBean", cascade = CascadeType.ALL)
	private Set<CommentBean> comments = new LinkedHashSet<CommentBean>();

	public StoreBean() {
	}

	public Integer getStoreId() {
		return storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	public Integer getFirmId() {
		return firmId;
	}

	public void setFirmId(Integer firmId) {
		this.firmId = firmId;
	}

	public FirmBean getFirmBean() {
		return firmBean;
	}

	public void setFirmBean(FirmBean firmBean) {
		this.firmBean = firmBean;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreAddress() {
		return storeAddress;
	}

	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}

	public String getStorePhone() {
		return storePhone;
	}

	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}

	public String getOpenTime() {
		return openTime;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Set<ProductCategoryBean> getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(Set<ProductCategoryBean> productCategory) {
		this.productCategory = productCategory;
	}

	public Set<CommentBean> getComments() {
		return comments;
	}

	public void setComments(Set<CommentBean> comments) {
		this.comments = comments;
	}

}
