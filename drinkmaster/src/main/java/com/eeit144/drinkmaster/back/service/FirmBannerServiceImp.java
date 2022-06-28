package com.eeit144.drinkmaster.back.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.eeit144.drinkmaster.back.model.FirmBannerService;
import com.eeit144.drinkmaster.bean.FirmBanner;
import com.eeit144.drinkmaster.dao.FirmBannerRepository;

@Service
public class FirmBannerServiceImp implements FirmBannerService {

	private FirmBannerRepository firmBannerDao;

	@Autowired
	public FirmBannerServiceImp(FirmBannerRepository firmBannerDao) {
		super();
		this.firmBannerDao = firmBannerDao;
	}

	@Override
	public List<FirmBanner> findAllList() {
		return firmBannerDao.findAll();
	}

	@Override
	public Page<FirmBanner> findAll(Pageable pab) {
		return firmBannerDao.findAll(pab);
	}

	@Override
	public Optional<FirmBanner> findByfirmId(Integer firmId) {
		return firmBannerDao.findByFirmBean_firmId(firmId);
	}

	@Override
	public void insertBanner(FirmBanner firmBanner) {
		firmBannerDao.save(firmBanner);
	}

	@Override
	public List<FirmBanner> findByFirmIdNull() {
		return firmBannerDao.findByFirmBean_firmIdNull();
	};

	@Override
	public void deleteByFirmId(Integer firmId) {
		firmBannerDao.deleteByFirmBean_firmId(firmId);
	}
	
	@Override
	public void deleteById(Integer firmBannerId) {
		firmBannerDao.deleteById(firmBannerId);
	}
	
	@Override
	public Optional<FirmBanner> findById(Integer id) {
		return firmBannerDao.findById(id);
	}
}
