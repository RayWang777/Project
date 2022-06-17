package com.eeit144.drinkmaster.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.dao.ProductRepostiory;
import com.eeit144.drinkmaster.model.ProductService;
@Service
@Transactional
public class ProductServiceImp implements ProductService {
	@Autowired
	private ProductRepostiory productDao;
	@Override
	public Optional<ProductBean> findById(Integer id) {
		
		return productDao.findById(id);
	}

	@Override
	public Page<ProductBean> findAll(Integer pageNumber) {
		PageRequest page =PageRequest.of(pageNumber-1, 10 ,Sort.Direction.ASC ,"productId");
		
		return productDao.findAll(page);
	}



	@Override
	public void deleteById(Integer id) {

     productDao.deleteById(id);
		
	}

	@Override
	public void insertProduct(ProductBean product) {
		productDao.save(product);
		
	}

}
