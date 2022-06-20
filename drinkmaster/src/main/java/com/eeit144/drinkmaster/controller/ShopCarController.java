package com.eeit144.drinkmaster.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.eeit144.drinkmaster.bean.OrderBean;
import com.eeit144.drinkmaster.model.OrderService;

public class ShopCarController {

	@Autowired
	private OrderService orderService;
	

}
