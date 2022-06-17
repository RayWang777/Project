package com.eeit144.drinkmaster.model;

import java.util.Optional;

import org.springframework.data.domain.Page;

import com.eeit144.drinkmaster.bean.FirmBean;

public interface FirmService {

	public Optional<FirmBean> findById(Integer id);

	public Page<FirmBean> findAll();

	public void insertFirm();

	public void deleteById(Integer id);
	
}
