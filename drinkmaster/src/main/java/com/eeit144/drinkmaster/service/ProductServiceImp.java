package com.eeit144.drinkmaster.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.domain.Pageable;
import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.dao.ProductRepostiory;
import com.eeit144.drinkmaster.model.ProductService;

@Service
@Transactional
public class ProductServiceImp implements ProductService {
	@Autowired
	private ProductRepostiory productDao;

	@Override
	public ProductBean findById(Integer id) {
		Optional<ProductBean> pro = productDao.findById(id);
		if (pro.isPresent()) {
			return pro.get();
		}
		return null;
	}

	@Override
	public void deleteById(Integer id) {

		productDao.deleteById(id);

	}

	@Override
	public void insertProduct(ProductBean product) {
		productDao.save(product);

	}

	public Page<ProductBean> findByPage(Integer pageNumber) {
		Pageable page = PageRequest.of(pageNumber - 1, 10, Sort.Direction.ASC, "productId");

		return productDao.findAll(page);

	}

	public Page<ProductBean> select(Integer pageNumber, String name, String field) {
		Pageable page = PageRequest.of(pageNumber - 1, 10, Sort.Direction.ASC, "productId");
		if (field.equals("品項")) {
			return productDao.findByproductNameLike(page, "%" + name + "%");
		} else if (field.equals("價格")) {
			if(isStr2Num(name)) {
			System.out.println(name);
			return productDao.findByprice(page, Integer.parseInt(name));}
			else return null;
		} else if (field.equals("溫度")) {
			return productDao.findBycoldHotLike(page, "%" + name + "%");
		} else if (field.equals("上架中")) {
			boolean temp = true;
			return productDao.findBystatus(page, temp);
		
			} else {
				boolean temp = false;
				return productDao.findBystatus(page, temp);
			}
	

		
	}
	// 判斷字串可否轉整數
	public static boolean isStr2Num(String str) { 
		try {
			Integer.parseInt(str);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

}
