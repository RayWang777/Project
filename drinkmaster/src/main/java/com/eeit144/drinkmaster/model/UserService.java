package com.eeit144.drinkmaster.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;

import com.eeit144.drinkmaster.bean.UserBean;

public interface UserService {

	public Optional<UserBean> findById(Integer id);

	public Page<UserBean> findAll(Integer pageNumber);

	public void insertUser(UserBean userBean);

	public void deleteById(Integer id);

	public Page<UserBean> select(Integer pageNumber, String string);

<<<<<<< HEAD
	//firm need no delete
	public List<UserBean> findAllUsers();
=======
	public UserBean findByAccPwd(String userAccount, String userPassword);

	public String findIdByName(String userName);
>>>>>>> cfde28f656de0b60c85402b1b6e29356489c8101
}
