package com.eeit144.drinkmaster.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.eeit144.drinkmaster.bean.FirmBean;

@Repository
public interface FirmRepository extends JpaRepository<FirmBean, Integer> {

	public Page<FirmBean> findAllByFirmNameContainingAndFirmPhoneContaining(String firmName,String firmPhone,Pageable pab);
	
	public Page<FirmBean> findByUserBean_userId(Integer userId, Pageable pab);	
	
	public List<FirmBean> findByUserBean_userId(Integer userId);
	
	public List<FirmBean> findByFirmNameContaining(String firmName);
	
	public List<FirmBean> findByFirmIdNotIn(List<Integer> firmId);
	
	@Query(value="select  u.userid from firm as f right join users as u ON f.userid=u.userid where f.userid is null and u.role ='firm';", nativeQuery = true)
	public List<Integer> findUserNullFirmBean();
	
	@Query(value = "select firmid from firm ;",nativeQuery = true)
	public List<Integer> findAllIds();
	
}
