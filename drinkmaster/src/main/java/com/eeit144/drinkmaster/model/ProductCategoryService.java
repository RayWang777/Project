package com.eeit144.drinkmaster.model;

import org.springframework.data.domain.Page;


import com.eeit144.drinkmaster.bean.ProductCategoryBean;

public interface ProductCategoryService {

	public ProductCategoryBean findById(Integer id);

	public Page<ProductCategoryBean> findByPage(Integer pageNumber);

	public void insertCategory(ProductCategoryBean product);

	public void deleteById(Integer id);
}