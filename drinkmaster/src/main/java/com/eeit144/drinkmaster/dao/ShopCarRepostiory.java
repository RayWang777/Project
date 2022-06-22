package com.eeit144.drinkmaster.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.eeit144.drinkmaster.bean.ShopCarBean;

public interface ShopCarRepostiory extends JpaRepository<ShopCarBean, Integer> {

	@Query(value = "select * from shoppingcar where shopcarid = :shopcarid",nativeQuery = true)
	public Page<ShopCarBean> findByshopcarId1(Pageable pageable,@Param(value="orderstatus") String orderStatus);

	
}
