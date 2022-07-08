package com.eeit144.drinkmaster.dao;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.eeit144.drinkmaster.bean.SaleCodeBean;

@Repository
public interface SaleCodeRepository extends JpaRepository<SaleCodeBean, Integer> {
	
	  @Query(value = "select TOP(1) * from salecode where salecode = :salecode  ;",nativeQuery = true)
	  public Optional<SaleCodeBean> findBySaleCode(@Param(value = "salecode") String saleCode);
	  
	  @Query(value = " select * from salecode where validdate >  CURRENT_TIMESTAMP",nativeQuery = true)
	  public Page<SaleCodeBean> findAllValiedCode(Pageable pab);
	  
	  @Modifying
	  @Query(value="Update salecode set [validdate] = :validdate where salecodeid in :ids",nativeQuery = true)
	  public void updateValiedDateIds(@Param(value="validdate") Date validdate,List<Integer> ids);
}