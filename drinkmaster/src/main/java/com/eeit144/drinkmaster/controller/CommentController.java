package com.eeit144.drinkmaster.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eeit144.drinkmaster.bean.CommentBean;
import com.eeit144.drinkmaster.model.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@PostMapping("comment/insert")
	public String addcomment(@ModelAttribute("commentBean") CommentBean comment, Model model) {

		commentService.insertComment(comment);
		
		CommentBean commentBean = new CommentBean();
		
		CommentBean lastComment = commentService.getLastest();

		model.addAttribute("commentBean", commentBean);
		model.addAttribute("lastestComment", lastComment);
		
		return "backcommentadd";
		
	}
	
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
	

}
