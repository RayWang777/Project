package com.eeit144.drinkmaster.back.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit144.drinkmaster.back.model.ServiceService;
import com.eeit144.drinkmaster.bean.ServiceBean;
import com.eeit144.drinkmaster.dao.ServiceRepository;



@Service
@Transactional
public class ServiceServiceImp implements ServiceService {

	@Autowired
	private ServiceRepository serviceDao;
	
	@Override
	public ServiceBean findById(Integer serviceId) {
		Optional<ServiceBean> optional = serviceDao.findById(serviceId);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	@Override
	public Page<ServiceBean> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber-1,10,Sort.Direction.DESC,"answerTime");
		Page<ServiceBean> findAll = serviceDao.findAll(pgb);
		return findAll;
	}


	@Override
	public void deleteById(Integer serviceId) {
		serviceDao.deleteById(serviceId);
		
	}
	
	@Override
	public void insertService(ServiceBean service) {
		serviceDao.save(service);
	}
	
	@Override
	public ServiceBean getLatest() {
		return serviceDao.findFirstByOrderByAnswerTimeDesc();
	}
	
	
}
