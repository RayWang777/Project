package com.eeit144.drinkmaster.back.model;

import java.util.List;
import java.util.Optional;

import com.eeit144.drinkmaster.bean.SaleCodeBean;

public interface SaleCodeService {

	List<SaleCodeBean> findAllList();

	public List<SaleCodeBean> insertSaleCodeToDB(List<SaleCodeBean> saleCodeBean);
	
	public SaleCodeBean insertSaleCode(SaleCodeBean saleCodeBean);
	
	public Optional<SaleCodeBean> findBySaleCode(String salecode);
}
