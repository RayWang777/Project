package com.eeit144.drinkmaster.dao;



import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.eeit144.drinkmaster.bean.CommentBean;
import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.bean.ProductBean;

@Repository
public interface OrderRepostiory extends JpaRepository<OrderBean, Integer> {


	public List<OrderBean> findByStoreBean_storeId(Integer storeId);
	
	
//	public Page<OrderBean> findByorderStatus(Pageable pageable, String orderStatus);
	
	@Query(value = "select * from orders where orderstatus = :orderstatus",nativeQuery = true)
	public Page<OrderBean> findByorderStatus1(Pageable pageable,@Param(value="orderstatus") String orderStatus);

	
	public Page<OrderBean> findByorderIdLike(Pageable pageable,@Param(value="orderId") Integer orderId);
	
	@Query(value = "select top(20) [storeid] from [orders] group by [storeid] order by  sum([totalprice]) DESC ;",nativeQuery = true)
	public List<Integer> countBystoreId();
	
	
	public OrderBean findFirstByOrderByCreateTimeDesc();
	
	@Query(value="select * from orders where userid = :userId order by createtime desc",nativeQuery = true)
	public List<OrderBean> findOrdersByUserid(@Param(value="userId")Integer userId);
	
	@Query(value="select * from orders as o right join orderitems as oi on o.orderid = oi.orderid ",nativeQuery = true)
	public List<OrderBean> findOrderOrderitems();
	
	public Page<OrderBean> findBystoreBean_storeId(Pageable pageable,Integer storeId);

	public Page<OrderBean> findBystoreBean_firmBean_firmId(Pageable pageable,Integer firmId);

}
