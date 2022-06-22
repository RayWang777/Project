package com.eeit144.drinkmaster.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.dto.FirmDTO;
import com.eeit144.drinkmaster.model.FirmService;

@Controller
@RequestMapping("backend/")
@SessionAttributes("firmsave")
public class FirmPageController {

	private FirmService firmService;

	@Autowired
	public FirmPageController(FirmService firmService) {
		super();
		this.firmService = firmService;
	}

	@GetMapping("firm/{id}")
	public ResponseEntity<FirmDTO> findFirmById(@PathVariable Integer id) {
		Optional<FirmBean> firmBean = firmService.findById(id);

		if (firmBean.isEmpty()) {
			return new ResponseEntity<FirmDTO>(HttpStatus.NO_CONTENT);
		}
		FirmDTO firmDTO = new FirmDTO();
		firmDTO.setFirmId(firmBean.get().getFirmId());
		firmDTO.setFirmName(firmBean.get().getFirmName());
		firmDTO.setFirmAddress(firmBean.get().getFirmAddress());
		firmDTO.setFirmPhone(firmBean.get().getFirmPhone());
		firmDTO.setUserId(firmBean.get().getUserBean().getUserId());
		return new ResponseEntity<FirmDTO>(firmDTO, HttpStatus.OK);
	}

	@GetMapping("firm/{id}/photo")
	public ResponseEntity<byte[]> getFirmLogo(@PathVariable("id") Integer id) {
		Optional<FirmBean> firmBean = firmService.findById(id);

		byte[] firmLogo = firmBean.get().getFirmLogo();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(firmLogo, headers, HttpStatus.OK);
	}
	
	@GetMapping("firm/edit/{id}")
	public String firmAddPage(@PathVariable("id") Integer id,Model m) {
		FirmBean findById = firmService.findById(id).get();
		FirmDTO firmDTO = new FirmDTO();

		firmDTO.setFirmId(findById.getFirmId());
		firmDTO.setFirmName(findById.getFirmName());
		firmDTO.setFirmAddress(findById.getFirmAddress());
		firmDTO.setFirmPhone(findById.getFirmPhone());

		firmDTO.setUserId(findById.getUserBean().getUserId());
		m.addAttribute("firm", firmDTO);
		m.addAttribute("firmsave", "修改廠商");		
		return "backfirmadd";
	}	
	
	@GetMapping("firm/delete/{id}")
	public String deleteFirm(@PathVariable("id") Integer id) {
		firmService.deleteById(id);
		return "redirect:/backend/firm/all";
	}
	

}
