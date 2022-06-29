package com.eeit144.drinkmaster.front.controller;

import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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

import com.eeit144.drinkmaster.back.model.CommentService;
import com.eeit144.drinkmaster.bean.CommentBean;
import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.bean.UserBean;

@Controller
@SessionAttributes(names= {"userBean"})
@RequestMapping("front/")
public class FrontCommentController {
	
	@Autowired
	private CommentService commentService;
//	private Integer userId = 1;			//測試用
	private Integer storeId = 2;		//測試用
//	private Integer productId = 3;		//測試用
//	private Double score = 1.0;			//測試用
	private Integer scoreType = 10;		//測試用
	
	
	public String CommentStorePage(@PathVariable("storeid") StoreBean store, Model model) {
		
		Integer storeid = store.getStoreId();		
		
		commentService.findCommentByStoreid(storeid);
		
		
		return "frontcomment";
	}
	
	

//	@GetMapping("comment")
//	public String CommentaddPage(Model model) {   // , @PathVariable("storeId") StoreBean storeBean   @SessionAttribute("userBean") UserBean user, 
//		
//		
//		
////		userSession.getUserId();
////		storeBean.getStoreName();
//		
////		UserBean ub = new UserBean();
////		ProductBean pb = new ProductBean();
////		ub.setUserId(userSession.getUserId());
//		
//		StoreBean sb = new StoreBean();
//		
//		sb.setStoreId(storeId);
////		sb.setStoreName(storeBean.getStoreName());    store
//		
////		pb.setProductId(productId);
//		
//		
//		System.out.println("000111");
//		
//		List<CommentBean> findsId = commentService.findCommentByStoreid(storeId);
//		
//		
////		String userName = userid.getUserName();	
//		CommentBean commentBean = new CommentBean();
//	
////		commentBean.setUserBean(ub);
//		commentBean.setStoreBean(sb);
////		commentBean.setProductBean(pb);
////		commentBean.setScore(score);
//		commentBean.setScoreType(scoreType);	
////		StoreBean storeBean = new StoreBean();
//		CommentBean lastComment = commentService.getLastest();
//		
//		
//		
//		UserBean usertest = (UserBean)model.getAttribute("userBean");
//		
//		List<CommentBean> findusId = null;
//		
//		if(usertest != null) {
//			
//		Integer userId = usertest.getUserId();
//		
//		findusId = commentService.findCommentByUseridAndStoreid(userId, storeId);
//		
//		}
//		
//		
////		model.addAttribute("ub", ub);
//		model.addAttribute("findsId", findsId);
//		model.addAttribute("findusId", findusId);
//		model.addAttribute("commentBean", commentBean);
////		model.addAttribute("storeBean", storeBean);
//		model.addAttribute("lastestComment", lastComment);
//		
//		return "/front/frontcommentadd";
//	}
	
	
	
	@PostMapping("comment/insert")
	public String addcomment(@RequestPart("commentPhoto1") MultipartFile cPhoto, 
							@ModelAttribute("commentBean") CommentBean comment,
							@RequestParam("userid") UserBean sessionUser, Model model) throws Exception {

		
		if(!cPhoto.isEmpty()) {
			String temp=new String(Base64.getEncoder().encode(cPhoto.getBytes()));
			String profile="data:image/png;base64,"+temp;
			
			comment.setCommentPhoto(profile);
		}
		
		
		comment.setUserBean(sessionUser);
		
		commentService.insertComment(comment);
		

		
		return "redirect:/front/comment/all";
		
	}
	
	
	
	
	@GetMapping("comment/timeasc")
	public String viewMessage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		
		Pageable pageable = PageRequest.of(pageNumber-1,3,Sort.Direction.ASC,"createTime");
		
		Page<CommentBean> page = commentService.findCommentByStoreidPage(storeId,pageable);		
		
		model.addAttribute("page",page);
		
		return "/front/frontcommentview";
		
	}
	
	@GetMapping("comment/all")
	public String viewtimedesc(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {      //, @RequestParam("storeId") Integer storeId
		
		StoreBean sb = new StoreBean();
		
		sb.setStoreId(storeId);	
		
//		List<CommentBean> findCommentById = commentService.findCommentByStoreid(storeId);
		
		
		Pageable pageable = PageRequest.of(pageNumber-1,3,Sort.Direction.DESC,"createTime");
		
		Page<CommentBean> page = commentService.findCommentByStoreidPage(storeId,pageable);
		
		
		
		CommentBean commentBean = new CommentBean();
		
		commentBean.setStoreBean(sb);
		
		commentBean.setScoreType(scoreType);
		
		
		UserBean usertest = (UserBean)model.getAttribute("userBean");
		
		List<CommentBean> findusId = null;
		
		if(usertest != null) {
			
		Integer userId = usertest.getUserId();
		
		findusId = commentService.findCommentByUseridAndStoreid(userId, storeId);
		
		}
		
		
//		List<CommentBean> page = commentService.getCreateTimeDesc();
		
//		Pageable pageable = PageRequest.of(pageNumber-1,3,Sort.Direction.DESC,"createTime");
//		
//		Page<CommentBean> page = commentService.findCommentByStoreidPage(storeId, pageable);
		
		model.addAttribute("commentBean", commentBean);
		
//		model.addAttribute("findCommentById", findCommentById);
		model.addAttribute("findusId", findusId);
		model.addAttribute("page",page);
		
		return "/front/frontcommentview";
		
	}
	




	@GetMapping("comment/scoredesc")
	public String viewscoredesc(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		
		Pageable pageable = PageRequest.of(pageNumber-1,3,Sort.Direction.DESC,"score");
		
		Page<CommentBean> page = commentService.findCommentByStoreidPage(storeId,pageable);
		
		model.addAttribute("page",page);
		
		return "/front/frontcommentview";
		
	}
	
	@GetMapping("comment/scoreasc")
	public String viewscoreasc(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		
		Pageable pageable = PageRequest.of(pageNumber-1,3,Sort.Direction.ASC,"score");
		
		Page<CommentBean> page = commentService.findCommentByStoreidPage(storeId,pageable);
		
		model.addAttribute("page",page);
		
		return "/front/frontcommentview";
		
	}
	
	
//	@GetMapping("comment/scoreasc")
//	public String pageviewscoreasc(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model) {
//		
//		Page<CommentBean> page = commentService.findPageByOrderByScoreAsc(pageNumber);
//		
//		model.addAttribute("page",page);
//		
//		return "/backend/backcommentview";
//		
//	}
	
//	@GetMapping("comment/all")
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
