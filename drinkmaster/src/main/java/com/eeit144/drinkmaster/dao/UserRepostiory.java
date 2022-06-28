package com.eeit144.drinkmaster.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.eeit144.drinkmaster.bean.UserBean;

public interface UserRepostiory extends JpaRepository<UserBean, Integer> {
	Page<UserBean> findByUserNameLike(Pageable pageable, String userName);
	
	@Query(value="select * from users where useraccount= :userAccount and userpassword= :userPassword", nativeQuery = true)
	public UserBean findByAccPwd(@Param(value="userAccount") String userAccount,@Param(value="userPassword") String userPassword);
	
	@Query(value="select userid from users where username like '%'+:userName+'%'", nativeQuery = true)
	public String findIdByName(@Param(value="userName") String userName);

	@Query(value="select useraccount from users where useraccount =:userAccount", nativeQuery = true)
	String findByAccount(@Param(value="userAccount") String userAccount);
	
}
