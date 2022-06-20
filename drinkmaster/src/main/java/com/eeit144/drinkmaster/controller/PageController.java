package com.eeit144.drinkmaster.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/backend")
public class PageController {
	
	@GetMapping("/")
	public String welcomePage() {
		return "backindex";
	}

	@GetMapping("/user")
	String userPage() {
		return "backuser";
	}
	
	@GetMapping("/firm")
	public String firmPage() {
		return "backfirm";
	}

	@GetMapping("/firm/add")
	public String firmAddPage(Model m) {
		FirmDTO firm = new FirmDTO();
		m.addAttribute("firm", firm);
		m.addAttribute("save", "新增廠商");
		return "backfirmadd";
	}
	
	@GetMapping("/store")
	public String storePage() {
		return "backstore";
	}
	
	@GetMapping("/store/add")
	public String storeAddPage(Model m) {
		StoreDTO store = new StoreDTO();
		m.addAttribute("store", store);
		m.addAttribute("save", "新增店家");
		return "backstoreadd";
	}

	@GetMapping("/product")
	public String productPage() {
		return "backproduct";
	}
	

	@GetMapping("/shoppingcar")
	public String shoppingcarPage() {
		return "backshoppingcar";
	}

	@GetMapping("/order")
	public String orderPage() {
		return "backorder";
	}

	@GetMapping("/comment")
	public String addCommentPage(Model model) {   //@ModelAttribute("userId")UserBean userid,
		
		UserBean ub = new UserBean();
		StoreBean sb = new StoreBean();
		ProductBean pb = new ProductBean();
		ub.setUserId(userId);
		sb.setStoreId(storeId);
		pb.setProductId(productId);
		
//		String userName = userid.getUserName();
		
		CommentBean commentBean = new CommentBean();
		
		commentBean.setUserBean(ub);
		commentBean.setStoreBean(sb);
		commentBean.setProductBean(pb);
		commentBean.setScore(score);
		commentBean.setScoreType(scoreType);
		
//		StoreBean storeBean = new StoreBean();
		
		CommentBean lastComment = commentService.getLastest();

		model.addAttribute("commentBean", commentBean);
//		model.addAttribute("storeBean", storeBean);
		model.addAttribute("lastestComment", lastComment);
		

		return "backcommentadd";
	}
	
	
	@GetMapping("/comment/all")
	public String viewMessage(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model) {
		
		Page<CommentBean> page = commentService.findByPage(pageNumber);
			
		model.addAttribute("page",page);
		
		return "backcommentview";
		
	}
	@GetMapping("/service")
	public String servicePage() {
		return "backservice";
	}

	
}
