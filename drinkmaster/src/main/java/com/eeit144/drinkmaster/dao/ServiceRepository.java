package com.eeit144.drinkmaster.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eeit144.drinkmaster.bean.ServiceBean;

public interface ServiceRepository extends JpaRepository<ServiceBean, Integer> {

	public ServiceBean findFirstByOrderByAddedDesc();
}