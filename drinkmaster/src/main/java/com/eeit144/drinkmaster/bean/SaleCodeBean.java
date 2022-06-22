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

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "salecode")
public class SaleCodeBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="salecodeid")
	private Integer saleCodeId;
	
	@Transient
	@Column(name="firmid")
	private Integer firmId;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="firmid")
	private FirmBean firmBean;
	
	@Column(name = "salecode")	
	private String saleCode;
	
	@Column(name="discount")
	private Float discount;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") // JSP DATE
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") // MVC DATE
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "validdate",nullable = false, columnDefinition = "smalldatetime")
	private Date validDate;
		
}
