package com.eeit144.drinkmaster.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.eeit144.drinkmaster.bean.FirmBean;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

public class SaleCodeDTO {

	private Integer saleCodeId;

	private Integer firmId;

	@JsonIgnore
	private FirmBean firmBean;

	private String saleCode;

	private Float discount;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") // JSP DATE
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") // MVC DATE
	private Date validDate;

	public SaleCodeDTO() {
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

}
