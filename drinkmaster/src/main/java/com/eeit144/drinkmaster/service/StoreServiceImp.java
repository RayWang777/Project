package com.eeit144.drinkmaster.service;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.dao.StoreRepostiory;
import com.eeit144.drinkmaster.model.StoreService;

@Service
@Transactional
public class StoreServiceImp implements StoreService {
	
	private StoreRepostiory storeDao;
	
	@Autowired
	public StoreServiceImp(StoreRepostiory storeDao) {
		super();
		this.storeDao = storeDao;
	}

	@Override
	public Optional<StoreBean> findById(Integer id) {
		return storeDao.findById(id);
	}

	@Override
	public Page<StoreBean> findAll(Pageable pab) {
		return storeDao.findAll(pab);
	}


	@Override
	public void deleteById(Integer id) {
		storeDao.deleteById(id);
	}

	@Override
	public void insertStore(StoreBean store) {
		storeDao.save(store);
	}

}
