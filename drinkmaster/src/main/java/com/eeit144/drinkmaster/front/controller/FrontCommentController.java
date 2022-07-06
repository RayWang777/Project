package com.eeit144.drinkmaster.front.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.eeit144.drinkmaster.back.model.CommentService;
import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.back.model.StoreService;
import com.eeit144.drinkmaster.bean.CommentBean;
import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.dto.CommentAvgScoreBeanDTO;
import com.eeit144.drinkmaster.dto.CommentBeanDTO;
import com.eeit144.drinkmaster.dto.UserBeanDTO;

@Controller
@SessionAttributes(names= {"canSeeUser"})
@RequestMapping("front/")
public class FrontCommentController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private FirmService firmService;
	
	@Autowired
	private StoreService storeService;
//	private Integer userId = 1;			//測試用
//	private Integer storeId = 2;		//測試用
//	private Integer productId = 3;		//測試用
//	private Double score = 1.0;			//測試用
	private Integer scoreType = 10;		//測試用
	
	
	@GetMapping("comment/firmcomment")
	public String firmcomment(Model model) {
		
		
		List<FirmBean> firm = firmService.findAll3();
		
		
		model.addAttribute("firm", firm);
		
		return "front/frontfirmcomment";
		
	}
	
	
	@GetMapping("comment/storecomment")
	public String CommentStorePage(@RequestParam("commentfirmid") Integer commentfirmid, Model model) {
		
		
		
		List<CommentAvgScoreBeanDTO> listcsdto = new ArrayList<>();
		
		List<StoreBean> commentStore = storeService.findStoreByFirmId(commentfirmid);

		
		
		for(int i=0 ; i<commentStore.size(); i++) {
			CommentAvgScoreBeanDTO csdto = new CommentAvgScoreBeanDTO();
			csdto.setStoreId(commentStore.get(i).getStoreId());
			csdto.setStoreName(commentStore.get(i).getStoreName());
			csdto.setFirmName(commentStore.get(i).getFirmBean().getFirmName());
			csdto.setFirmId(commentStore.get(i).getFirmBean().getFirmId());
			csdto.setAvgScore(commentService.avgScoreByStoreid(commentStore.get(i).getStoreId()));
			csdto.setCountScore(commentService.countStoreidByStoreid(commentStore.get(i).getStoreId()));
			listcsdto.add(csdto);
		}
		
		
		
//		Double avg = commentService.avgScoreByStoreid(csdto.getStoreId());
		
		
		
		model.addAttribute("listcsdto", listcsdto);
//		model.addAttribute("intmap", intmap);
		model.addAttribute("commentStore", commentStore);
		
		return "front/frontcomment";
	}
	
	
	@GetMapping("comment/storenamelike")
	public String storelikename(@RequestParam("commentstorename") String storename, @RequestParam("commentfirmid") Integer commentfirmid, Model model) {
		
		
		
		List<CommentAvgScoreBeanDTO> listcsdto = new ArrayList<>();
		
		List<StoreBean> commentStore = storeService.findStoreByFirmId(commentfirmid);
		
		List<StoreBean> commentStoreLike = storeService.findStoreByStoreNameLike(storename);
		
		if(commentStoreLike != null) {
			
		for(int i=0 ; i<commentStoreLike.size(); i++) {
			CommentAvgScoreBeanDTO csdto = new CommentAvgScoreBeanDTO();
			csdto.setStoreId(commentStoreLike.get(i).getStoreId());
			csdto.setStoreName(commentStoreLike.get(i).getStoreName());
			csdto.setFirmName(commentStoreLike.get(i).getFirmBean().getFirmName());
			csdto.setFirmId(commentStoreLike.get(i).getFirmBean().getFirmId());
			csdto.setAvgScore(commentService.avgScoreByStoreid(commentStoreLike.get(i).getStoreId()));
			if(commentStoreLike.get(i).getFirmBean().getFirmId() == commentfirmid) {
			listcsdto.add(csdto);
				}
			}
		}else {
			
			for(int i=0 ; i<commentStore.size(); i++) {
				CommentAvgScoreBeanDTO csdto = new CommentAvgScoreBeanDTO();
				csdto.setStoreId(commentStore.get(i).getStoreId());
				csdto.setStoreName(commentStore.get(i).getStoreName());
				csdto.setFirmName(commentStore.get(i).getFirmBean().getFirmName());
				csdto.setFirmId(commentStore.get(i).getFirmBean().getFirmId());
				csdto.setAvgScore(commentService.avgScoreByStoreid(commentStore.get(i).getStoreId()));
				if(commentStore.get(i).getFirmBean().getFirmId() == commentfirmid) {
				listcsdto.add(csdto);
					}
				}
			
		}
		model.addAttribute("listcsdto", listcsdto);
		model.addAttribute("commentStore", commentStore);
		
//		String url = "redirect:http://localhost:8081/drinkmaster/front/comment/storecomment?commentfirmid=" + commentfirmid;
		
		return "front/frontcomment";
	}
	
	
	@GetMapping("comment/avgscoredesc")
	public String avgscoredesc(@RequestParam("commentfirmid") Integer commentfirmid, Model model) {
		
			
		List<StoreBean> commentStore = storeService.findStoreByFirmId(commentfirmid);

		List<Integer> findCommentByAvgDesc = commentService.findCommentByAvgDesc();
		
		for(Integer storeid:findCommentByAvgDesc) {
			System.out.println(storeid);
		}
		
		List<CommentAvgScoreBeanDTO> listcsdto = new ArrayList<CommentAvgScoreBeanDTO>();
		
		CommentAvgScoreBeanDTO csdto =null;
		for(Integer one: findCommentByAvgDesc) {
			
			csdto= new CommentAvgScoreBeanDTO();
			StoreBean storeBean = storeService.findById(one).get();
			csdto.setStoreId(storeBean.getStoreId());
			csdto.setStoreName(storeBean.getStoreName());
			csdto.setFirmName(storeBean.getFirmBean().getFirmName());
			csdto.setFirmId(storeBean.getFirmBean().getFirmId());
			csdto.setAvgScore(commentService.avgScoreByStoreid(storeBean.getStoreId()));
			if(storeBean.getFirmBean().getFirmId() == commentfirmid) {
				listcsdto.add(csdto);
			}
		}
		
		
		model.addAttribute("listcsdto", listcsdto);
		model.addAttribute("commentStore", commentStore);
		
		return "front/frontcomment";
	}
	
	
	@GetMapping("comment/avgscoreasc")
	public String avgscoreasc(@RequestParam("commentfirmid") Integer commentfirmid, Model model) {
		
			
		List<StoreBean> commentStore = storeService.findStoreByFirmId(commentfirmid);

		List<Integer> findCommentByAvgAsc = commentService.findCommentByAvgAsc();
		
		for(Integer storeid:findCommentByAvgAsc) {
			System.out.println(storeid);
		}
		
		List<CommentAvgScoreBeanDTO> listcsdto = new ArrayList<CommentAvgScoreBeanDTO>();
		
		CommentAvgScoreBeanDTO csdto =null;
		for(Integer one: findCommentByAvgAsc) {
			
			csdto= new CommentAvgScoreBeanDTO();
			StoreBean storeBean = storeService.findById(one).get();
			csdto.setStoreId(storeBean.getStoreId());
			csdto.setStoreName(storeBean.getStoreName());
			csdto.setFirmName(storeBean.getFirmBean().getFirmName());
			csdto.setFirmId(storeBean.getFirmBean().getFirmId());
			csdto.setAvgScore(commentService.avgScoreByStoreid(storeBean.getStoreId()));
			if(storeBean.getFirmBean().getFirmId() == commentfirmid) {
				listcsdto.add(csdto);
			}
		}
		
		
		model.addAttribute("listcsdto", listcsdto);
		model.addAttribute("commentStore", commentStore);
		
		return "front/frontcomment";
	}
	
	
	
	@GetMapping("comment/usercomment")
	public String usercomment(@RequestParam("commentuserid") Integer userid, Model model) {
		
		List<CommentBean> userComment = commentService.findCommentByUserid(userid);
		
		model.addAttribute("userComment", userComment);
		
		return "front/frontcommentusercomment";
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
							@RequestParam("sessionuserid") UserBean sessionUser,
							@RequestParam("storeBean") Integer storeid, Model model) throws Exception {

		
		if(!cPhoto.isEmpty()) {
			String temp=new String(Base64.getEncoder().encode(cPhoto.getBytes()));
			String profile="data:image/png;base64,"+temp;
			
			comment.setCommentPhoto(profile);
		}
		
//		comment.setStoreId(storeid);
		
		comment.setUserBean(sessionUser);
		
		commentService.insertComment(comment);
		
		String url = "redirect:http://localhost:8081/drinkmaster/front/comment/all?storeid=" + storeid;
		
		return url;
		
	}
	
	
	
	
	@GetMapping("comment/timeasc")
	public String viewMessage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, @RequestParam("storeid") Integer storeid, Model model) {
		
		Pageable pageable = PageRequest.of(pageNumber-1,3,Sort.Direction.ASC,"createTime");
		
		Page<CommentBean> page = commentService.findCommentByStoreidPage(storeid,pageable);	
		
		
		StoreBean sb = new StoreBean();
		
		sb.setStoreId(storeid);	
		
		CommentBean commentBean = new CommentBean();
		
		commentBean.setStoreBean(sb);
		
		commentBean.setScoreType(scoreType);
		
		
		UserBean usertest = (UserBean)model.getAttribute("canSeeUser");
		
		List<CommentBean> findusId = null;
		
		if(usertest != null) {
			
		Integer userId = usertest.getUserId();
		
		findusId = commentService.findCommentByUseridAndStoreid(userId, storeid);
		
		}
		
		ArrayList<Object> arrayList = new ArrayList<>();
		
		Optional<StoreBean> newstore = storeService.findById(storeid);
		
		if(newstore.isPresent()) {
			arrayList.add(newstore.get());
		}
		
		model.addAttribute("commentBean", commentBean);
		model.addAttribute("arrayList", arrayList);
		
		model.addAttribute("findusId", findusId);
		model.addAttribute("page",page);
		
		return "/front/frontcommentview";
		
	}
	
	@GetMapping("comment/all")
	public String viewtimedesc(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, @RequestParam("storeid") Integer storeid, Model model) {      //, @RequestParam("storeId") Integer storeId
		
		
		
//		List<CommentBean> findCommentById = commentService.findCommentByStoreid(storeId);
		
		
		Pageable pageable = PageRequest.of(pageNumber-1,3,Sort.Direction.DESC,"createTime");
		
		Page<CommentBean> page = commentService.findCommentByStoreidPage(storeid,pageable);
		
		StoreBean sb = new StoreBean();
		
		sb.setStoreId(storeid);	
		
		CommentBean commentBean = new CommentBean();
		
		commentBean.setStoreBean(sb);
		
		commentBean.setScoreType(scoreType);
		
		
		UserBean usertest = (UserBean)model.getAttribute("canSeeUser");
		
		List<CommentBean> findusId = null;
		
		if(usertest != null) {
			
		Integer userId = usertest.getUserId();
		
		findusId = commentService.findCommentByUseridAndStoreid(userId, storeid);
		
		}
		
		
//		List<CommentBean> page = commentService.getCreateTimeDesc();
		
//		Pageable pageable = PageRequest.of(pageNumber-1,3,Sort.Direction.DESC,"createTime");
//		
//		Page<CommentBean> page = commentService.findCommentByStoreidPage(storeId, pageable);
		
		ArrayList<Object> arrayList = new ArrayList<>();
		
		Optional<StoreBean> newstore = storeService.findById(storeid);
		
		if(newstore.isPresent()) {
			arrayList.add(newstore.get());
		}
		
		
		model.addAttribute("commentBean", commentBean);
		model.addAttribute("arrayList", arrayList);
		
//		model.addAttribute("findCommentById", findCommentById);
		model.addAttribute("findusId", findusId);
		model.addAttribute("page",page);
		
//		String url = "http://localhost:8081/drinkmaster/front/comment/all?storeid=" + storeid;
		
		return "/front/frontcommentview";
		
	}
	




	@GetMapping("comment/scoredesc")
	public String viewscoredesc(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, @RequestParam("storeid") Integer storeid, Model model) {
		
		Pageable pageable = PageRequest.of(pageNumber-1,3,Sort.Direction.DESC,"score");
		
		Page<CommentBean> page = commentService.findCommentByStoreidPage(storeid,pageable);
		
		
		StoreBean sb = new StoreBean();
		
		sb.setStoreId(storeid);	
		
		CommentBean commentBean = new CommentBean();
		
		commentBean.setStoreBean(sb);
		
		commentBean.setScoreType(scoreType);
		
		
		UserBean usertest = (UserBean)model.getAttribute("canSeeUser");
		
		List<CommentBean> findusId = null;
		
		if(usertest != null) {
			
		Integer userId = usertest.getUserId();
		
		findusId = commentService.findCommentByUseridAndStoreid(userId, storeid);
		
		}
		
		ArrayList<Object> arrayList = new ArrayList<>();
		
		Optional<StoreBean> newstore = storeService.findById(storeid);
		
		if(newstore.isPresent()) {
			arrayList.add(newstore.get());
		}
		
		model.addAttribute("commentBean", commentBean);
		model.addAttribute("arrayList", arrayList);
		
		model.addAttribute("findusId", findusId);
		model.addAttribute("page",page);
		
		return "/front/frontcommentview";
		
	}
	
	@GetMapping("comment/scoreasc")
	public String viewscoreasc(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, @RequestParam("storeid") Integer storeid, Model model) {
		
		Pageable pageable = PageRequest.of(pageNumber-1,3,Sort.Direction.ASC,"score");
		
		Page<CommentBean> page = commentService.findCommentByStoreidPage(storeid,pageable);
		
		StoreBean sb = new StoreBean();
		
		sb.setStoreId(storeid);	
		
		CommentBean commentBean = new CommentBean();
		
		commentBean.setStoreBean(sb);
		
		commentBean.setScoreType(scoreType);		
		
		UserBean usertest = (UserBean)model.getAttribute("canSeeUser");
		
		List<CommentBean> findusId = null;
		
		if(usertest != null) {
			
		Integer userId = usertest.getUserId();
		
		findusId = commentService.findCommentByUseridAndStoreid(userId, storeid);
		
		}
		
		ArrayList<Object> arrayList = new ArrayList<>();
		
		Optional<StoreBean> newstore = storeService.findById(storeid);
		
		if(newstore.isPresent()) {
			arrayList.add(newstore.get());
		}
		
		model.addAttribute("commentBean", commentBean);
		model.addAttribute("arrayList", arrayList);
		
		model.addAttribute("findusId", findusId);
		model.addAttribute("page",page);
		
		return "/front/frontcommentview";
		
	}
	
	
	
	
//	@GetMapping("comment/editComment")
//	public String editComment(@RequestParam("commentid") Integer id,Model model) {
//		
//		CommentBean comment = commentService.findById(id);
//		
//		model.addAttribute("comment", comment);
//		
//		return "/front/backcommentedit";
//	}
	
	
	
//	@PostMapping("comment/editComment")
//	public String postEditComment(@RequestPart("commentPhoto1") MultipartFile cPhoto,@RequestParam("commentid") Integer id) throws Exception {
//		
//		
//		CommentBean comment = commentService.findById(id);
//		
//		if(!cPhoto.isEmpty()) {
//			String temp=new String(Base64.getEncoder().encode(cPhoto.getBytes()));
//			String profile="data:image/png;base64,"+temp;
//			
//			comment.setCommentPhoto(profile);
//		}
//		
//		
//		commentService.insertComment(comment);
//		
//		return "redirect:/front/comment/all";	
//	}
	
	
	@PostMapping("comment/editComment")
	@ResponseBody
	public CommentBeanDTO editComment(@RequestBody CommentBeanDTO dto) {   //, @RequestParam("usercommentid") Integer usercommentid
		
		
		
		Integer commentid = dto.getCommentId();
		
		CommentBean comment = new CommentBean();
		
		comment.setCommentId(commentid);
		
		Integer newId = comment.getCommentId();
		
		CommentBean findById = commentService.findById(newId);
		
		Integer uid = findById.getUserBean().getUserId();
		Integer sid = findById.getStoreBean().getStoreId();
		Integer st = findById.getScoreType();
		Double score = findById.getScore();
		Date createTime = findById.getCreateTime();
		String content = findById.getContent();
		String commentPhoto = findById.getCommentPhoto();
		
		
		score.toString();
		
		dto.setCommentId(commentid);
		dto.setUserId(uid);
		dto.setStoreId(sid);
		dto.setScoreType(st);
		dto.setScore(score.toString());
		dto.setCreateTime(createTime);
		dto.setContent(content);
		dto.setCommentPhoto(commentPhoto);
		
		
		return dto;
	}
	
	
	
	
	@PostMapping("comment/editNewComment")
	public String postEditComment(@RequestPart("commentPhoto1") MultipartFile cPhoto,
			@RequestParam("newcommentid") Integer id,
			@RequestParam("score1") Double score,
			@RequestParam("commentcontent") String content,
			@RequestParam("commentstoreid") Integer storeid)throws Exception {
		
		
		CommentBean comment = commentService.findById(id);
		
		if(!cPhoto.isEmpty()) {
			String temp=new String(Base64.getEncoder().encode(cPhoto.getBytes()));
			String profile="data:image/png;base64,"+temp;
			
			comment.setCommentPhoto(profile);
		}
		comment.setScore(score);
		comment.setContent(content);
		
		commentService.insertComment(comment);
		
		String url = "redirect:http://localhost:8081/drinkmaster/front/comment/all?storeid=" + storeid;
		
		return url;	
	}
	
	@GetMapping("comment/delete")
	public String deletemsg(@RequestParam(name="commentid") Integer id,
							@RequestParam("storeid") Integer storeid) {
		commentService.deleteById(id);
		
		String url = "redirect:http://localhost:8081/drinkmaster/front/comment/all?storeid=" + storeid;
		
		return url;
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
//	@ResponseBody
//	public List<CommentBean> findCommentByStoreid(@RequestParam("storeId")Integer storeId, Model model){
//		
//		List<CommentBean> CBS = commentService.findCommentByStoreid(storeId);
//		
////		model.addAttribute("CBS", CBS);
//		
//		return CBS ;
//	}
	
	

}
