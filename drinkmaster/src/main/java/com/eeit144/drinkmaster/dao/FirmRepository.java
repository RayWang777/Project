package com.eeit144.drinkmaster.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eeit144.drinkmaster.bean.FirmBean;

public interface FirmRepository extends JpaRepository<FirmBean, Integer> {

	
}
