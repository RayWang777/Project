package com.eeit144.drinkmaster.front.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.back.model.StoreService;
import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.dto.Map2Dto;
import com.eeit144.drinkmaster.dto.MapDto;

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

	@PostMapping("localstore")
	@ResponseBody
	public List<StoreBean> findLocalStoreByLatLng(@RequestBody MapDto map) {
		
		PageRequest page = PageRequest.of(map.getCounts()-1, 4);
		List<StoreBean> findStoreByLocal = storeService.findStoreByLocal(map.getLat(), map.getLng(),page);
		for(StoreBean one : findStoreByLocal) {
			Integer firmId = one.getFirmBean().getFirmId();
			one.setFirmId(firmId);
		}
		return findStoreByLocal;
	}
	
	@PostMapping("localstorelike")
	@ResponseBody
	public List<StoreBean> findLocalStoreByFirmNameLike(@RequestBody Map2Dto map){
		
		Float score = map.getScore();
		
		PageRequest page = PageRequest.of(map.getCounts()-1, 3);
		List<StoreBean> LocalByFirmNameLike = storeService.findStoreLocalByFirmNameLike(map.getLat(), map.getLng(),map.getFirmName(),page);
	
		
		if(score==null) score =0.0F;
//		System.out.println(score);
	
//		List<StoreBean> LocalByFirmNameLike = storeService.findStoreLocalByFirmNameLikeAndScoreUpThan(map.getLat(), map.getLng(),map.getFirmName(),score,page);
		
		
		for(StoreBean one : LocalByFirmNameLike) {
			Integer firmId = one.getFirmBean().getFirmId();
			one.setFirmId(firmId);
		}
		return LocalByFirmNameLike;
	}

//	@GetMapping("store/{id}")
//	public List<StoreBean> serchAllStoreByFirm(@PathVariable("id") Integer firmId){
//		return 
//	}
}
