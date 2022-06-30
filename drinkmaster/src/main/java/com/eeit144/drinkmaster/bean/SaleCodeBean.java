package com.eeit144.drinkmaster.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "salecode")
public class SaleCodeBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "salecodeid")
	private Integer saleCodeId;

	@Transient
	@Column(name = "firmid")
	private Integer firmId;

	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "firmid")
	private FirmBean firmBean;

	@Column(name = "salecode")
	private String saleCode;

	@Column(name = "discount")
	private Float discount;

	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8") // JSP DATE
	@DateTimeFormat(pattern = "yyyy-MM-dd") // MVC DATE
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "validdate", nullable = false, columnDefinition = "date")
	private Date validDate;

	// 檢查是否有時間，沒有的話依照現在時間產生
	@PrePersist // helper function 在物件轉換成 Persistent 狀態以前，做此方法
	public void onCreate() {
		if (validDate == null) {
			this.validDate = new Date();
		}
	}

	public Integer getSaleCodeId() {
		return saleCodeId;
	}

	public void setSaleCodeId(Integer saleCodeId) {
		this.saleCodeId = saleCodeId;
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

	public String getSaleCode() {
		return saleCode;
	}

	public void setSaleCode(String saleCode) {
		this.saleCode = saleCode;
	}

	public Float getDiscount() {
		return discount;
	}

	public void setDiscount(Float discount) {
		this.discount = discount;
	}

	public Date getValidDate() {
		return validDate;
	}

	public void setValidDate(Date validDate) {
		this.validDate = validDate;
	}

	public SaleCodeBean() {
		super();
	}

}
