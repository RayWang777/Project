package com.eeit144.drinkmaster.dao;






import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;


import com.eeit144.drinkmaster.bean.OrderItems;

@Repository
public interface OrderItemsRepostiory extends JpaRepository<OrderItems, Integer> {


	
}
