package com.eeit144.drinkmaster.back.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit144.drinkmaster.back.model.UserService;
import com.eeit144.drinkmaster.bean.AuthenticationProvider;
import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.dao.UserRepostiory;

@Service
@Transactional
public class UserServiceImp implements UserService {
	
	@Autowired
	private UserRepostiory userDao;

	@Override
	public Optional<UserBean> findById(Integer id) {
		Optional<UserBean> user = userDao.findById(id);
		if(user.isPresent()) {
			return user;
		}		
		return null;
	}

	@Override
	public Page<UserBean> findAll(Integer pageNumber) {
		PageRequest page = PageRequest.of(pageNumber-1, 10, Sort.Direction.ASC, "userId");
		
		return userDao.findAll(page);
	}

	@Override
	public void insertUser(UserBean user) {
		userDao.save(user);
	}

	@Override
	public void deleteById(Integer id) {
		userDao.deleteById(id);
	}
	
	public Page<UserBean> select(Integer pageNumber,String name){
		PageRequest page = PageRequest.of(pageNumber-1, 10, Sort.Direction.ASC, "userId");
		return userDao.findByUserNameLike(page, name);
	}

	//firm need no delete
	@Override
	public List<UserBean> findAllUsers() {
		return userDao.findAll();
	}
	
	public UserBean findByAccPwd(String userAccount, String userPassword) {
		UserBean user = userDao.findByAccPwd(userAccount, userPassword);
		if(user != null) {
			return user;
		}
		return null;
	}
	
	public String findIdByName(String userName) {
		
		String user = userDao.findIdByName(userName);
		if(user.isBlank()) {
			return null;
		}
		return user;
	}
	
	@Override
	public Boolean findUserByAccount(String userAccount) {
		System.out.println("(service)user account 1: " + userAccount);
		System.out.println("(service)user account 2: " + userDao.findByAccount(userAccount));
		String user = userDao.findByAccount(userAccount);
		if(!(user == null)) {
			return false;
		}
		return true;
	}
	
	@Override
	public List<UserBean> findNullTypeUsers(List<Integer> userIds){
		return userDao.findAllById(userIds);
	}
	
	@Override
	public UserBean findAllByUserAccount(String useraccount) {
		return userDao.findAllByUserAccount(useraccount);
	}
	@Override 
	public void createNewCustomerAfterOAuthLoginSuccess(String useraccount ,String name ,AuthenticationProvider provider) {
		UserBean user =new UserBean();
		user.setUserName(name);
		user.setUserAccount(useraccount);
		user.setRole("store");
		user.setGender("男");
		user.setUserPassword("dFQ9TAiTXYG1DKM9ugbHsw==");
		user.setPhone("0939566761");
		user.setUserAddress("新北市淡水區八勢一街35號");
		user.setCreatedate(new Date());
		user.setAuthProvider(provider);
		userDao.save(user);
	
		
	}
	@Override
	public void updateCustomerAfterLogin(String useraccount ,String name ,AuthenticationProvider provider) {
		UserBean user = userDao.findAllByUserAccount(useraccount);
		user.setUserName(name);
		user.setUserAccount(useraccount);
		userDao.save(user);
	}
}
