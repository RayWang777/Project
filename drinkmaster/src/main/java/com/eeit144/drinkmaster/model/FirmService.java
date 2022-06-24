package com.eeit144.drinkmaster.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.dto.FirmDTO;

public interface FirmService {

	public Optional<FirmBean> findById(Integer id);

	public Page<FirmBean> findAll(Pageable pab);

	public void insertFirm(FirmBean firm);

	public void deleteById(Integer id);

	public FirmDTO change(FirmBean firm);
	
	public Page<FirmBean> findAllByFirmNameOrFirmPhone(String FirmName,String FirmPhone,Pageable pab);
	
	public Page<FirmBean> findAll2(Example<FirmBean> firm,Pageable pab);
	
	public void deleteByIds(List<Integer> ids);
}
