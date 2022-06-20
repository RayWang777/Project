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
@Table(name = "firm")
public class FirmBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "firmid")
	private Integer firmId;

	@Column(name = "firmname", nullable = false, columnDefinition = "nvarchar(50)")
	private String firmName;

	@Column(name = "firmaddress", columnDefinition = "nvarchar(255)")
	private String firmAddress;

	@Column(name = "firmPhone")
	private String firmPhone;

	@Column(name = "firmlogo", columnDefinition = "varbinary(max)")
	private byte[] firmLogo;

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "firmBean", cascade = CascadeType.ALL)
	private Set<StoreBean> stores = new LinkedHashSet<StoreBean>();

	@Transient
	@Column(name = "userId")
	private Integer userId;

	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId", nullable = false)
	private UserBean userBean;

	public FirmBean() {
	}

	public Integer getFirmId() {
		return firmId;
	}

	public void setFirmId(Integer firmId) {
		this.firmId = firmId;
	}

	public String getFirmName() {
		return firmName;
	}

	public void setFirmName(String firmName) {
		this.firmName = firmName;
	}

	public String getFirmAddress() {
		return firmAddress;
	}

	public void setFirmAddress(String firmAddress) {
		this.firmAddress = firmAddress;
	}

	public String getFirmPhone() {
		return firmPhone;
	}

	public void setFirmPhone(String firmPhone) {
		this.firmPhone = firmPhone;
	}

	public byte[] getFirmLogo() {
		return firmLogo;
	}

	public void setFirmLogo(byte[] firmLogo) {
		this.firmLogo = firmLogo;
	}

	public Set<StoreBean> getStores() {
		return stores;
	}

	public void setStores(Set<StoreBean> stores) {
		this.stores = stores;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public UserBean getUserBean() {
		return userBean;
	}

	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

}
