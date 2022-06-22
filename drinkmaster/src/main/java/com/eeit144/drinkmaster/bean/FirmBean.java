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

@Data
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
	
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "firmBean", cascade = CascadeType.ALL)
	private Set<SaleCodeBean> saleCodes = new LinkedHashSet<SaleCodeBean>();

	public FirmBean() {
	}

}
