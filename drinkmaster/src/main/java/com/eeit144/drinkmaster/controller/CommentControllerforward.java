package com.eeit144.drinkmaster.controller;

import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.eeit144.drinkmaster.bean.CommentBean;
import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.model.CommentService;

@Controller
@SessionAttributes(names= {"userBean"})
@RequestMapping("/front")
public class CommentControllerforward {
	
	@Autowired
	private CommentService commentService;
//	private Integer userId = 1;			//測試用
	private Integer storeId = 2;		//測試用
//	private Integer productId = 3;		//測試用
//	private Double score = 1.0;			//測試用
	private Integer scoreType = 10;		//測試用
	
	
	
	@GetMapping("/comment")
	public String CommentaddPage(@SessionAttribute("userBean") UserBean user, Model model) {   // , @PathVariable("storeId") StoreBean storeBean   
		
		
//		userSession.getUserId();
//		storeBean.getStoreName();
		
		UserBean ub = new UserBean();
		StoreBean sb = new StoreBean();
//		ProductBean pb = new ProductBean();
//		ub.setUserId(userSession.getUserId());
		
		sb.setStoreId(storeId);
//		sb.setStoreName(storeBean.getStoreName());    store
		
//		pb.setProductId(productId);
		
		
		System.out.println("000111");
		
		List<CommentBean> findsId = commentService.findCommentByStoreid(storeId);
		
		
//		String userName = userid.getUserName();	
		CommentBean commentBean = new CommentBean();
	
//		commentBean.setUserBean(ub);
		commentBean.setStoreBean(sb);
//		commentBean.setProductBean(pb);
//		commentBean.setScore(score);
		commentBean.setScoreType(scoreType);	
//		StoreBean storeBean = new StoreBean();
		CommentBean lastComment = commentService.getLastest();
		
		
//		Object user = model.getAttribute("userBean");
		
//		ub.setUserId(user.getUserId());
		Integer userid = user.getUserId();
		
		System.out.println("000000000000" +user.getUserId());
		
		List<CommentBean> findusId = commentService.findCommentByUseridAndStoreid(userid, storeId);
		
		System.out.println("============1" + findusId);
//		
//		for(CommentBean us:findusId) {
//			us.getUserId();
//			ub.setUserId(us.getUserId());
//			System.out.println("=============2"+ub.getUserId());
//			
//			
//		}
		
		
		
		
//		model.addAttribute("ub", ub);
		model.addAttribute("findsId", findsId);
		model.addAttribute("findusId", findusId);
		model.addAttribute("commentBean", commentBean);
//		model.addAttribute("storeBean", storeBean);
		model.addAttribute("lastestComment", lastComment);
		
		return "/front/frontcommentadd";
	}
	
	
	
	@PostMapping("comment/insert")
	public String addcomment(@RequestPart("commentPhoto1") MultipartFile cPhoto, 
							@ModelAttribute("commentBean") CommentBean comment,
							@RequestParam("userid") UserBean sessionUser, Model model) throws Exception {

		
		if(!cPhoto.isEmpty()) {
			String temp=new String(Base64.getEncoder().encode(cPhoto.getBytes()));
			String profile="data:image/png;base64,"+temp;
			
			comment.setCommentPhoto(profile);
		}
		
		
//		List<CommentBean> findusId = commentService.findCommentByUseridAndStoreid(userId, storeId);
//		
//		System.out.println(findusId);
		
		comment.setUserBean(sessionUser);
		
		commentService.insertComment(comment);
		
		CommentBean commentBean = new CommentBean();
		
		CommentBean lastComment = commentService.getLastest();

		
//		model.addAttribute("findusId", findusId);
		model.addAttribute("commentBean", commentBean);
		model.addAttribute("lastestComment", lastComment);
		
		return "/front/frontcommentadd";
		
	}
	
	
	
	
//	@GetMapping("/comment/timeasc")
	public String viewMessage(Model model) {
		
		List<CommentBean> page = commentService.getCreateTimeAsc();
		
		model.addAttribute("page",page);
		
		return "backcommentview";
		
	}
	
//	@GetMapping("/comment/all")
	public String viewtimedesc(Model model) {
		
		List<CommentBean> page = commentService.getCreateTimeDesc();
		
		model.addAttribute("page",page);
		
		return "/backend/backcommentview";
		
	}
	
//	@GetMapping("/comment/scoredesc")
	public String viewscoredesc(Model model) {
		
		List<CommentBean> page = commentService.getScoreDesc();
		
		model.addAttribute("page",page);
		
		return "/backend/backcommentview";
		
	}
	
//	@GetMapping("/comment/scoreasc")
	public String viewscoreasc(Model model) {
		
		List<CommentBean> page = commentService.getScoreAsc();
		
		model.addAttribute("page",page);
		
		return "/backend/backcommentview";
		
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
	
	
//	@GetMapping("comment/editComment")
	public String editComment(@RequestParam("commentid") Integer id,Model model) {
		
		CommentBean comment = commentService.findById(id);
		
		model.addAttribute("comment", comment);
		
		return "/backend/backcommentedit";
	}
	
	
//	@PostMapping("comment/editComment")
	public String postEditComment(@RequestPart("commentPhoto1") MultipartFile cPhoto,@RequestParam("commentid") Integer id) throws Exception {
		
		
		CommentBean comment = commentService.findById(id);
		
		if(!cPhoto.isEmpty()) {
			String temp=new String(Base64.getEncoder().encode(cPhoto.getBytes()));
			String profile="data:image/png;base64,"+temp;
			
			comment.setCommentPhoto(profile);
		}
		
		
		commentService.insertComment(comment);
		
		return "redirect:/backend/comment/all";	
	}
	
//	@GetMapping("comment/delete")
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
	
//	@PostMapping("comment/commentstore")
	@ResponseBody
	public List<CommentBean> findCommentByStoreid(@RequestParam("storeId")Integer storeId, Model model){
		
		List<CommentBean> CBS = commentService.findCommentByStoreid(storeId);
		
//		model.addAttribute("CBS", CBS);
		
		return CBS ;
	}
	
	

}
