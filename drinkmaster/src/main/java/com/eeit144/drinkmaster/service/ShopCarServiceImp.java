package com.eeit144.drinkmaster.service;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.bean.ShopCarBean;
import com.eeit144.drinkmaster.dao.ShopCarRepostiory;
import com.eeit144.drinkmaster.model.ShopCarService;

@Service
@Transactional
public class ShopCarServiceImp implements ShopCarService {

	@Autowired
	private ShopCarRepostiory shopCarDao;
	
	
	@Override
	public ShopCarBean findById(Integer id) {
		Optional<ShopCarBean> shopCarBean= shopCarDao.findById(id);
		 
		if(shopCarBean.isPresent()) {
			 return shopCarBean.get();
		 }
		 return null;	}

	
	@Override
	public Page<ShopCarBean> findAll(Pageable pageNumber) {
		return shopCarDao.findAll(pageNumber);
	}


	@Override
	public void deleteById(Integer id) {
		shopCarDao.deleteById(id);
	}

	@Override
	public void insertShopCar(ShopCarBean shopCarBean) {
		shopCarDao.save(shopCarBean);
	}
	
	@Override
	public Page<ShopCarBean> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 10 ,Sort.Direction.DESC ,"shopcarId");
		
		Page<ShopCarBean> page = shopCarDao.findAll(pgb);
		
		return page;
		
	}

	@Override
	public Page<ShopCarBean> findByStatus(Integer pageNumber, String status){
		Pageable pgb = PageRequest.of(pageNumber-1, 10 ,Sort.Direction.DESC ,"shopcarId");
		return shopCarDao.findByStatus1(pgb, status);
		
	}
}
