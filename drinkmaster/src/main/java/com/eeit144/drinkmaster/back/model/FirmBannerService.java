package com.eeit144.drinkmaster.back.model;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.eeit144.drinkmaster.bean.FirmBanner;

public interface  FirmBannerService {

	public Page<FirmBanner> findByfirmId(Integer firmId,Pageable pab);

	public Page<FirmBanner> findAll(Pageable pab);
}
