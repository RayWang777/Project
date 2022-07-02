package com.eeit144.drinkmaster.back.model;

import java.util.List;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.bean.ProductBean;



public interface OrderService {
	
	public OrderBean findById(Integer id);

	
	public Page<OrderBean> findAll(Pageable pageNumber);

	
	public void insertOrder(OrderBean orderBean);

	
	public void deleteById(Integer id);

	
	public Page<OrderBean> findByPage(Integer pageNumber);

	
	public List<OrderBean> findBystoreId(Integer storeId);
	
	
	public Page<OrderBean> findByorderStatus(Integer pageNumber, String orderStatus);

	
	public Page<OrderBean> selectById(Integer pageNumber, Integer orderId);
	
	
	public List<ProductBean> findAllProducts();
	
	
	public List<OrderBean> findAll();
	
	public List<Integer> countBystoreId();
}
