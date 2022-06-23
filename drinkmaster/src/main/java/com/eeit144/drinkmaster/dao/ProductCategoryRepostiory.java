package com.eeit144.drinkmaster.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eeit144.drinkmaster.bean.ProductCategoryBean;

public interface ProductCategoryRepostiory extends JpaRepository<ProductCategoryBean, Integer> {

}
