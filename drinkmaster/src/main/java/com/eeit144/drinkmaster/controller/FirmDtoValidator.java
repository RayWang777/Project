package com.eeit144.drinkmaster.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.eeit144.drinkmaster.dto.FirmDTO;

public class FirmDtoValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return FirmDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firmName", "", "名稱不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firmAddress", "", "地址不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firmPhone", "", "電話不得為空");

	}

}
