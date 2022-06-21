package com.eeit144.drinkmaster.dao;



import org.springframework.data.jpa.repository.JpaRepository;


import com.eeit144.drinkmaster.bean.OrderBean;

public interface OrderRepostiory extends JpaRepository<OrderBean, Integer> {


}
