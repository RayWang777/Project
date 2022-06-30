package com.eeit144.drinkmaster.back.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.back.model.SaleCodeService;
import com.eeit144.drinkmaster.bean.FirmBanner;
import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.SaleCodeBean;

@Controller
@RequestMapping("backend/salecode/")
public class SaleCodeController {
	
	private SaleCodeService saleCodeService;
	
	private FirmService firmService;
	


	@Autowired
	public SaleCodeController(SaleCodeService saleCodeService,FirmService firmService) {
		super();
		this.saleCodeService = saleCodeService;
		this.firmService = firmService;
	}

	@GetMapping("all")
	public String allSaleCodePage() {
		return "/backend/backsalecode";		
	}
	
	@GetMapping("add")
	public String createSaleCodePage(Model m) {
		
		
		List<SaleCodeBean> findByFirmIdNull = saleCodeService.findAllList();
		SaleCodeBean newSaleCode = new SaleCodeBean();
		m.addAttribute("newSaleCode", newSaleCode);

		if(findByFirmIdNull.isEmpty()) {
			List<FirmBean> findAll3 = firmService.findAll3();
			m.addAttribute("firms", findAll3);
			return "/backend/backsalecodeadd";
		}

		List<Integer> list = new ArrayList<Integer>();
		Integer firmId = null;
		for(SaleCodeBean one: findByFirmIdNull) {
			firmId = one.getFirmBean().getFirmId();
			list.add(firmId);
		}
		List<FirmBean> findByIdNotIn = firmService.findByIdNotIn(list);
			if(findByIdNotIn.isEmpty()) {
			return "redirect:/backend/salecode/all";
		}
		m.addAttribute("firms", findByIdNotIn);
		return "/backend/backsalecodeadd";
	
	}

}
