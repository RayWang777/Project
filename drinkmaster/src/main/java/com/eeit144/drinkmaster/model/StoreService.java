package com.eeit144.drinkmaster.model;

import java.util.Optional;

import org.springframework.data.domain.Page;

import com.eeit144.drinkmaster.bean.StoreBean;

public interface StoreService {

	public Optional<StoreBean> findById(Integer id);

	public Page<StoreBean> findAll();

	public void insertStore();

	public void deleteById(Integer id);
	
}
