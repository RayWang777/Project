package com.eeit144.drinkmaster.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.bean.ProductBean;

import com.eeit144.drinkmaster.service.ProductServiceImp;

@Controller
@Transactional
@RequestMapping("/backend")
public class ProductController {
	@Autowired
	private ProductServiceImp proService;

	@GetMapping("product/insertview")
	public String addView(Model m) {
		ProductBean pro = new ProductBean();
		m.addAttribute("product", pro);
		return "backproductinsert";
	}

	@PostMapping("/product/insert")
	public String insertProduct(@ModelAttribute("product") ProductBean pro, Model m) {
		proService.insertProduct(pro);

		return "redirect:/backend/product/all";
	}

	@GetMapping("product/all")
	public ModelAndView findView(ModelAndView mav, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		Page<ProductBean> page = proService.findByPage(pageNumber);

		mav.getModel().put("page", page);
		mav.setViewName("backproduct");
		return mav;
	}

	@GetMapping("product/select")
	public ModelAndView selectLike(ModelAndView mav, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
			@RequestParam("select") String select) {

		System.out.println(select);

		Page<ProductBean> page = proService.select(pageNumber, "%" + select + "%");
		mav.getModel().put("page", page);

		mav.setViewName("backproduct");
		return mav;
	}

	@GetMapping("deleteproduct")
	public String deleteById(@RequestParam("id") Integer id) {

		proService.deleteById(id);
		return "redirect:/backend/product/all";

	}

	@GetMapping("editproduct")
	public String updateById(@RequestParam("id") Integer id, Model m) {
		ProductBean proBean = proService.findById(id);
		m.addAttribute("product", proBean);
		return "backendproductupdate";
	}

	@PostMapping("updateproduct")
	public String postUpdate(@ModelAttribute("product") ProductBean pro, Model m) {
		proService.insertProduct(pro);

		return "redirect:/backend/product/all";
	}
}
