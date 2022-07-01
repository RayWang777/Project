package com.eeit144.drinkmaster.back.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit144.drinkmaster.back.model.SaleCodeService;
import com.eeit144.drinkmaster.bean.FirmBanner;
import com.eeit144.drinkmaster.bean.SaleCodeBean;
import com.eeit144.drinkmaster.dao.SaleCodeRepository;

@Service
@Transactional
public class SaleCodeServiceImp  implements SaleCodeService {

	private final String salecode="hellosales";
	
	private SaleCodeRepository saleCodeDao;
	
	
	
	@Autowired
	public SaleCodeServiceImp(SaleCodeRepository saleCodeDao) {
		super();
		this.saleCodeDao = saleCodeDao;
	}
	

	public Double salecodeStatus(String salecode){
		if( (this.salecode).equals(salecode)) {
			return 0.8;
		}
		return 1.0;				
	}
	
	public void createSaleCode(String Key) {
		
	}


	@Override
	public List<SaleCodeBean> findAllList() {
		return saleCodeDao.findAll();
	}

	@Override
	public List<SaleCodeBean> insertSaleCodeToDB(List<SaleCodeBean> saleCodeBean) {
		return saleCodeDao.saveAll(saleCodeBean);
	}
}
