package com.eeit144.drinkmaster.controller;

import java.io.Console;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.dto.UserBeanDTO;
import com.eeit144.drinkmaster.model.UserService;


@Controller
@Transactional
@RequestMapping("/backend")
@SessionAttributes(names= {"userBean"})
public class UserController {

	private UserService userService;
	
	@Autowired
	public UserController(UserService userService) {
		super();
		this.userService = userService;
	}
	
	@GetMapping("login")
	public String login(Model m) {
		UserBeanDTO user = new UserBeanDTO();
		String userAccount = user.getUserAccount();
		String userPassword = user.getUserPassword();
		
		m.addAttribute("userAccount", userAccount);
		m.addAttribute("userPassword", userPassword);

		return "backlogin";
	}
	
	@PostMapping("loginGo")
	public String loginGo(Model m, @RequestParam("userAccount") String userAccount, 
			@RequestParam("userPassword") String userPassword) {
		UserBean user = new UserBean();
		System.out.println("PostMapping:" + userAccount + "  " + userPassword);

		user = userService.findByAccPwd(userAccount, userPassword);
		m.addAttribute(user);
		
//		System.out.println(user.getUserId());
		
		String role = user.getRole();
		if(role.equals("admin")) {
			return("redirect:/backend/");
		} else if(role.equals("firm")) {
			return("redirect:/backend/");
		} else if(role.equals("store")) {
			return("redirect:/backend/");
		}
		return "redirect:/backend/login";
	}
	
	
	@GetMapping("user/insert")
	public String insertUser(Model m) {
		UserBeanDTO user = new UserBeanDTO();
		m.addAttribute("user", user);
		m.addAttribute("usersave", "新增用戶");
		return "backuseradd";
	}


	@PostMapping("user/insertGo")
	public String insertUserGo(@ModelAttribute("user") UserBean user, Model m) {
		userService.insertUser(user);
		return "redirect:/backend/user/all";
	}
	
	@GetMapping("user/all")
	public ModelAndView findView(ModelAndView mav, @RequestParam(name="u", defaultValue = "1") Integer pageNumber) {
		Page<UserBean> page = userService.findAll(pageNumber);
		
		mav.getModel().put("page", page);
		mav.setViewName("backuser");
		return mav;
	}
	
	@GetMapping("user/select")
	public ModelAndView selectLike(ModelAndView mav, @RequestParam(name="u", defaultValue = "1") Integer pageNumber,
			@RequestParam("select") String select) {
		System.out.println(select);
		
		Page<UserBean> page = userService.select(pageNumber, "%" + select + "%");
		mav.getModel().put("page", page);
		
		mav.setViewName("backuser");
		return mav;
	}
	
	@GetMapping("deleteuser")
	public String deleteById(@RequestParam("id") Integer id) {
		userService.deleteById(id);
		return "redirect:/backend/user/all";
	}
	
	@GetMapping("user/update")
	public String updateById(@RequestParam("id") Integer id, Model m) {
		UserBean userBean = userService.findById(id);
		m.addAttribute("user", userBean);
		return "backuserupdate";
	}
	
	@PostMapping("user/updateGo")
	public String updateGo(@ModelAttribute("user") UserBean userBean, Model m) {
		userService.insertUser(userBean);
		
		return "redirect:/backend/user/all";
	}
}
