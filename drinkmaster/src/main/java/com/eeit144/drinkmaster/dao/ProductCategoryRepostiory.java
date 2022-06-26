package com.eeit144.drinkmaster.dao;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.eeit144.drinkmaster.bean.ProductCategoryBean;
import com.eeit144.drinkmaster.bean.StoreBean;

public interface ProductCategoryRepostiory extends JpaRepository<ProductCategoryBean, Integer> {
	ProductCategoryBean findByProductCategoryNameLike(String name);
	Page<ProductCategoryBean> findByproductCategoryNameLike(Pageable pageable, String name);
//	Page<ProductCategoryBean> firdByStoreBean(StoreBean storBean);
	List<ProductCategoryBean> findByStoreBean(StoreBean storeBean);
}
