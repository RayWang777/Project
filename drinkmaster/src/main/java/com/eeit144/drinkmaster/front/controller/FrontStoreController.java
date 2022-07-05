package com.eeit144.drinkmaster.front.controller;

import java.util.ArrayList;
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
import com.eeit144.drinkmaster.dto.StoreMapDTO;

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
//		List<StoreBean> localByFirmNameLike = storeService.findStoreLocalByFirmNameLike(map.getLat(), map.getLng(),map.getFirmName(),page);
//		List<Double> findStoreLocalFirmNameLikeDis = storeService.findStoreLocalFirmNameLikeDis(map.getLat(), map.getLng(),map.getFirmName(),page);
		
		
		List<StoreMapDTO> list = new ArrayList<StoreMapDTO>();
		StoreMapDTO storeMap = null;
		
		
		if(score==null) score =0.0F;
//		System.out.println(score);
	
		List<StoreBean> localByFirmNameLike = storeService.findStoreLocalByFirmNameLikeAndScoreUpThan(map.getLat(), map.getLng(),map.getFirmName(),score,page);
		List<Double> firmNameLikeAndScoreUpThanDis = storeService.findStoreLocalFirmNameLikeAndScoreUpThanDis(map.getLat(),  map.getLng(), map.getFirmName(),score, page);
		
		int size = localByFirmNameLike.size();
		int size2 = firmNameLikeAndScoreUpThanDis.size();
		
		System.out.println(size);
		System.out.println(size2);
		
		for(int i = 0; i< size;i++) {
			
			storeMap = new StoreMapDTO();
			storeMap.setFirmId(localByFirmNameLike.get(i).getFirmBean().getFirmId());
			storeMap.setOpenTime(localByFirmNameLike.get(i).getOpenTime());
			storeMap.setStoreAddress(localByFirmNameLike.get(i).getStoreAddress());
			storeMap.setStoreId(localByFirmNameLike.get(i).getStoreId());
			storeMap.setStoreName(localByFirmNameLike.get(i).getStoreName());
			storeMap.setStorePhone(localByFirmNameLike.get(i).getStorePhone());
			storeMap.setDistance(firmNameLikeAndScoreUpThanDis.get(i));
			list.add(storeMap);
		}
		return localByFirmNameLike;
	}

//	@GetMapping("store/{id}")
//	public List<StoreBean> serchAllStoreByFirm(@PathVariable("id") Integer firmId){
//		return 
//	}
}
