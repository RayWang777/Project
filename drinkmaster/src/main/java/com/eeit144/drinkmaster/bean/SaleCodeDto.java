package com.eeit144.drinkmaster.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SaleCodeDto {

	private Integer saleCodeId;

	private Integer firmId;

	private Float discount;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") // JSP DATE
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") // MVC DATE
	private Date validDate;

	public SaleCodeDto() {
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
