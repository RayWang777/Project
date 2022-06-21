package com.eeit144.drinkmaster.model;

import org.springframework.data.domain.Page;

import com.eeit144.drinkmaster.bean.ServiceBean;

public interface ServiceService {
	
	public ServiceBean findById(Integer id);

	public Page<ServiceBean> findByPage(Integer pageNumber);

	public void insertService(ServiceBean service);

	public void deleteById(Integer id);
	
	public ServiceBean getLatest() ;

	}
