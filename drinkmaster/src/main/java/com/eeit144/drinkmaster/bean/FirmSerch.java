package com.eeit144.drinkmaster.bean;

import lombok.Data;

@Data
public class FirmSerch {
	// serchFirmName
	private String sfn;
	// serchFirmPhone
	private String sfp;
	// serchFirmAddress
	private String sfa;
	// serchUserName
	private String sun;
	// page
	private Integer p;
	// size
	private Integer s;
	// column
	private Integer c;
	// direct
	private boolean d;

	public FirmSerch() {
		this.sfn = "";
		this.sfp = "";
		this.sfa = "";
		this.sun = "";
		this.p = 1;
		this.s = 5;
		this.c = 1;
		this.d = true;
	}

}
