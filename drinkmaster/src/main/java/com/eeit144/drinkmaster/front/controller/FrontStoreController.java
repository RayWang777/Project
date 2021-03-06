package com.eeit144.drinkmaster.front.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eeit144.drinkmaster.back.model.CommentService;
import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.back.model.StoreService;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.dto.Map2Dto;
import com.eeit144.drinkmaster.dto.MapDto;
import com.eeit144.drinkmaster.dto.StoreMapDTO;

@Controller
@RequestMapping("front/")
public class FrontStoreController {

	private FirmService firmService;

	private StoreService storeService;
	
	private CommentService commentService;

	@Autowired
	public FrontStoreController(FirmService firmService, StoreService storeService,CommentService commentService) {
		super();
		this.firmService = firmService;
		this.storeService = storeService;
		this.commentService = commentService;
	}

	@PostMapping("localstore")
	@ResponseBody
	public List<StoreMapDTO> findLocalStoreByLatLng(@RequestBody MapDto map) {
		
		PageRequest page = PageRequest.of(map.getCounts()-1, 4);
		List<StoreBean> findStoreByLocal = storeService.findStoreByLocal(map.getLat(), map.getLng(),page);
		List<Double> localDis = storeService.findStoreByLocalDis(map.getLat(), map.getLng(),page);
		
		int size = localDis.size();
		List<StoreMapDTO> list = new ArrayList<StoreMapDTO>();
		
		StoreMapDTO storeMap = null;
		DecimalFormat format = new DecimalFormat("0.00");
		Integer firmId =null;
		
		for(int i = 0; i< size;i++) {
			
			storeMap = new StoreMapDTO();
			storeMap.setFirmId(findStoreByLocal.get(i).getFirmBean().getFirmId());
			storeMap.setFirmName(findStoreByLocal.get(i).getFirmBean().getFirmName());
			storeMap.setOpenTime(findStoreByLocal.get(i).getOpenTime());
			storeMap.setStoreAddress(findStoreByLocal.get(i).getStoreAddress());
			storeMap.setStoreId(findStoreByLocal.get(i).getStoreId());
			storeMap.setStoreName(findStoreByLocal.get(i).getStoreName());
			storeMap.setStorePhone(findStoreByLocal.get(i).getStorePhone());
			Double avgScoreByStoreid = commentService.avgScoreByStoreid(findStoreByLocal.get(i).getStoreId());
			storeMap.setAvgScore(avgScoreByStoreid);
			String format2 = format.format(localDis.get(i));
			storeMap.setDistance(format2);
			list.add(storeMap);
		}
		return list;
//		
//		for(StoreBean one : findStoreByLocal) {
//			Integer firmId = one.getFirmBean().getFirmId();
//			one.setFirmId(firmId);
//		}
//		return findStoreByLocal;
	}
	
	@PostMapping("localstorelike")
	@ResponseBody
	public List<StoreMapDTO> findLocalStoreByFirmNameLike(@RequestBody Map2Dto map){
		
		Double score = map.getScore();
		
		PageRequest page = PageRequest.of(map.getCounts()-1, 3);
//		List<StoreBean> localByFirmNameLike = storeService.findStoreLocalByFirmNameLike(map.getLat(), map.getLng(),map.getFirmName(),page);
//		List<Double> findStoreLocalFirmNameLikeDis = storeService.findStoreLocalFirmNameLikeDis(map.getLat(), map.getLng(),map.getFirmName(),page);
		
		
		List<StoreMapDTO> list = new ArrayList<StoreMapDTO>();
		StoreMapDTO storeMap = null;
		List<Integer> findStoreIdByAvgUPThanNum = commentService.findStoreIdByAvgUPThanNum(score);
		
		if(score==null) score =0.0D;
	
		List<StoreBean> localByFirmNameLike = storeService.findStoreLocalByFirmNameLikeAndScoreUpThan(map.getLat(), map.getLng(),map.getFirmName(),findStoreIdByAvgUPThanNum,page);
		List<Double> firmNameLikeAndScoreUpThanDis = storeService.findStoreLocalFirmNameLikeAndScoreUpThanDis(map.getLat(),  map.getLng(), map.getFirmName(),findStoreIdByAvgUPThanNum, page);
		
		
		int size = localByFirmNameLike.size();
		DecimalFormat format = new DecimalFormat("0.00");
		Integer firmId =null;
		for(int i = 0; i< size;i++) {
			
			storeMap = new StoreMapDTO();
			storeMap.setFirmId(localByFirmNameLike.get(i).getFirmBean().getFirmId());
			storeMap.setFirmName(localByFirmNameLike.get(i).getFirmBean().getFirmName());
			storeMap.setOpenTime(localByFirmNameLike.get(i).getOpenTime());
			storeMap.setStoreAddress(localByFirmNameLike.get(i).getStoreAddress());
			storeMap.setStoreId(localByFirmNameLike.get(i).getStoreId());
			storeMap.setStoreName(localByFirmNameLike.get(i).getStoreName());
			storeMap.setStorePhone(localByFirmNameLike.get(i).getStorePhone());
			Double avgScoreByStoreid = commentService.avgScoreByStoreid(localByFirmNameLike.get(i).getStoreId());
			storeMap.setAvgScore(avgScoreByStoreid);
			String format2 = format.format(firmNameLikeAndScoreUpThanDis.get(i));
			storeMap.setDistance(format2);
			list.add(storeMap);
		}
		return list;
	}

//	@GetMapping("store/{id}")
//	public List<StoreBean> serchAllStoreByFirm(@PathVariable("id") Integer firmId){
//		return 
//	}
}
