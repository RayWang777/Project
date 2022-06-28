package com.eeit144.drinkmaster.back.model;

import org.springframework.data.domain.Page;

import com.eeit144.drinkmaster.bean.ServiceBean;

public interface ServiceService {
	
	public ServiceBean findById(Integer serviceId);

	public Page<ServiceBean> findByPage(Integer pageNumber);

	public void insertService(ServiceBean service);

	public void deleteById(Integer serviceId);
	
	public ServiceBean getLatest() ;

}
