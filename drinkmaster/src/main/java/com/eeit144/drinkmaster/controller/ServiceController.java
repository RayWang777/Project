package com.eeit144.drinkmaster.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.eeit144.drinkmaster.model.ServiceService;

@Controller
public class ServiceController {

	@Autowired
	private ServiceService service;
	
	
}
