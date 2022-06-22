package com.eeit144.drinkmaster.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.FirmColumn;
import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.dto.FirmDTO;
import com.eeit144.drinkmaster.model.FirmService;


@Controller
@RequestMapping("backend/")
@SessionAttributes("firmsave")
public class FirmController {

	private FirmService firmService;

	@Autowired
	public FirmController(FirmService firmService) {
		super();
		this.firmService = firmService;
	}

	
	@GetMapping("firm/all")
	public String findAllPages(@RequestParam(name = "p", defaultValue = "1") Integer page,
			@RequestParam(name = "c", defaultValue = "1") Integer column,
			@RequestParam(name = "s", defaultValue = "2") Integer size,
			@RequestParam(name = "d", defaultValue = "true") boolean direct, Model m) {
		if (column > 4)
			column = 1;

		Pageable pab = null;
		if (direct) {
			pab = PageRequest.of(page - 1, size, Sort.Direction.ASC, FirmColumn.getColumne(column));
		} else {
			pab = PageRequest.of(page - 1, size, Sort.Direction.DESC, FirmColumn.getColumne(column));
		}

		Page<FirmBean> allFirm = firmService.findAll(pab);
	
		for (FirmBean firm : allFirm) {
			firm.setFirmLogo(null);
		}

		m.addAttribute("firms", allFirm);

		return "backfirm";
	};
	
	@GetMapping("/firm/add")
	public String firmAddPage(Model m) {
		FirmDTO firm = new FirmDTO();
		m.addAttribute("firm", firm);
		m.addAttribute("firmsave", "新增廠商");
		return "backfirmadd";
	}

	
	@PostMapping("firm/add")
	public String addNewFirm(@ModelAttribute("firm") FirmDTO firm, @RequestPart("reallogo") MultipartFile logo,Model m) {
		FirmBean newFirm = new FirmBean();

		String contentType = logo.getContentType();

		System.out.println(contentType);

		if(!contentType.startsWith("image")) {
			
			Map<String, String> errors = new HashMap<String, String>();
			errors.put("firmLogo", "檔案必須為圖片");
			
			FirmDTO firmDTO = new FirmDTO();
						
			m.addAttribute("errors", errors);
			m.addAttribute("firm", firmDTO);
			return "backfirmadd";
		}
		UserBean userBean = new UserBean();
		userBean.setUserId(firm.getUserId());
		
		newFirm.setFirmId(firm.getFirmId());
		newFirm.setUserBean(userBean);
		newFirm.setFirmName(firm.getFirmName());
		newFirm.setFirmAddress(firm.getFirmAddress());
		newFirm.setFirmPhone(firm.getFirmPhone());
		try {
			newFirm.setFirmLogo(logo.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
			FirmDTO firmDTO = new FirmDTO();
			m.addAttribute("firm", firmDTO);
			return "backfirmadd";
		}

		firmService.insertFirm(newFirm);

		return "redirect:/backend/firm/all";
	}





	
	@ModelAttribute
	public FirmDTO editFirmDTO(
			@RequestParam(value="firmId", required = false) Integer id) {
		FirmDTO cbean = new FirmDTO();
		Optional<FirmBean> firm = firmService.findById(id);
		if (id != null) {
		
			System.out.println("在@ModelAttribute修飾的方法 getCustomerBean()中，讀到物件:" + cbean);
		} else {
//			cbean = new CustomerBean();
//			cbean.setName("小明");
//			cbean.setBirthday(java.sql.Date.valueOf("1980-2-1"));
//			cbean.setTotalPayment(0.001);
//			System.out.println("在@ModelAttribute修飾的方法 getCustomerBean()中，無法讀取物件:" + cbean);
		}
		return cbean;
	}
	
	protected void name() {
		
	} 

}
