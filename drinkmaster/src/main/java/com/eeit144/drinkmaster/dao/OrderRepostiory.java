package com.eeit144.drinkmaster.dao;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit144.drinkmaster.bean.OrderBean;

@Repository
public interface OrderRepostiory extends JpaRepository<OrderBean, Integer> {


	public List<OrderBean> findByStoreBean_storeId(Integer storeId);
}
