package com.eeit144.drinkmaster.bean;

public class FirmVo {

	private Integer firmId;

	private String firmName;

	private String firmPic;

	public FirmVo() {
		super();
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

	public String getFirmPic() {
		return firmPic;
	}

	public void setFirmPic(Integer firmId) {
		String url ="http://localhost:8081/drinkmaster/front/firm/"+firmId+"/photo";
		this.firmPic = url;
	}
}
