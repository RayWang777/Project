package com.eeit144.drinkmaster.back.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit144.drinkmaster.back.model.OrderService;
import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.bean.ProductBean;

import com.eeit144.drinkmaster.dao.OrderRepostiory;
import com.eeit144.drinkmaster.dao.ProductRepostiory;

@Service
@Transactional
public class OrderServiceImp implements OrderService {

	@Autowired
	private OrderRepostiory orderDao;
	
	@Autowired
	private ProductRepostiory productDao;
	
//	@Autowired
//	public OrderServiceImp(OrderRepostiory orderDao) {
//		super();
//		this.orderDao = orderDao;
//	}
	
	@Override
	public OrderBean findById(Integer id) {
		Optional<OrderBean> orderBean= orderDao.findById(id);
		 
		if(orderBean.isPresent()) {
			 return orderBean.get();
		 }
		 return null;
	}


	@Override
	public Page<OrderBean> findAll(Pageable pageNumber) {
		return orderDao.findAll(pageNumber);
	}

	@Override
	public void deleteById(Integer id) {
		orderDao.deleteById(id);
	}

	@Override
	public void insertOrder(OrderBean odb) {
		orderDao.save(odb);
	}
	
	@Override
	public List<Integer> countBystoreId(){
		return orderDao.countBystoreId();
	}
	
	@Override
	public Page<OrderBean> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 10 ,Sort.Direction.DESC ,"orderId");
		
		Page<OrderBean> page = orderDao.findAll(pgb);
		
		return page;
		
	}
	

	@Override
	public List<OrderBean> findBystoreId(Integer storeId){
		return orderDao.findByStoreBean_storeId(storeId);
	}
	

	
	@Override
	public Page<OrderBean> findByorderStatus(Integer pageNumber, String orderStatus){
		Pageable pgb = PageRequest.of(pageNumber-1, 10 ,Sort.Direction.DESC ,"orderId");
		return orderDao.findByorderStatus1(pgb, orderStatus);
	};
	
	@Override
	public Page<OrderBean> selectById(Integer pageNumber, Integer orderId) {
		Pageable pgb = PageRequest.of(pageNumber-1, 10 ,Sort.Direction.DESC ,"orderId");
		Page<OrderBean> page = orderDao.findByorderIdLike(pgb, orderId);
		
		return page;
	}
	
	@Override
	public List<ProductBean> findAllProducts(){
		return productDao.findAll();
	};

	
	@Override
	public List<OrderBean> findAll(){
		return orderDao.findAll();
	}


	@Override
	public OrderBean findFirstByOrderByCreateTimeDesc() {
		return orderDao.findFirstByOrderByCreateTimeDesc();
	};
}
