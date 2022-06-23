package com.eeit144.drinkmaster.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit144.drinkmaster.bean.FirmBean;

@Repository
public interface FirmRepository extends JpaRepository<FirmBean, Integer> {

	Page<FirmBean> findAllByFirmNameContainingAndFirmPhoneContaining(String FirmName,String FirmPhone,Pageable pab);
	
}
