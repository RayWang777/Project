package com.eeit144.drinkmaster.service;

import java.util.Optional;

import org.springframework.data.domain.Page;

import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.model.OrderService;

public class OrderServiceImp implements OrderService {

	@Override
	public Optional<OrderBean> findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<OrderBean> findAll() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertOrder() {
		// TODO Auto-generated method stub
		
	}

}
