package com.eeit144.drinkmaster.front.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.eeit144.drinkmaster.back.controller.UserBeanValidator;
import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.back.model.StoreService;
import com.eeit144.drinkmaster.back.model.UserService;
import com.eeit144.drinkmaster.back.util.Util;
import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.dto.UserBeanDTO;

@Controller
@Transactional
@RequestMapping("front/")
@SessionAttributes(names= {"canSeeUser","canSeeFirm","canSeeStore"})
public class FrontUserController {

	private UserService userService;
	
	@Autowired
	private FirmService firmService;

	@Autowired
	private StoreService storeService;
	
	@Autowired
	public FrontUserController(UserService userService) {
		super();
		this.userService = userService;
	}

	@GetMapping("userMessage")
	public String userserch() {
		return "/front/frontuser";
	}
	
	
//	@GetMapping("logout")
//	public String logout(WebRequest request, SessionStatus status) {
//		status.setComplete();
//		request.removeAttribute("canSeeUser", WebRequest.SCOPE_SESSION);
//		request.removeAttribute("canSeeFirm", WebRequest.SCOPE_SESSION);
//		request.removeAttribute("canSeeStore", WebRequest.SCOPE_SESSION);
//		return "/front/frontlogin";
//	}
	
	@GetMapping("login")
	public String login(Model m) {
		UserBeanDTO user = new UserBeanDTO();
		String userAccount = user.getUserAccount();
		String userPassword = user.getUserPassword();
		
		m.addAttribute("userAccount", userAccount);
		m.addAttribute("userPassword", userPassword);

		return "/front/frontlogin";
	}
	
	@PostMapping("loginGo")
	public String loginGo(Model m, @RequestParam("userAccount") String userAccount, 
			@RequestParam("userPassword") String userPassword) {
		
		UserBean user = new UserBean();
			
		//將密碼加密才能跟資料庫比對
		String encryptPwd = Util.saleCode(userPassword);
		
		System.out.println("PostMapping:" + userAccount + "  " + userPassword);

		try {
			user = userService.findByAccPwd(userAccount, encryptPwd);
		} catch (Exception e) {
			m.addAttribute("errorloginstr", "帳號或密碼錯誤!");
			return "redirect:/backend/login";
		}

//		user = userService.findByAccPwd(userAccount, userPassword);
		if(user != null) {
			m.addAttribute("canSeeUser",user);
		} else {
			return "/front/login";
		}
		return "redirect:/front/";
	}
	

	
	@GetMapping("userUpdate/{id}")
	public String updateById(@PathVariable("id") Integer id, Model m) {
		
		UserBean findById = userService.findById(id).get();
		UserBeanDTO userDTO = new UserBeanDTO();
		
		userDTO.setUserId(id);
		userDTO.setUserName(findById.getUserName());
		userDTO.setUserAccount(findById.getUserAccount());
		//將資料庫密碼解密回傳view
		userDTO.setUserPassword(Util.DeSaleCode(findById.getUserPassword()));
		userDTO.setUserAddress(findById.getUserAddress());
		userDTO.setPhone(findById.getPhone());
		userDTO.setGender(findById.getGender());
		userDTO.setBirthday(findById.getBirthday());
		userDTO.setCreatedate(findById.getCreatedate());
		userDTO.setRole(findById.getRole());
		userDTO.setPhoto(findById.getPhoto());
		
		m.addAttribute("user",userDTO);
		
		return "/front/frontuserupdate";
	}
	
	@PostMapping("userUpdate/{id}")
	public String updateUser(@ModelAttribute("user") UserBean user, BindingResult result
			, @RequestPart("reallogo") MultipartFile photo,	Model m) {

		// 以下為用UserBeanValidator後端識別欄位錯誤格式
		UserBeanValidator validator = new UserBeanValidator();
		validator.validate(user, result);
		if(result.hasErrors()) {
			return "/front/frontuserupdate";
		}
		
		// 以下為新增動作
		String contentType = photo.getContentType();
		System.out.println("限定上傳格式用：" + contentType);
		
		try {
			user.setPhoto(photo.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
			UserBeanDTO userDTO = new UserBeanDTO();
			m.addAttribute("user", userDTO);
			return "/front/frontuserupdate";
		}
		//未新增照片的話將舊資料加入新資料中
		if (photo.getSize() == 0) {
			UserBean oldUser = userService.findById(user.getUserId()).get();
			user.setPhoto(oldUser.getPhoto());
		}
		//未選新生日的話將舊資料加入新資料中
		Date bd = user.getBirthday();
		String bds = bd.toString();
		if (bds.equals("null")) {
			UserBean oldUser = userService.findById(user.getUserId()).get();
			user.setBirthday(oldUser.getBirthday());
		}
		
		//密碼加密
		String pwd= user.getUserPassword();
		
		String encryptPwd = Util.saleCode(pwd);
		System.out.println(encryptPwd);
		
		user.setUserPassword(encryptPwd);
		
		//回傳view & DB資料
		m.addAttribute("canSeeUser",user);
		userService.insertUser(user);
		
		return "/front/frontuser";
	}

	@GetMapping("register")
	public String insertUser(Model m) {
		UserBeanDTO user = new UserBeanDTO();
		m.addAttribute("user", user);
		return "/front/frontregister";
	}

	@PostMapping("register")
	// 前端會提供UserBean user 跟 MultipartFile photo這兩個物件
	public String insertUserGo(@ModelAttribute("user") UserBean user, BindingResult result,
			@RequestParam("reallogo") MultipartFile photo,Model m) {

		System.out.println("user account：" + user.getUserAccount());
		//確認是否已有帳號
		if(!userService.findUserByAccount(user.getUserAccount())) {
			System.out.println("成功進入帳號除錯");
			m.addAttribute("accErr", "帳號已有人使用");
			return "/front/frontregister";
		};
		System.out.println("準備進入後端識別格式");
		// 以下為用UserBeanValidator後端識別欄位錯誤格式
		UserBeanValidator validator = new UserBeanValidator();
		validator.validate(user, result);
		if(result.hasErrors()) {
			return "/front/frontregister";
		}
		System.out.println("完成後端識別格式");
		// 以下為新增動作
		String contentType = photo.getContentType();
		System.out.println(contentType);
		// 把當下的時間加入user內
		Date createDate = new Date();
		user.setCreatedate(createDate);
		if(user.getBirthday() == null) {
			user.setBirthday(createDate);
		}
		System.out.println("完成塞入日期");
		try {
			user.setPhoto(photo.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
			UserBeanDTO userDTO = new UserBeanDTO();
			m.addAttribute("user", userDTO);
			return "/front/frontregister";
		}
		System.out.println("完成圖片塞入user");
		
		// 密碼加密
		
		String pwd= user.getUserPassword();
		
		String encryptPwd = Util.saleCode(pwd);
		System.out.println(encryptPwd);
		
		user.setUserPassword(encryptPwd);
		
		//存入資料庫
		userService.insertUser(user);
		System.out.println("完成新增");
		return "redirect:/front/login";
	}
	
}
