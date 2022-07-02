package com.eeit144.drinkmaster.dao;



import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.eeit144.drinkmaster.bean.OrderBean;

@Repository
public interface OrderRepostiory extends JpaRepository<OrderBean, Integer> {


	public List<OrderBean> findByStoreBean_storeId(Integer storeId);
	
	
//	public Page<OrderBean> findByorderStatus(Pageable pageable, String orderStatus);
	
	@Query(value = "select * from orders where orderstatus = :orderstatus",nativeQuery = true)
	public Page<OrderBean> findByorderStatus1(Pageable pageable,@Param(value="orderstatus") String orderStatus);

	
	public Page<OrderBean> findByorderIdLike(Pageable pageable,@Param(value="orderId") Integer orderId);
	
	@Query(value = "select top(20) [storeid] from [orders] group by [storeid] order by  sum([totalprice]) DESC ;",nativeQuery = true)
	public List<Integer> countBystoreId();
}
