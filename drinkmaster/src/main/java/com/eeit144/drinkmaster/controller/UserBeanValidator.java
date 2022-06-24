package com.eeit144.drinkmaster.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.eeit144.drinkmaster.bean.UserBean;

public class UserBeanValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return UserBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		UserBean ub = (UserBean) target;
		String emailCheck = new String();
		
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userAccount", "", "帳號不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userPassword", "", "密碼不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userAddress", "", "地址不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "", "姓名不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "", "電話不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gender", "", "性別不得為空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "role", "", "職權不得為空");
		
		if (ub.getUserAccount().length()<5) {
			errors.rejectValue("userAccount","", "帳號不能小於五個字元");
		}
		
		
	}

}
