package com.eeit144.drinkmaster.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit144.drinkmaster.bean.ServiceBean;
import com.eeit144.drinkmaster.dao.ServiceRepository;
import com.eeit144.drinkmaster.model.ServiceService;


@Service
@Transactional
public class ServiceServiceImp implements ServiceService {

	@Autowired
	private ServiceRepository serviceDao;
	
	@Override
	public ServiceBean findById(Integer id) {
		Optional<ServiceBean> optional = serviceDao.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	@Override
	public Page<ServiceBean> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber-1,3,Sort.Direction.DESC,"added");
		Page<ServiceBean> findAll = serviceDao.findAll(pgb);
		return findAll;
	}


	@Override
	public void deleteById(Integer id) {
		serviceDao.existsById(id);
		
	}
	
	@Override
	public void insertService(ServiceBean service) {
		serviceDao.save(service);
		
	}

}
