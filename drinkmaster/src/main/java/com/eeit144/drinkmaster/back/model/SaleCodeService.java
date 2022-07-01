package com.eeit144.drinkmaster.back.model;

import java.util.List;


import com.eeit144.drinkmaster.bean.SaleCodeBean;

public interface SaleCodeService {

	List<SaleCodeBean> findAllList();

	public List<SaleCodeBean> insertSaleCodeToDB(List<SaleCodeBean> saleCodeBean);
}
