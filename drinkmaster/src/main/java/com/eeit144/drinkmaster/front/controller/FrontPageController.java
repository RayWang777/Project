package com.eeit144.drinkmaster.front.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.back.model.OrderItemsService;
import com.eeit144.drinkmaster.back.model.OrderService;
import com.eeit144.drinkmaster.back.model.ProductCategoryService;
import com.eeit144.drinkmaster.back.model.ProductService;
import com.eeit144.drinkmaster.back.model.StoreService;
import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.StoreTop;
import com.eeit144.drinkmaster.bean.StoreBean;

@Controller
@RequestMapping("front")
public class FrontPageController {

	private FirmService firmService;
	
	private StoreService storeService;
	
	private OrderService orderService;

	@Autowired
	public FrontPageController(FirmService firmService,StoreService storeService,OrderService orderService) {
		super();
		this.firmService = firmService;
		this.storeService=storeService;
		this.orderService=orderService;
	}

	@GetMapping("/")
	public String welcomeFront(Model m) {
		List<StoreTop> top3= findTop3();
		List<Integer> findAllIds = firmService.findAllIds();
		m.addAttribute("swiperPic", findAllIds);
		m.addAttribute("top3",top3);
		return "/front/frontview";
	}

	@GetMapping("top3")
	@ResponseBody
	public List<StoreTop> findTop3() {
		List<Integer> count = orderService.countBystoreId();
		List<StoreBean> allstore =storeService.findAll(count);
		List<StoreTop> topList = new ArrayList<StoreTop>();
		String firmName=allstore.get(0).getFirmBean().getFirmName();
		StoreTop top1= new StoreTop();
		top1.setFirmBean(allstore.get(0).getFirmBean());
		top1.setStoreId(allstore.get(0).getStoreId());
		top1.setStoreName(allstore.get(0).getStoreName());
		topList.add(top1);
		for (StoreBean store : allstore) {
			if(topList.size()==3) {
				break;
			}
			if(!store.getFirmBean().getFirmName().equals(firmName)) {
			StoreTop top = new StoreTop();			
			top.setFirmBean(store.getFirmBean());
			top.setStoreId(store.getStoreId());
//			top.setProductImage(product.getProductImage());
//			top.setProductImage(null);
//			System.out.println(product.getProductImage());
			top.setStoreName(store.getStoreName());
			topList.add(top);
		}
			firmName=store.getFirmBean().getFirmName();
		}
//		topList.sort(Comparator.comparing(ProductTop::getCount));
		return topList;
	}

	@GetMapping("test")
	public String firmserch() {
		return "/front/frontfirmtest";
	}

	@GetMapping("test1")
	public String menu() {
		return "/front/productmenu";
	}

}
