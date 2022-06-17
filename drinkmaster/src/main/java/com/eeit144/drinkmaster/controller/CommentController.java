package com.eeit144.drinkmaster.controller;

import java.util.Optional;

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
	
	@PostMapping("postComment")
	public String addcomment(@ModelAttribute("comments") CommentBean comment, Model model) {

		commentService.insertComment(comment);
		
		CommentBean newComment = new CommentBean();
		
		model.addAttribute("comments", newComment);
		
		return "addcomment";
		
	}
	
	@GetMapping("comment/editComment")
	public String editComment(@RequestParam("id") Integer id,Model model) {
		
		Optional<CommentBean> comment = commentService.findById(id);
		
		model.addAttribute("comment", comment);
		
		return "editComment";
	}
	
	@PostMapping("comment/editComment")
	public String postEditComment(@ModelAttribute(name="Comment") CommentBean comment) {
		
		commentService.insertComment(comment);
		
		return "redirect:/comment/all";
		
	}
	
	@GetMapping("message/delete")
	public String deletemsg(@RequestParam(name="id") Integer id) {
		commentService.deleteById(id);
		
		return "redirect:/comment/all";
	}
	
	

}
