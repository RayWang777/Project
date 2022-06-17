package com.eeit144.drinkmaster.model;

import java.util.Optional;

import org.springframework.data.domain.Page;

import com.eeit144.drinkmaster.bean.OrderBean;

public interface OrderService {
	
	public Optional<OrderBean> findById(Integer id);

	public Page<OrderBean> findAll(Integer pageNumber);

	public void insertOrder(OrderBean odb);

	public void deleteById(Integer id);

}
