package com.eeit144.drinkmaster.model;




import org.springframework.data.domain.Page;

import com.eeit144.drinkmaster.bean.ProductBean;

public interface ProductService {

	public ProductBean findById(Integer id);

	public Page<ProductBean> findByPage(Integer pageNumber);

	public void insertProduct(ProductBean product);

	public void deleteById(Integer id);
}
