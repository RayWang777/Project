package com.eeit144.drinkmaster.model;

import java.util.Optional;

import org.springframework.data.domain.Page;

import com.eeit144.drinkmaster.bean.ShopCarBean;

public interface ShopCarService {

	public Optional<ShopCarBean> findById(Integer id);

	public Page<ShopCarBean> findAll();

	public void insertUser();

	public void deleteById(Integer id);
}
