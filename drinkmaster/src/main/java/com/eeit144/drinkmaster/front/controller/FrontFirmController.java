package com.eeit144.drinkmaster.front.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.back.model.StoreService;
import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.FirmVo;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.dto.FirmDTO;

@Controller
@RequestMapping("front/")
public class FrontFirmController {
	
	
	private FirmService firmService;
	
	private StoreService storeService;
	
	@Autowired
	public FrontFirmController(FirmService firmService, StoreService storeService) {
		super();
		this.firmService = firmService;
		this.storeService = storeService;
	}
	
	@GetMapping("firm/{id}/photo")
	public ResponseEntity<byte[]> getFirmLogo(@PathVariable("id") Integer id) {
		Optional<FirmBean> firmBean = firmService.findById(id);

		byte[] firmLogo = firmBean.get().getFirmLogo();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(firmLogo, headers, HttpStatus.OK);
	}

	@ResponseBody
	@GetMapping("firm/all")
	public List<FirmVo> findAllFirm(){
		 List<FirmBean> findAllFirmBean = firmService.findAll3();
		 List<FirmVo> list = new ArrayList<FirmVo>();
		 FirmVo firmVo = null;
		 for(FirmBean firm : findAllFirmBean) {
			 firmVo = new FirmVo();
			 firmVo.setFirmId(firm.getFirmId());
			 firmVo.setFirmName(firm.getFirmName());
			 firmVo.setFirmPic(firm.getFirmId());			 
			 list.add(firmVo);
		 }
		 return list;		 
	}
	
	@GetMapping("firm/{id}")
	public String findAllStoreByFirmId(@PathVariable("id") Integer firmId,Model m){
		
		if( firmId > 6) {
			return "redirect:/front/";
		}

		FirmBean findById = firmService.findById(firmId).get();
	
		List<StoreBean> findStoreByFirmId = storeService.findStoreByFirmId(firmId);
		
		m.addAttribute("thisFirm", findById);
		m.addAttribute("stores", findStoreByFirmId);
		return "/front/frontstore";		 
	}
	
	
	@PostMapping("firm/serch")
	@ResponseBody
	public List<FirmVo> findByFirmName(@RequestBody Map<String,String> key){
		String firmkey = (String)key.get("key");
	 List<FirmBean> findByFirmNameContaining = firmService.findByFirmNameContaining(firmkey);
	 List<FirmVo> list = new ArrayList<FirmVo>();
	 FirmVo firmVo = null;
	 for(FirmBean firm : findByFirmNameContaining) {
		 firmVo = new FirmVo();
		 firmVo.setFirmId(firm.getFirmId());
		 firmVo.setFirmName(firm.getFirmName());
		 firmVo.setFirmPic(firm.getFirmId());			 
		 list.add(firmVo);
	 }
	 return list;		 
		
	}
	

}
