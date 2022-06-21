package com.eeit144.drinkmaster.model;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.eeit144.drinkmaster.bean.StoreBean;

public interface StoreService {

	public Optional<StoreBean> findById(Integer id);

	public Page<StoreBean> findAll(Pageable pab);

	public void insertStore(StoreBean store);

	public void deleteById(Integer id);
	
}
