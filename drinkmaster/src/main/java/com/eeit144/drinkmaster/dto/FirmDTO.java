package com.eeit144.drinkmaster.dto;

import com.eeit144.drinkmaster.bean.UserBean;

import lombok.Data;

@Data
public class FirmDTO {

	private Integer firmId;

	private String firmName;

	private String firmAddress;

	private String firmPhone;

	private String firmLogo;
	
	private UserBean userBean;
	
	private Integer userId;

	public FirmDTO() {
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



	public String getFirmLogo() {
		return firmLogo;
	}

	public void setFirmLogo(String firmLogo) {
		this.firmLogo = firmLogo;
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
