package com.eeit144.drinkmaster.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.eeit144.drinkmaster.bean.OrderBean;

public interface OrderRepostiory extends JpaRepository<OrderBean, Integer> {


}
