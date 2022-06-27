package com.eeit144.drinkmaster.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.FirmVo;
import com.eeit144.drinkmaster.model.FirmService;

@Controller
@RequestMapping("front/")
public class FrontFirmController {
	
	
	private FirmService firmService;
	
	@Autowired
	public FrontFirmController(FirmService firmService) {
		super();
		this.firmService = firmService;
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
	
	

}
