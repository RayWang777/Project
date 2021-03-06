package com.eeit144.drinkmaster.back.controller;

import java.util.List;
import java.util.Optional;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.back.service.ProductCategoryServiceImp;
import com.eeit144.drinkmaster.back.service.StoreServiceImp;
import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.ProductCategoryBean;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.bean.UserBean;

@Controller
@Transactional
@RequestMapping("/backend")
@SessionAttributes (names= {"userBean","canSeeStore"})
public class ProductCategoryController {
	@Autowired private ProductCategoryServiceImp categoryService;
	@Autowired private StoreServiceImp storeService;
	@Autowired
	private FirmService firmService;
	@GetMapping("prodcuct/insertcategory")
	public String addCategoryView(Model m ,@SessionAttribute("canSeeStore") StoreBean storeBean ) {
		ProductCategoryBean category=new ProductCategoryBean();
		category.setStoreBean(storeBean);
		String storeNane=storeBean.getStoreName();
		m.addAttribute("storename",storeNane);
		m.addAttribute("status","確定新增");
		m.addAttribute("now","新增種類");
		m.addAttribute("category",category);
		m.addAttribute("insert", "category/add");
		return "/backend/backproductcategoryinsert";
	}
	@PostMapping("/category/add")
	public String saveCategory(@ModelAttribute("category") ProductCategoryBean cate ) {
		categoryService.insertCategory(cate);
		
		return "redirect:/backend/category/all";
	} 
	@GetMapping("category/all")
	public ModelAndView categoryView(ModelAndView mav, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber
			,@SessionAttribute("userBean") UserBean userBean) {
		mav.getModel().put("past", "1");
		if(userBean.getRole().equals("admin")) {
		Page<ProductCategoryBean> page = categoryService.findByPage(pageNumber);
		mav.getModel().put("page", page);
		}
		else if(userBean.getRole().equals("store")) {
			Optional<StoreBean> StoreByUserId = storeService.findStoreByUserId(userBean.getUserId());
			 StoreBean store= StoreByUserId.get();
			 
			 Page<ProductCategoryBean> page =categoryService.findByPage2(pageNumber, store.getStoreId());
			 mav.getModel().put("page", page);
		}
		else if(userBean.getRole().equals("firm")) {
			List<FirmBean> firmByUserId = firmService.findFirmByUserId(userBean.getUserId());
			FirmBean firm= firmByUserId.get(0);
			 
			 Page<ProductCategoryBean> page =categoryService.findByPage3(pageNumber, firm.getFirmId());
			 mav.getModel().put("page", page);
		}
		mav.setViewName("/backend/backcategory");
		return mav;
	}
	
	
	@GetMapping("category/select")
	public ModelAndView selectLike(ModelAndView mav, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
			@RequestParam("select") String select, @RequestParam("filed") String filed,@SessionAttribute("userBean") UserBean userBean) {
		mav.getModel().put("past", "2");
		if(userBean.getRole().equals("admin")){
		Page<ProductCategoryBean> page = categoryService.select(pageNumber, select, filed);
		mav.getModel().put("page", page);
		}
		else if(userBean.getRole().equals("firm")) {
			List<FirmBean> firmByUserId = firmService.findFirmByUserId(userBean.getUserId());
			FirmBean firm= firmByUserId.get(0);
			Page<ProductCategoryBean> page = categoryService.select2(pageNumber, select, filed,firm.getFirmId());
			mav.getModel().put("page", page);
		}
		else if(userBean.getRole().equals("store")) {
			Optional<StoreBean> StoreByUserId = storeService.findStoreByUserId(userBean.getUserId());
			 StoreBean store= StoreByUserId.get();
			Page<ProductCategoryBean> page = categoryService.select3(pageNumber, select, filed,store.getStoreId());
			mav.getModel().put("page", page);
		}
		mav.setViewName("/backend/backcategory");
		return mav;

	}
	@GetMapping("deletecategory")
	public String deleteCategoryById(@RequestParam("id") Integer id) {

		categoryService.deleteById(id);
		return "redirect:/backend/category/all";
}
	@GetMapping("editcategory")
	public String updateCategoryById(@RequestParam("id") Integer id,@SessionAttribute("canSeeStore") StoreBean storeBean, Model m) {
		ProductCategoryBean proBean = categoryService.findById(id);
		String storeNane=storeBean.getStoreName();
		m.addAttribute("storename",storeNane);
		m.addAttribute("status","確定修改");
		m.addAttribute("now","修改種類");
		m.addAttribute("category", proBean);
		m.addAttribute("insert", "updatecategory");
		return "/backend/backproductcategoryinsert";
	}
	@PostMapping("updatecategory")
	public String editCategory(@ModelAttribute("category") ProductCategoryBean cate ) {
		
		categoryService.insertCategory(cate);
		
		return "redirect:/backend/category/all";
	} 
}
