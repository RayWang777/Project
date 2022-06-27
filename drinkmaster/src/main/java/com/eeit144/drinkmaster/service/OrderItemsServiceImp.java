package com.eeit144.drinkmaster.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit144.drinkmaster.bean.OrderItems;
import com.eeit144.drinkmaster.dao.OrderItemsRepostiory;
import com.eeit144.drinkmaster.model.OrderItemsService;

@Service
@Transactional
public class OrderItemsServiceImp implements OrderItemsService{

	@Autowired
	private OrderItemsRepostiory oitemDao;
	
	
	@Override
	public OrderItems findById(Integer id) {
		return null;
	}

	@Override
	public Page<OrderItems> findAll(Pageable pageNumber) {
		return oitemDao.findAll(pageNumber);
	}

	@Override
	public void insertOrder(OrderItems orderItems) {
		
	}

	@Override
	public void deleteById(Integer id) {
		
	}

	@Override
	public List<OrderItems> findAll() {
		return null;
	}
	
	@Override
	public Page<OrderItems> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 10 ,Sort.Direction.DESC ,"orderItemId");
		
		Page<OrderItems> page = oitemDao.findAll(pgb);
		
		return page;
	}

}
