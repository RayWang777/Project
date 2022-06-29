package com.eeit144.drinkmaster.back.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SalecodeServiceImp  {

	private final String salecode="hellosales";
	
	
	public Double salecodeStatus(String salecode){
		if( (this.salecode).equals(salecode)) {
			return 0.8;
		}
		return 1.0;				
	}
}
