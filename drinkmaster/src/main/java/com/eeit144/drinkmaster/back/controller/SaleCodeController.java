package com.eeit144.drinkmaster.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eeit144.drinkmaster.back.model.SaleCodeService;
import com.eeit144.drinkmaster.back.util.Util;

@Controller
@RequestMapping("backend/salecode/")
public class SaleCodeController {
	
	private SaleCodeService saleCodeService;
	
	private static final String KEY ="drinkmasterbest!";

	@Autowired
	public SaleCodeController(SaleCodeService saleCodeService) {
		super();
		this.saleCodeService = saleCodeService;
	}
	

	public String saleCode(@RequestParam("key") String key) {
		String encrypt = null;
		try {
			encrypt = Util.encrypt(key.getBytes(),KEY.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
			return encrypt;
//			test1234
//			aWSMDvbh8h8qGKIbnnXFYA==
	}

		public String DeSaleCode(@RequestParam("password") String pwd) {
		
		byte[] decrypt = null;
		try {
			decrypt = Util.decrypt(pwd.getBytes(), KEY.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		String string = new String(decrypt);
//		aWSMDvbh8h8qGKIbnnXFYA==
//		test1234
		return string;
	}
	

}
