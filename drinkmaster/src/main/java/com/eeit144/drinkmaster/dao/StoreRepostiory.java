package com.eeit144.drinkmaster.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
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
	public List<StoreBean> findStoreByLocal(Double latitude,Double longitude,Pageable pab); 
	
	@Query(value = "select * from store where storename Like %:storeName%",nativeQuery = true)
	public List<StoreBean> findStoreByStoreNameLike(@Param(value="storeName")String storeName);
	
	@Query(value = "  SELECT * FROM ( SELECT *,( 6371 * acos( cos( radians( :latitude ) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians( :longitude ) )"
			+ "+ sin( radians(:latitude ) ) * sin( radians( latitude ) ) ) ) AS distance FROM  STORE ) AS B "
			+ "left JOIN firm AS f on B.firmId = f.firmid where firmname like :firmName and distance > 0 ORDER BY distance ",nativeQuery = true)
	public List<StoreBean> findStoreLocalFirmNameLike(Double latitude,Double longitude,@Param(value="firmName") String firmName,Pageable pab);
	
	
	@Query(value = "  SELECT distance FROM ( SELECT *,( 6371 * acos( cos( radians( :latitude ) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians( :longitude ) )"
			+ "+ sin( radians(:latitude ) ) * sin( radians( latitude ) ) ) ) AS distance FROM  STORE ) AS B "
			+ "left JOIN firm AS f on B.firmId = f.firmid where firmname like :firmName and distance > 0 ORDER BY distance ",nativeQuery = true)
	public List<Double> findStoreLocalFirmNameLikeDis(Double latitude,Double longitude,@Param(value="firmName") String firmName,Pageable pab);
	
	
	@Query(value="  SELECT * FROM ( SELECT *,( 6371 * acos( cos( radians( :latitude ) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians( :longitude ) )"
			+ "+ sin( radians( :latitude ) ) * sin( radians( latitude ) ) ) ) AS distance FROM  STORE  ) AS B "
			+ "LEFT JOIN firm AS f ON B.firmId = f.firmid LEFT JOIN comment AS c on B.storeid = c.storeid  WHERE ( firmname LIKE :firmName AND distance > 0  "
			+ "AND c.score > :score)   ORDER BY distance ",nativeQuery = true )
	public List<StoreBean> findStoreLocalFirmNameLikeAndScoreUpThan(Double latitude,Double longitude,String firmName,Float score, Pageable pab);
	
	@Query(value="  SELECT distance FROM ( SELECT *,( 6371 * acos( cos( radians( :latitude ) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians( :longitude ) )"
			+ "+ sin( radians( :latitude ) ) * sin( radians( latitude ) ) ) ) AS distance FROM  STORE  ) AS B "
			+ "LEFT JOIN firm AS f ON B.firmId = f.firmid LEFT JOIN comment AS c on B.storeid = c.storeid  WHERE ( firmname LIKE :firmName AND distance > 0  "
			+ "AND c.score > :score)   ORDER BY distance ",nativeQuery = true )
	public List<Double> findStoreLocalFirmNameLikeAndScoreUpThanDis(Double latitude,Double longitude,String firmName,Float score, Pageable pab);
}
