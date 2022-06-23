package com.eeit144.drinkmaster.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eeit144.drinkmaster.bean.CommentBean;
import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.model.CommentService;

@Controller
@RequestMapping("/backend")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	private Integer userId = 1;			//測試用
	private Integer storeId = 2;		//測試用
	private Integer productId = 3;		//測試用
//	private Double score = 1.0;			//測試用
	private Integer scoreType = 10;		//測試用
	
	
	
	@GetMapping("/comment")
	public String CommentaddPage(Model model) {   //@ModelAttribute("userId")UserBean userid,
		
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
//		commentBean.setScore(score);
		commentBean.setScoreType(scoreType);	
//		StoreBean storeBean = new StoreBean();
		CommentBean lastComment = commentService.getLastest();
		
		model.addAttribute("commentBean", commentBean);
//		model.addAttribute("storeBean", storeBean);
		model.addAttribute("lastestComment", lastComment);
		return "backcommentadd";
	}
	
	
	
	@PostMapping("comment/insert")
	public String addcomment(@ModelAttribute("commentBean") CommentBean comment, Model model) {

		commentService.insertComment(comment);
		
		CommentBean commentBean = new CommentBean();
		
		CommentBean lastComment = commentService.getLastest();

		model.addAttribute("commentBean", commentBean);
		model.addAttribute("lastestComment", lastComment);
		
		return "backcommentadd";
		
	}
	
	
	@GetMapping("/comment/all")
	public String viewMessage(Model model) {
		
		List<CommentBean> page = commentService.findAll();
		
		model.addAttribute("page",page);
		
		return "backcommentview";
		
	}
	
	
	
	
	
//	@GetMapping("/comment/all")
//	public String viewMessage(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model) {
//		
//		Page<CommentBean> page = commentService.findByPage(pageNumber);
//			
//		model.addAttribute("page",page);
//		
//		return "backcommentview";
//		
//	}
	
	
	@GetMapping("comment/editComment")
	public String editComment(@RequestParam("commentid") Integer id,Model model) {
		
		CommentBean comment = commentService.findById(id);
		
		model.addAttribute("comment", comment);
		
		return "backcommentedit";
	}
	
	
	@PostMapping("comment/editComment")
	public String postEditComment(@ModelAttribute(name="comment") CommentBean comment) {
		
		commentService.insertComment(comment);
		
		return "redirect:/backend/comment/all";	
	}
	
	@GetMapping("comment/delete")
	public String deletemsg(@RequestParam(name="commentid") Integer id) {
		commentService.deleteById(id);
		
		return "redirect:/backend/comment/all";
	}
	
	
	
//	@PostMapping("comment/insert")
//	public String addcomment(@RequestBody CommentBeanDTO commentdto, Model model) {
//
//		Integer userId = commentdto.getUserid();
//		Integer storeId = commentdto.getStoreId();
//		
//		
//		
//		CommentBean commentBean = new CommentBean();
//		
//		commentBean.setContent(commentdto.getContent());
//		commentBean.setScore(commentdto.getScore());
//		commentBean.setScore(commentdto.getScore());
//		
//		
//		commentService.insertComment();
//		
//		
//		
//		model.addAttribute("comments", );
//		
//		return "addcomment";
//		
//	}
	
	@PostMapping("comment/commentstore")
	public String findCommentByStoreid(@RequestParam("storeId")Integer storeId, Model model){
		
		List<CommentBean> CBS = commentService.findCommentByStoreid(storeId);
		
		model.addAttribute("CBS", CBS);
		
		return "commentstore" ;
	}
	
	

}
