package com.eeit144.drinkmaster.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.dao.UserRepostiory;
import com.eeit144.drinkmaster.model.UserService;

@Service
@Transactional
public class UserServiceImp implements UserService {
	
	@Autowired
	private UserRepostiory userDao;

	@Override
	public UserBean findById(Integer id) {
		Optional<UserBean> user = userDao.findById(id);
		if(user.isPresent()) {
			return user.get();
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
	
}
