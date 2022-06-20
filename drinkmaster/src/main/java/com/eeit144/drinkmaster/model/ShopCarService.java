package com.eeit144.drinkmaster.model;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.bean.ShopCarBean;

public interface ShopCarService {

	public ShopCarBean findById(Integer id);

	public Page<ShopCarBean> findAll(Pageable pageNumber);

	public void insertShopCar(ShopCarBean shopCarBean);

	public void deleteById(Integer id);
	
	public Page<ShopCarBean> findByPage(Integer pageNumber);
}
