package com.eeit144.drinkmaster.model;

import java.util.List;

import org.springframework.data.domain.Page;


import com.eeit144.drinkmaster.bean.ProductCategoryBean;
import com.eeit144.drinkmaster.bean.StoreBean;

public interface ProductCategoryService {

	public ProductCategoryBean findById(Integer id);

	public Page<ProductCategoryBean> findByPage(Integer pageNumber);

	public void insertCategory(ProductCategoryBean product);

	public void deleteById(Integer id);
	
	public List<ProductCategoryBean> findByStoreBean(StoreBean storeBean);
}