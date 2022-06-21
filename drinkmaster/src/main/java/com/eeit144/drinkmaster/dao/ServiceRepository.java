package com.eeit144.drinkmaster.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit144.drinkmaster.bean.ServiceBean;

@Repository
public interface ServiceRepository extends JpaRepository<ServiceBean, Integer> {
	public ServiceBean findFirstByOrderByAnswerDesc();
}