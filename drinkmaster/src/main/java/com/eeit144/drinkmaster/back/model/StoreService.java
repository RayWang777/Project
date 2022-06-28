package com.eeit144.drinkmaster.back.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.StoreBean;


public interface StoreService {

	public Optional<StoreBean> findById(Integer id);

	public Page<StoreBean> findAll(Pageable pab);

	public void insertStore(StoreBean store);

	public void deleteById(Integer id);

	public Optional<StoreBean> findStoreByUserId(Integer userId);
	
	public Page<StoreBean> findStoreByFirmId(Integer firmId,Pageable pab);

	public FirmBean findFirmBeanByStoreId(Integer storeId);
	
	public List<StoreBean> findAllList();
	
	public List<StoreBean> findStoreByFirmId(Integer firmId);

}