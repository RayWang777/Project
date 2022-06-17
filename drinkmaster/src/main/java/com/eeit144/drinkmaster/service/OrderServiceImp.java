package com.eeit144.drinkmaster.service;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.dao.OrderRepostiory;
import com.eeit144.drinkmaster.model.OrderService;

@Service
@Transactional
public class OrderServiceImp implements OrderService {

	private OrderRepostiory orderDao;
	
	@Override
	public Optional<OrderBean> findById(Integer id) {
		return null;
	}

	@Override
	public Page<OrderBean> findAll(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber-1, 5 ,Sort.Direction.DESC ,"added");
		Page<OrderBean> page = orderDao.findAll(pgb);
		return page;
	}



	@Override
	public void deleteById(Integer id) {
		orderDao.deleteById(id);
	}

	@Override
	public void insertOrder(OrderBean odb) {
		orderDao.save(odb);
	}

}
