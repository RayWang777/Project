package com.eeit144.drinkmaster.model;

import java.util.Optional;

import org.springframework.data.domain.Page;

import com.eeit144.drinkmaster.bean.OrderBean;

public interface OrderService {
	
	public Optional<OrderBean> findById(Integer id);

	public Page<OrderBean> findAll();

	public void insertOrder();

	public void deleteById(Integer id);

}
