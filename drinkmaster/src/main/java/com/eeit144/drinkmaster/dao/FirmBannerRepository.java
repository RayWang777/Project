package com.eeit144.drinkmaster.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit144.drinkmaster.bean.FirmBanner;

@Repository
public interface FirmBannerRepository extends JpaRepository<FirmBanner, Integer> {

	public Page<FirmBanner> findByFirmBean_firmId(Integer firmId,Pageable pab);

}
