package com.eeit144.drinkmaster.dao;

import org.springframework.data.domain.Pageable;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;


import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.ProductCategoryBean;




public interface ProductRepostiory extends JpaRepository<ProductBean, Integer> {
	 Page<ProductBean> findByproductNameLike(Pageable pageable, String productName);
	 Page<ProductBean> findByproductNameLikeAndProductCategoryBean_StoreBean_storeId(Pageable pageable, String productName,Integer storeId);
	 Page<ProductBean> findByProductCategoryBean_productCategoryNameLikeAndProductCategoryBean_StoreBean_storeId(Pageable pageable, String categoryName,Integer storeId);
	 Page<ProductBean> findBycoldHotLikeAndProductCategoryBean_StoreBean_storeId(Pageable pageable, String coldHot,Integer storeId);
	 Page<ProductBean> findByprice(Pageable pageable, Integer price);
	 Page<ProductBean> findBycoldHotLike(Pageable pageable, String coldHot);
	 Page<ProductBean> findBystatus(Pageable pageable, boolean status);
	 Page<ProductBean> findBystatusAndProductCategoryBean_StoreBean_storeId(Pageable pageable, boolean status, Integer storeId);
	 Page<ProductBean> findByproductCategoryBean(Pageable pageable, ProductCategoryBean ProductCategoryBean);
	 Page<ProductBean> findByproductCategoryBean_productCategoryNameLike(Pageable pageable,String categoryName);
	 Page<ProductBean> findByproductCategoryBean_storeBean_storeId(Pageable pageable,Integer storeId);
	 Page<ProductBean> findByproductCategoryBean_storeBean_firmBean_firmId(Pageable pageable,Integer firmId);
	 Page<ProductBean> findByproductCategoryBean_storeBean_storeNameLike(Pageable pageable,String storeName);
	 Page<ProductBean> findByproductNameLikeAndProductCategoryBean_StoreBean_FirmBean_firmId(Pageable pageable,String productName,Integer firmId);
	 Page<ProductBean> findBycoldHotLikeAndProductCategoryBean_StoreBean_FirmBean_firmId(Pageable pageable,String coldHot,Integer firmId);
	 Page<ProductBean> findByProductCategoryBean_productCategoryNameLikeAndProductCategoryBean_storeBean_firmBean_firmId(Pageable pageable,String categoryName,Integer firmId);
	 Page<ProductBean> findBystatusAndProductCategoryBean_StoreBean_FirmBean_firmId(Pageable pageable,boolean status,Integer firmId);
	 Page<ProductBean> findByProductCategoryBean_StoreBean_storeNameLikeAndProductCategoryBean_storeBean_FirmBean_firmId(Pageable pageable,String storeName,Integer firmId);
	 List<ProductBean> findByproductCategoryBean(ProductCategoryBean categoryBean); 
}

