package com.eeit144.drinkmaster.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

public class SaleCodeVO {


	
	private String saleCode;

	private Float discount;

	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8") // JSP DATE
	@DateTimeFormat(pattern = "yyyy-MM-dd") // MVC DATE
	private Date validDate;

	
	
}
