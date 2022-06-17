package com.eeit144.drinkmaster.model;

import java.util.Optional;

import org.springframework.data.domain.Page;

import com.eeit144.drinkmaster.bean.ServiceBean;

public interface ServiceService {
	
	public Optional<ServiceBean> findById(Integer id);

	public Page<ServiceBean> findAll();

	public void insertUser();

	public void deleteById(Integer id);

}
