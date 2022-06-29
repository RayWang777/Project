package com.eeit144.drinkmaster.dao;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.eeit144.drinkmaster.bean.ProductCategoryBean;
import com.eeit144.drinkmaster.bean.StoreBean;

public interface ProductCategoryRepostiory extends JpaRepository<ProductCategoryBean, Integer> {
	ProductCategoryBean findByProductCategoryNameLike(String ProductCategoryName);
	Page<ProductCategoryBean> findByproductCategoryNameLike(Pageable pageable, String productCategoryName);
	Page<ProductCategoryBean> findByStoreBean_storeNameLike(Pageable pageable,String storeName);
	Page<ProductCategoryBean> findByStoreBean_storeId(Pageable pageable,Integer storeId);
	List<ProductCategoryBean> findByStoreBean(StoreBean storeBean);
	Page<ProductCategoryBean> findByStoreBean_firmBean_firmId(Pageable pageable,Integer firmId);
	Page<ProductCategoryBean> findByproductCategoryNameLikeAndStoreBean_firmBean_firmId(Pageable pageable, String productCategoryName,Integer firmId );
	Page<ProductCategoryBean> findByStoreBean_storeNameLikeAndStoreBean_firmBean_firmId(Pageable pageable, String storeName,Integer firmId );
	Page<ProductCategoryBean> findByproductCategoryNameLikeAndStoreBean_storeId(Pageable pageable, String productCategoryName,Integer storeId );
}
