package com.eeit144.drinkmaster.back.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.eeit144.drinkmaster.bean.FirmBanner;

public interface  FirmBannerService {

	public Optional<FirmBanner> findByfirmId(Integer firmId);

	public Page<FirmBanner> findAll(Pageable pab);
	
	public List<FirmBanner> findAllList();
	
	public void insertBanner(FirmBanner firmBanner);

	public List<FirmBanner> findByFirmIdNull();

	public void deleteByFirmId(Integer firmId);

	public void deleteById(Integer firmBannerId);

	public Optional<FirmBanner> findById(Integer id);
}
