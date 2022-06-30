package com.eeit144.drinkmaster.back.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.back.model.SaleCodeService;
import com.eeit144.drinkmaster.back.util.Util;
import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.SaleCodeBean;
import com.eeit144.drinkmaster.dto.SaleCodeDTO;


@Controller
@RequestMapping("backend/salecode/")
public class SaleCodeController<E> {
	
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
		
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String formatDate = formatter.format(date);
		m.addAttribute("now", formatDate);
		
		List<SaleCodeBean> findByFirmIdNull = saleCodeService.findAllList();
		SaleCodeDTO newSaleCode = new SaleCodeDTO();
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
	
	@PostMapping("add")
	public  String createSaleCode(@ModelAttribute("newSaleCode") SaleCodeDTO saleCode,@RequestParam("count") Integer count,Model m) {
		Float discount = saleCode.getDiscount()/100;
		FirmBean firmBean = firmService.findById(saleCode.getFirmId()).get();
		Date validDate = saleCode.getValidDate();
	
		List<SaleCodeBean> list = new ArrayList<SaleCodeBean>();
		SaleCodeBean saleCodeBean = null;
		
		for(int i=0;i<count;i++) {
		saleCodeBean = new SaleCodeBean();
		saleCodeBean.setDiscount(discount);	
		saleCodeBean.setFirmBean(firmBean);	
		saleCodeBean.setValidDate(validDate);
		
		String code = Util.saleCode(createSaleCode());
		saleCodeBean.setSaleCode(code);
		list.add(saleCodeBean);
		}
		
		m.addAttribute("createNum", count);
		saleCodeService.insertSaleCodeToDB(list);
		return "/backend/backsalecode";
	}
	
	private String createSaleCode() {
		 String str="zxcvbnmlkjhgfdsaqwertyuiopQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
		  Random random=new Random();  
	        StringBuffer sb=new StringBuffer();
	        for(int i=0; i< 10 ; ++i){
	          int number=random.nextInt(62);
		          sb.append(str.charAt(number));
	        }
	        return sb.toString();
	}

}
