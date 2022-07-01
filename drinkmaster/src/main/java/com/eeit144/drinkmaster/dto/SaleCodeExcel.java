package com.eeit144.drinkmaster.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import cn.afterturn.easypoi.excel.annotation.Excel;

public class SaleCodeExcel {

	@Excel(name = "折扣碼", orderNum = "1", width = 30)
	private String saleCode;

	@Excel(name = "折扣", orderNum = "2", width = 30)
	private Double discount;

	@DateTimeFormat(pattern = "yyyy-MM-dd") // MVC DATE
	@Excel(name="有效時間", orderNum="3",width = 30)
	private Date validDate;

	public SaleCodeExcel() {
	}

	public String getSaleCode() {
		return saleCode;
	}

	public void setSaleCode(String saleCode) {
		this.saleCode = saleCode;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Date getValidDate() {
		return validDate;
	}

	public void setValidDate(Date validDate) {
		this.validDate = validDate;
	}

}
