package com.eeit144.drinkmaster.back.model;




import java.util.List;

import org.springframework.data.domain.Page;

import com.eeit144.drinkmaster.bean.ProductBean;

public interface ProductService {

	public ProductBean findById(Integer id);

	public Page<ProductBean> findByPage(Integer pageNumber);

	public void insertProduct(ProductBean product);

	public void deleteById(Integer id);
	
	public List<ProductBean> findAll();

	public Page<ProductBean> select(Integer pageNumber, String name, String field) ;
	
	public List<ProductBean> findAll(List<Integer> ids);
}

