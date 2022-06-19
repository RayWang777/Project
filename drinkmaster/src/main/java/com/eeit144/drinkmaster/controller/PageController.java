package com.eeit144.drinkmaster.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.eeit144.drinkmaster.bean.CommentBean;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.model.CommentService;

@Controller
@RequestMapping("/backend")
public class PageController {
	
	
	@Autowired
	private CommentService commentService;
	
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

	@GetMapping("/store")
	public String storePage() {
		return "backstore";
	}

	@GetMapping("/product")
	public String productPage() {
		return "backproductinsert";
	}
	

	@GetMapping("/shoppingcar")
	public String shoppingcarPage() {
		return "backshoppingcar";
	}

	@GetMapping("/order")
	public String orderPage() {
		return "backorder";
	}

//	@GetMapping("/comment")
//	public String commentPage() {
//		return "backcomment";
//	}
	
	@GetMapping("/comment")
	public String addCommentPage(Model model) {   //@ModelAttribute("userId")UserBean userid,
		
//		String userName = userid.getUserName();
		
		CommentBean commentBean = new CommentBean();
		
//		StoreBean storeBean = new StoreBean();
		
		CommentBean lastComment = commentService.getLastest();

		model.addAttribute("commentBean", commentBean);
//		model.addAttribute("storeBean", storeBean);
		model.addAttribute("lastestComment", lastComment);
		

		return "addcomment";
	}
	
	
	@GetMapping("/comment/all")
	public String viewMessage(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model) {
		
		Page<CommentBean> page = commentService.findByPage(pageNumber);
			
		model.addAttribute("page",page);
		
		return "viewcomment";
		
	}
	
	

	@GetMapping("/service")
	public String servicePage() {
		return "backservice";
	}

}
