package com.eeit144.drinkmaster.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.StoreBean;

import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.dto.FirmDTO;
import com.eeit144.drinkmaster.dto.UserBeanDTO;
import com.eeit144.drinkmaster.model.FirmService;
import com.eeit144.drinkmaster.model.StoreService;
import com.eeit144.drinkmaster.model.UserService;


@Controller
@Transactional
@RequestMapping("backend/")
@SessionAttributes(names= {"userBean","canSeeFirm","canSeeStore"})
public class UserController {

	private UserService userService;
	
	@Autowired
	private FirmService firmService;
	
	@Autowired
	private StoreService storeService;
	
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
		if(user != null) {
			m.addAttribute(user);
		} else {
			return "redirect:/backend/login";
		}

		m.addAttribute("userBean",user);
		
		String role = user.getRole();
		if(role.equals("admin")) {
			
			
			List<StoreBean> findAllList = storeService.findAllList();
			m.addAttribute("canSeeStore", findAllList);
			
			return("redirect:/backend/");
			
		} else if(role.equals("firm")) {
			
			List<FirmBean> firmByUserId = firmService.findFirmByUserId(user.getUserId());
			FirmBean firmBean = null;
			
			try {
			firmBean = firmByUserId.get(0);
			}catch (Exception e) {
				m.addAttribute("errorloginstr", "請聯絡平台獲取權限");
				return "backlogin";
			}
			
			m.addAttribute("canSeeFirm", firmBean);
				
			List<StoreBean> findStoreByFirmId = storeService.findStoreByFirmId(firmBean.getFirmId());
			m.addAttribute("canSeeStore", findStoreByFirmId);
			
			return("redirect:/backend/");
		} else if(role.equals("store")) {
			
			Optional<StoreBean> StoreByUserId = storeService.findStoreByUserId(user.getUserId());
			if(StoreByUserId.isEmpty()) {
				m.addAttribute("errorloginstr", "請聯絡平台廠商獲取權限");
				return "backlogin";
			}
			StoreBean storeBean = StoreByUserId.get();
			
			m.addAttribute("canSeeStore", storeBean);
			
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

	@PostMapping("user/insert")
	// 前端會提供UserBean user 跟 MultipartFile photo這兩個物件
	public String insertUserGo(@ModelAttribute("user") UserBean user, BindingResult result,
			@RequestParam("reallogo") MultipartFile photo,Model m) {

		// 以下為用UserBeanValidator識別欄位錯誤格式
		UserBeanValidator validator = new UserBeanValidator();
		validator.validate(user, result);
		if(result.hasErrors()) {
			return "backuseradd";
		}
		
		// 以下為新增動作
		String contentType = photo.getContentType();
		System.out.println(contentType);
		
//		if(!contentType.startsWith("image")) {
//			
//			Map<String, String> errors = new HashMap<String, String>();
//			errors.put("userPhoto", "檔案必須為圖片");
//			
//			UserBeanDTO userDTO = new UserBeanDTO();
//						
//			m.addAttribute("errors", errors);
//			m.addAttribute("user", userDTO);
//			return "backuseradd";
//		}
		// 把當下的時間加入user內
		Date createDate = new Date();
		user.setCreatedate(createDate);
		
		try {
			user.setPhoto(photo.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
			UserBeanDTO userDTO = new UserBeanDTO();
			m.addAttribute("user", userDTO);
			return "backuseradd";
		}
		
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
	
	@GetMapping("user/delete/{id}")
	public String deleteById(@PathVariable("id") Integer id) {
		userService.deleteById(id);
		return "redirect:/backend/user/all";
	}
	
	@GetMapping("user/update/{id}")
	public String updateById(@PathVariable("id") Integer id, Model m) {
		UserBean findById = userService.findById(id).get();
		UserBeanDTO userDTO = new UserBeanDTO();
		
		userDTO.setUserId(id);
		userDTO.setUserName(findById.getUserName());
		userDTO.setUserAccount(findById.getUserAccount());
		userDTO.setUserPassword(findById.getUserPassword());
		userDTO.setUserAddress(findById.getUserAddress());
		userDTO.setPhone(findById.getPhone());
		userDTO.setGender(findById.getGender());
		userDTO.setBirthday(findById.getBirthday());
		userDTO.setCreatedate(findById.getCreatedate());
		userDTO.setRole(findById.getRole());
		userDTO.setPhoto(findById.getPhoto());
		
		m.addAttribute("user",userDTO);
		m.addAttribute("usersave","修改用戶資料");
		
		return "backuserupdate";
	}
	
	@PostMapping("user/update/{id}")
	public String updateUser(@ModelAttribute("user") UserBeanDTO user, @RequestPart("reallogo") MultipartFile logo,
			Model m) {

		UserBean oldUser = userService.findById(user.getUserId()).get();
		String contentType = logo.getContentType();
		oldUser.setUserName(user.getUserName());
		oldUser.setUserAccount(user.getUserAccount());
		oldUser.setUserPassword(user.getUserPassword());
		oldUser.setUserAddress(user.getUserAddress());
		oldUser.setPhone(user.getPhone());
		oldUser.setGender(user.getGender());
		oldUser.setCreatedate(user.getCreatedate());
		oldUser.setRole(user.getRole());

		if (logo.getSize() == 0 || user.getBirthday().equals(null)) {
			userService.insertUser(oldUser);
			return "redirect:/backend/user/all";
		}

		if (!contentType.startsWith("image")) {

			Map<String, String> errors = new HashMap<String, String>();
			errors.put("firmLogo", "檔案必須為圖片");
			m.addAttribute("user", oldUser);
			m.addAttribute("errors", errors);
			return "backuserupdate";
		}
		try {
			oldUser.setPhoto(logo.getBytes());
			oldUser.setBirthday(user.getBirthday());
		} catch (IOException e) {
			e.printStackTrace();
			m.addAttribute("user", oldUser);
			return "backuserupdate";
		}
		userService.insertUser(oldUser);
		return "redirect:/backend/user/all";
	}
	
	
	
	@GetMapping("user/{id}")
	public ResponseEntity<UserBeanDTO> findUserById(@PathVariable Integer id) {
		Optional<UserBean> userBean = userService.findById(id);

		if (userBean.isEmpty()) {
			return new ResponseEntity<UserBeanDTO>(HttpStatus.NO_CONTENT);
		}
		UserBeanDTO userDTO = new UserBeanDTO();
		userDTO.setUserId(userBean.get().getUserId());
		userDTO.setUserName(userBean.get().getUserName());
		userDTO.setUserAccount(userBean.get().getUserAccount());
		userDTO.setUserPassword(userBean.get().getUserAccount());
		userDTO.setBirthday(userBean.get().getBirthday());
		userDTO.setCreatedate(userBean.get().getCreatedate());
		userDTO.setGender(userBean.get().getGender());
		userDTO.setPhone(userBean.get().getPhone());
		userDTO.setRole(userBean.get().getRole());
		userDTO.setUserAddress(userBean.get().getUserAddress());

		return new ResponseEntity<UserBeanDTO>(userDTO, HttpStatus.OK);
	}
	
	@GetMapping("user/{id}/photo")
	public ResponseEntity<byte[]> getUserPhoto(@PathVariable("id") Integer id) {
		Optional<UserBean> userBean = userService.findById(id);

		byte[] userPhoto = userBean.get().getPhoto();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(userPhoto, headers, HttpStatus.OK);
	}
	
}
