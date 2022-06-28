package com.eeit144.drinkmaster.back.model;

import java.util.List;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


import com.eeit144.drinkmaster.bean.OrderItems;




public interface OrderItemsService {
	
	public OrderItems findById(Integer id);

	
	public Page<OrderItems> findAll(Pageable pageNumber);

	
	public void insertOrder(OrderItems orderItems);

	
	public void deleteById(Integer id);
	
	
	public Page<OrderItems> findByPage(Integer pageNumber);
	
	
	public List<OrderItems> findAll();
}
