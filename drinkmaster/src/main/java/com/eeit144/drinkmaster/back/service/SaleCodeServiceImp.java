package com.eeit144.drinkmaster.back.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit144.drinkmaster.back.model.SaleCodeService;
import com.eeit144.drinkmaster.dao.SaleCodeRepository;

@Service
@Transactional
public class SaleCodeServiceImp  implements SaleCodeService {

	private final String salecode="hellosales";
	
	private SaleCodeRepository saleCodeRepository;
	
	
	
	@Autowired
	public SaleCodeServiceImp(SaleCodeRepository saleCodeRepository) {
		super();
		this.saleCodeRepository = saleCodeRepository;
	}
	

	public Double salecodeStatus(String salecode){
		if( (this.salecode).equals(salecode)) {
			return 0.8;
		}
		return 1.0;				
	}
	
	public void createSaleCode(String Key) {
		
	}

	
}
