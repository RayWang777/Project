package com.eeit144.drinkmaster.model;

import java.util.Optional;

import org.springframework.data.domain.Page;

import com.eeit144.drinkmaster.bean.ProductBean;

public interface ProductService {

	public Optional<ProductBean> findById(Integer id);

	public Page<ProductBean> findAll();

	public void insertUser();

	public void deleteById(Integer id);
}
