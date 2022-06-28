package com.eeit144.drinkmaster.back.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit144.drinkmaster.back.model.ProductCategoryService;
import com.eeit144.drinkmaster.bean.ProductCategoryBean;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.dao.ProductCategoryRepostiory;

@Service
@Transactional
public class ProductCategoryServiceImp implements ProductCategoryService {
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

	@Override
	public List<ProductCategoryBean> findByStoreBean(StoreBean storBean) {
		return productCategoryDao.findByStoreBean(storBean);
	}

	public Page<ProductCategoryBean> findByPage(Integer pageNumber) {
		Pageable page = PageRequest.of(pageNumber - 1, 10, Sort.Direction.ASC, "productCategoryId");
		return productCategoryDao.findAll(page);
	}

	public Page<ProductCategoryBean> findByPage2(Integer pageNumber, Integer storeId) {
		Pageable page = PageRequest.of(pageNumber - 1, 10, Sort.Direction.ASC, "productCategoryId");
		return productCategoryDao.findByStoreBean_storeId(page, storeId);
	}

	public Page<ProductCategoryBean> findByPage3(Integer pageNumber, Integer frimId) {
		Pageable page = PageRequest.of(pageNumber - 1, 10, Sort.Direction.ASC, "productCategoryId");
		return productCategoryDao.findByStoreBean_firmBean_firmId(page, frimId);
	}

	public List<ProductCategoryBean> findAll() {
		return productCategoryDao.findAll();
	}

	public Page<ProductCategoryBean> select(Integer pageNumber, String name, String field) {
		Pageable page = PageRequest.of(pageNumber - 1, 10, Sort.Direction.ASC, "productCategoryId");
		if (field.equals("種類")) {
			return productCategoryDao.findByproductCategoryNameLike(page, "%" + name + "%");
		} else {
			return productCategoryDao.findByStoreBean_storeNameLike(page, "%" + name + "%");
		}
	}

	public Page<ProductCategoryBean> select2(Integer pageNumber, String name, String field, Integer firmId) {
		Pageable page = PageRequest.of(pageNumber - 1, 10, Sort.Direction.ASC, "productCategoryId");
		if (field.equals("種類")) {
			return productCategoryDao.findByproductCategoryNameLikeAndStoreBean_firmBean_firmId(page, "%" + name + "%",
					firmId);
		} else {
			return productCategoryDao.findByStoreBean_storeNameLikeAndStoreBean_firmBean_firmId(page, "%" + name + "%",
					firmId);
		}
	}

	public Page<ProductCategoryBean> select3(Integer pageNumber, String name, String field, Integer storeId) {
		Pageable page = PageRequest.of(pageNumber - 1, 10, Sort.Direction.ASC, "productCategoryId");

		return productCategoryDao.findByproductCategoryNameLikeAndStoreBean_storeId(page, "%" + name + "%", storeId);
	}
}
