package com.eeit144.drinkmaster.front.Interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.dao.UserRepostiory;

public class UserDetailService implements UserDetailsService {
@Autowired
private UserRepostiory userDao;

@Override
public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException{
	UserBean users =userDao.findByuserName(name);
	if(users==null) {
		throw new UsernameNotFoundException(name + "not found");
	}
	UserDetails userDetails =User.builder()
			.username(users.getUserName())
			.password("{noop}" +users.getUserPassword())
			.roles(users.getRole()).build();
	return userDetails;
			
}
}
