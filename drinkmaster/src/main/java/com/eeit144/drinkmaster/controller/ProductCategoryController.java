package com.eeit144.drinkmaster.controller;

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

import com.eeit144.drinkmaster.bean.ProductCategoryBean;
import com.eeit144.drinkmaster.service.ProductCategoryServiceImp;

@Controller
@Transactional
@RequestMapping("/backend")
public class ProductCategoryController {
	@Autowired ProductCategoryServiceImp categoryService;
	
	@GetMapping("prodcuct/insertcategory")
	public String addCategoryView(Model m) {
		ProductCategoryBean category=new ProductCategoryBean();
		m.addAttribute("status","確定新增");
		m.addAttribute("now","新增種類");
		m.addAttribute("category",category);
		m.addAttribute("insert", "category/add");
		return "backproductcategoryinsert";
	}
	@PostMapping("/category/add")
	public String saveCategory(@ModelAttribute("category") ProductCategoryBean cate ) {
		categoryService.insertCategory(cate);
		
		return "redirect:/backend/category/all";
	} 
	@GetMapping("category/all")
	public ModelAndView categoryView(ModelAndView mav, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		Page<ProductCategoryBean> page = categoryService.findByPage(pageNumber);

		mav.getModel().put("page", page);
		mav.setViewName("backcategory");
		return mav;
	}
	@GetMapping("category/select")
	public ModelAndView selecCategorytLike(ModelAndView mav, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
			@RequestParam("select") String select, @RequestParam("filed") String filed) {

		
		mav.setViewName("backcategory");
		return mav;
	}
	@GetMapping("deletecategory")
	public String deleteCategoryById(@RequestParam("id") Integer id) {

		categoryService.deleteById(id);
		return "redirect:/backend/category/all";
}
	@GetMapping("editcategory")
	public String updateCategoryById(@RequestParam("id") Integer id, Model m) {
		ProductCategoryBean proBean = categoryService.findById(id);
		m.addAttribute("status","確定修改");
		m.addAttribute("now","修改種類");
		m.addAttribute("category", proBean);
		m.addAttribute("insert", "updatecategory");
		return "backproductcategoryinsert";
	}
	@PostMapping("updatecategory")
	public String editCategory(@ModelAttribute("category") ProductCategoryBean cate ) {
		
		categoryService.insertCategory(cate);
		
		return "redirect:/backend/category/all";
	} 
}
