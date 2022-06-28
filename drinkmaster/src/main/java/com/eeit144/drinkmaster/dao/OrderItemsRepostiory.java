package com.eeit144.drinkmaster.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit144.drinkmaster.bean.OrderItems;

@Repository
public interface OrderItemsRepostiory extends JpaRepository<OrderItems, Integer> {

	public Page<OrderItems> findByOrderBean_orderId(Integer orderId, Pageable pageable);

	public List<OrderItems> findByOrderBean_orderId(Integer orderId);

}
