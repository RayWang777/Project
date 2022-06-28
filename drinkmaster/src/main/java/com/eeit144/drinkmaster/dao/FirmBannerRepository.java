package com.eeit144.drinkmaster.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.eeit144.drinkmaster.bean.FirmBanner;

@Repository
public interface FirmBannerRepository extends JpaRepository<FirmBanner, Integer> {

	public Optional<FirmBanner> findByFirmBean_firmId(Integer firmId);

	public List<FirmBanner> findByFirmBean_firmIdNull();
	
	public void deleteByFirmBean_firmId(Integer firmId);	
	
}
