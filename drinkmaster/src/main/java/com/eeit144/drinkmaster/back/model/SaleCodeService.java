package com.eeit144.drinkmaster.back.model;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.eeit144.drinkmaster.bean.SaleCodeBean;

public interface SaleCodeService {

	List<SaleCodeBean> findAllList();

	public List<SaleCodeBean> insertSaleCodeToDB(List<SaleCodeBean> saleCodeBean);
	
	public SaleCodeBean insertSaleCode(SaleCodeBean saleCodeBean);
	
	public Optional<SaleCodeBean> findBySaleCode(String salecode);
	
	public Page<SaleCodeBean> findAllValiedCode(Pageable pab);
	
	public void deleteSaleCodeMany(Date valieddate,List<Integer> saleCodeIds);
}
