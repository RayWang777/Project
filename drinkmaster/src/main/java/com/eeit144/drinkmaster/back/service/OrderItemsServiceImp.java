package com.eeit144.drinkmaster.back.service;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit144.drinkmaster.back.model.OrderItemsService;
import com.eeit144.drinkmaster.bean.OrderItems;
import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.ShopcarBean;
import com.eeit144.drinkmaster.dao.OrderItemsRepostiory;

@Service
@Transactional
public class OrderItemsServiceImp implements OrderItemsService{

	@Autowired
	private OrderItemsRepostiory oitemDao;
	
	
	@Override
	public OrderItems findById(Integer id) {
		Optional<OrderItems> orderItems = oitemDao.findById(id);
		if(orderItems.isPresent()) {
			 return orderItems.get();
		 }
		return null;
	}
	@Override
	public List<OrderItems> findByproductBean(ProductBean productBean){
		return oitemDao.findByproductBean(productBean);
	}
	
	@Override
	public Page<OrderItems> findAll(Pageable pageNumber) {
		return oitemDao.findAll(pageNumber);
	}

	@Override
	public void insertOrderItems(OrderItems orderItems) {
		oitemDao.save(orderItems);
	}

	@Override
	public void deleteById(Integer id) {
		oitemDao.deleteById(id);
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

	@Override
	public Page<OrderItems> findByOrderBean_orderId(Integer orderId,Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 10 ,Sort.Direction.DESC ,"orderBean_orderId");
		Page<OrderItems> page = oitemDao.findByOrderBean_orderId(orderId, pgb);
		return page;
	}

	@Override
	public List<OrderItems> findByOrderId(Integer orderId) {
		return oitemDao.findByOrderBean_orderId(orderId);
	};
	
	
	/**
	 * 
	 * @return top 3 producyid
	 * 
	 * 
	 */
	@Override
	public List<Integer> countByProductBean() {
		return oitemDao.countByproductBean();
	}
	@Override
	public void insertOrderItems(Set<OrderItems> items) {
		oitemDao.saveAll(items);
	}
	@Override
	public List<OrderItems> findOrderOrderitems() {
		return oitemDao.findOrderOrderitems();
	}
	

	
}
