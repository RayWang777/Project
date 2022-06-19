package com.eeit144.drinkmaster.model;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.eeit144.drinkmaster.bean.FirmBean;

public interface FirmService {

	public Optional<FirmBean> findById(Integer id);

	public Page<FirmBean> findAll(Pageable pab);

	public void insertFirm(FirmBean firm);

	public void deleteById(Integer id);
	
}
