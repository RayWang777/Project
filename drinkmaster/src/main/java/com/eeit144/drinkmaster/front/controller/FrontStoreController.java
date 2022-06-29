package com.eeit144.drinkmaster.front.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.back.model.StoreService;
import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.StoreBean;

@Controller
@RequestMapping("front/")
public class FrontStoreController {

	private FirmService firmService;
	
	private StoreService storeService;
	
	@Autowired
	public FrontStoreController(FirmService firmService, StoreService storeService) {
		super();
		this.firmService = firmService;
		this.storeService = storeService;
	}
	
//	@GetMapping("store/{id}")
//	public List<StoreBean> serchAllStoreByFirm(@PathVariable("id") Integer firmId){
//		return 
//	}
}
