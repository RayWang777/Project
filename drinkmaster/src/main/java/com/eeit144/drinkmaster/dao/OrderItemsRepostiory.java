package com.eeit144.drinkmaster.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.eeit144.drinkmaster.bean.OrderItems;
import com.eeit144.drinkmaster.bean.ProductBean;

@Repository
public interface OrderItemsRepostiory extends JpaRepository<OrderItems, Integer> {

	public Page<OrderItems> findByOrderBean_orderId(Integer orderId, Pageable pageable);

	public List<OrderItems> findByOrderBean_orderId(Integer orderId);
	
	@Query(value = "select top(3) [productid] from [orderitems] group by [productid] order by  sum([quantity]) DESC ;",nativeQuery = true)
	public List<Integer> countByproductBean();
	
	public List<OrderItems> findByproductBean(ProductBean productBean);
	
	@Query(value="select * from orders as o right join orderitems as oi on o.orderid = oi.orderid ",nativeQuery = true)
	public List<OrderItems> findOrderOrderitems();

}
