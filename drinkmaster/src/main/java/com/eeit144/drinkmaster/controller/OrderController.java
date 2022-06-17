package com.eeit144.drinkmaster.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eeit144.drinkmaster.bean.OrderBean;

import com.eeit144.drinkmaster.model.OrderService;

@Controller
public class OrderController {

		private OrderService ordService;
		
		@GetMapping("order/delete")
		public String deleteOrder(@RequestParam("id") Integer id) {
			ordService.deleteById(id);
			return "backorder";
		}
		

}
