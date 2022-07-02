package com.eeit144.drinkmaster.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.StoreBean;

@Repository
public interface StoreRepostiory extends JpaRepository<StoreBean, Integer> {

	public Optional<StoreBean> findByUserBean_userId(Integer userId);
	
	public Page<StoreBean> findByFirmBean_firmId(Integer firmId,Pageable pab);

	public FirmBean findFirmBeanByStoreId(Integer storeId);
	
	public List<StoreBean> findByFirmBean_firmId(Integer firmId);
	
	@Query(value = "select u.userid from store as s right join users as u on s.userid=u.userid where s.userid is null and u.role = 'store';",nativeQuery = true)
	public List<Integer> findStoreUserNull();
	
	@Query(value = "SELECT * FROM ( SELECT *,( 6371 * acos( cos( radians( :latitude ) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians( :longitude ) ) "
			+ "+ sin( radians( :latitude ) ) * sin( radians( latitude ) ) ) ) AS distance FROM  STORE ) AS B WHERE distance > 0 ORDER BY distance ASC",nativeQuery = true)
	public List<StoreBean> findStoreByLocal(Double latitude,Double longitude); 
}
