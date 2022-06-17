package com.eeit144.drinkmaster.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eeit144.drinkmaster.bean.StoreBean;

public interface StoreRepostiory extends JpaRepository<StoreBean, Integer> {

	
}
