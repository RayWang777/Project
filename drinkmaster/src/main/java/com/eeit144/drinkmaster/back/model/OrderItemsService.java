package com.eeit144.drinkmaster.back.model;

import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


import com.eeit144.drinkmaster.bean.OrderItems;
import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.ShopcarBean;




public interface OrderItemsService {
	
	public OrderItems findById(Integer id);

	
	public Page<OrderItems> findAll(Pageable pageNumber);

	
	public void insertOrderItems(OrderItems orderItems);

	
	public void deleteById(Integer id);
	
	
	public Page<OrderItems> findByPage(Integer pageNumber);
	
	
	public List<OrderItems> findAll();
	
	
	public Page<OrderItems> findByOrderBean_orderId(Integer orderId,Integer pageNumber);
	
	public List<OrderItems> findByOrderId(Integer orderId);
	
	public List<Integer> countByProductBean();
	
	public List<OrderItems> findByproductBean(ProductBean productBean);	


	public void insertOrderItems(Set<OrderItems> items);
	
	public List<OrderItems> findOrderOrderitems();
	
	public Page<OrderItems> findByorderBean_storeBean_storeId(Integer pageNumber,Integer storeId);

	public Page<OrderItems> findByorderBean_storeBean_firmBean_firmId(Integer pageNumber,Integer firmId);
}
