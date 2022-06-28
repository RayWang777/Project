package com.eeit144.drinkmaster.back.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.eeit144.drinkmaster.back.model.FirmBannerService;
import com.eeit144.drinkmaster.bean.FirmBanner;
import com.eeit144.drinkmaster.dao.FirmBannerRepository;

@Service
public class FirmBannerServiceImp implements FirmBannerService{

	private FirmBannerRepository firmBannerDao;

	@Autowired
	public FirmBannerServiceImp(FirmBannerRepository firmBannerDao) {
		super();
		this.firmBannerDao = firmBannerDao;
	}
	
	@Override
	public Page<FirmBanner> findAll(Pageable pab){
		return firmBannerDao.findAll(pab);
	}
	
	@Override
	public Page<FirmBanner> findByfirmId(Integer firmId,Pageable pab){
		return firmBannerDao.findByFirmBean_firmId(firmId, pab);
	}
	
	
	
}
