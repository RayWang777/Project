package com.eeit144.drinkmaster.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.eeit144.drinkmaster.bean.OrderBean;

public interface OrderService {
	
	public OrderBean findById(Integer id);

	public Page<OrderBean> findAll(Pageable pageNumber);

	public void insertOrder(OrderBean orderBean);

	public void deleteById(Integer id);

	public Page<OrderBean> findByPage(Integer pageNumber);


}
