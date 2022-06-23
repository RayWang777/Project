package com.eeit144.drinkmaster.service;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit144.drinkmaster.bean.ProductCategoryBean;
import com.eeit144.drinkmaster.dao.ProductCategoryRepostiory;
import com.eeit144.drinkmaster.model.ProductCategoryService;
@Service
@Transactional
public class ProductCategoryServiceImp implements ProductCategoryService{
	@Autowired
	private ProductCategoryRepostiory productCategoryDao;

	@Override
	public ProductCategoryBean findById(Integer id) {
		Optional<ProductCategoryBean> pro = productCategoryDao.findById(id);
		if (pro.isPresent()) {
			return pro.get();
		}
		return null;
	}

	@Override
	public void deleteById(Integer id) {

		productCategoryDao.deleteById(id);

	}

	@Override
	public void insertCategory(ProductCategoryBean product) {
		productCategoryDao.save(product);

	}

	public Page<ProductCategoryBean> findByPage(Integer pageNumber) {
		Pageable page = PageRequest.of(pageNumber - 1, 10, Sort.Direction.ASC, "productCategoryId");

		return productCategoryDao.findAll(page);

	}

}


