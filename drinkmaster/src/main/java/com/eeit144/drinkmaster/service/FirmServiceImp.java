package com.eeit144.drinkmaster.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.dao.FirmRepository;
import com.eeit144.drinkmaster.model.FirmService;



@Service
@Transactional
public class FirmServiceImp implements FirmService {

	private FirmRepository firmDao;
	
	
	@Autowired
	public FirmServiceImp(FirmRepository firmDao) {
		super();
		this.firmDao = firmDao;
	}

	@Override
	public Optional<FirmBean> findById(Integer id) {
		return firmDao.findById(id);
	}


	@Override
	public Page<FirmBean> findAll(Pageable pab) {
		return firmDao.findAll(pab);
	}



	@Override
	public void deleteById(Integer id) {
		firmDao.deleteById(id);
	}

	@Override
	public void insertFirm(FirmBean firm) {
		firmDao.save(firm);
	}

}
