package com.eeit144.drinkmaster.dao;

import org.springframework.data.domain.Pageable;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import javax.servlet.http.Part;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;


import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.ProductCategoryBean;




public interface ProductRepostiory extends JpaRepository<ProductBean, Integer> {
	 Page<ProductBean> findByproductNameLike(Pageable pageable, String productName);
	 Page<ProductBean> findByprice(Pageable pageable, Integer price);
	 Page<ProductBean> findBycoldHotLike(Pageable pageable, String coldHot);
	 Page<ProductBean> findBystatus(Pageable pageable, boolean status);
	 Page<ProductBean> findByproductCategoryBean(Pageable pageable, ProductCategoryBean ProductCategoryBean);
}

