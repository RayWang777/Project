package com.eeit144.drinkmaster.back.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.imageio.ImageIO;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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


	@GetMapping("logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "/backend/backlogin";
	}
	
	@GetMapping("login")
	public String login(Model m) {
		UserBeanDTO user = new UserBeanDTO();
		String userAccount = user.getUserAccount();
		String userPassword = user.getUserPassword();
		
		m.addAttribute("userAccount", userAccount);
		m.addAttribute("userPassword", userPassword);

		return "/backend/backlogin";
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
		
		System.out.println("UserBean的password = " + user.getUserPassword());


		String role = user.getRole();
		m.addAttribute("userBean", user);
		
		//System.out.println("嗨嗨!!" + role);

		if(role.equals("admin")) {

			return("redirect:/backend/");
			
		} 
		
		if(role.equals("firm")) {
			List<FirmBean> firmByUserId = firmService.findFirmByUserId(user.getUserId());
			FirmBean firmBean = null;
			
			try {
			firmBean = firmByUserId.get(0);
			}catch (Exception e) {
				m.addAttribute("errorloginstr", "請聯絡平台獲取權限");
				return "backlogin";
			}
			
			m.addAttribute("canSeeFirm", firmBean);
			
			return("redirect:/backend/");
		} 
		 if(role.equals("store")) {
			
			Optional<StoreBean> StoreByUserId = storeService.findStoreByUserId(user.getUserId());
			if(StoreByUserId.isEmpty()) {
				m.addAttribute("errorloginstr", "請聯絡平台廠商獲取權限");
				return "backlogin";
			}
			StoreBean storeBean = StoreByUserId.get();
			
			m.addAttribute("canSeeStore", storeBean);
			
			return("redirect:/backend/");
		} 
		System.out.println("程式跑到這邊惹");
		m.addAttribute("errorloginstr", "請聯絡平台廠商獲取權限");
		return "redirect:/backend/login";
		
	}
	
	
	@GetMapping("user/insert")
	public String insertUser(Model m) {
		UserBeanDTO user = new UserBeanDTO();
		m.addAttribute("user", user);
		return "/backend/backuseradd";
	}

	@PostMapping("user/insert")
	// 前端會提供UserBean user 跟 MultipartFile photo這兩個物件
	public String insertUserGo(@ModelAttribute("user") UserBean user, BindingResult result,
			@RequestParam("reallogo") MultipartFile photo,Model m) {

		System.out.println("成功進入insert postmapping");
		System.out.println("user account：" + user.getUserAccount());
		//確認是否已有帳號
		if(!userService.findUserByAccount(user.getUserAccount())) {
			System.out.println("成功進入帳號除錯");
			m.addAttribute("accErr", "帳號已有人使用");
			return "/backend/backuseradd";
		};
		System.out.println("準備進入後端識別格式");
		// 以下為用UserBeanValidator後端識別欄位錯誤格式
		UserBeanValidator validator = new UserBeanValidator();
		validator.validate(user, result);
		if(result.hasErrors()) {
			return "/backend/backuseradd";
		}
		System.out.println("完成後端識別格式");
		// 新增預設圖片動作
		String contentType = photo.getContentType();
		System.out.println(contentType);
//		
//		if(user.getPhoto() == null && user.getGender().equals("男")) {
//			System.out.println("抓到你是男生搂~");
//			
//			String url = "C:/Drink/drinkmaster/src/main/webapp/images/male.png";
//			
//			try {
//				BufferedImage bImage = ImageIO.read(new File(url));
//			    ByteArrayOutputStream bos = new ByteArrayOutputStream();
//			    ImageIO.write(bImage,"png",bos);
//			    byte [] photoByte = bos.toByteArray();
//			    user.setPhoto(photoByte);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			
//		} else if(user.getPhoto() == null && user.getGender().equals("女")) {
//			System.out.println("抓到你是女生搂~");
//			File file = new File("female.png");
//			byte[] photoByte;
//			try {
//				photoByte = Files.readAllBytes(file.toPath());
//				user.setPhoto(photoByte);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//		
//		System.out.println("完成圖片塞入user");
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
			return "/backend/backuseradd";
		}
		
		
		// 密碼加密
		
		String pwd= user.getUserPassword();
		
		String encryptPwd = Util.saleCode(pwd);
		System.out.println(encryptPwd);
		
		user.setUserPassword(encryptPwd);
		
		//存入資料庫
		userService.insertUser(user);
		System.out.println("完成新增");
		return "redirect:/backend/user/all";
	}

	
	@GetMapping("user/all")
	public ModelAndView findView(ModelAndView mav, @RequestParam(name="u", defaultValue = "1") Integer pageNumber) {
		Page<UserBean> page = userService.findAll(pageNumber);
		
		mav.getModel().put("page", page);
		mav.setViewName("/backend/backuser");
		return mav;
	}
	
	@GetMapping("user/select")
	public ModelAndView selectLike(ModelAndView mav, @RequestParam(name="u", defaultValue = "1") Integer pageNumber,
			@RequestParam("select") String select) {
		System.out.println(select);
		
		Page<UserBean> page = userService.select(pageNumber, "%" + select + "%");
		mav.getModel().put("page", page);
		
		mav.setViewName("/backend/backuser");
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
		
		return "/backend/backuserupdate";
	}
	
	@PostMapping("user/update/{id}")
	public String updateUser(@ModelAttribute("user") UserBean user, BindingResult result
			, @RequestPart("reallogo") MultipartFile photo,	Model m) {

		// 以下為用UserBeanValidator後端識別欄位錯誤格式
		UserBeanValidator validator = new UserBeanValidator();
		validator.validate(user, result);
		if(result.hasErrors()) {
			return "/backend/backuserupdate";
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
			return "/backend/backuserupdate";
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
		//存入資料庫
		userService.insertUser(user);
		
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
	
	// 加解密測試
	@GetMapping("test")
	public void test(){
		
		String saleCode = Util.saleCode("jerry6666");
		System.out.println(saleCode);
		String saleCode2 = Util.saleCode("mark1234");
		System.out.println(saleCode2);
		String saleCode3 = Util.saleCode("mary4317");
		System.out.println(saleCode3);
		String saleCode4 = Util.saleCode("cindy9527");
		System.out.println(saleCode4);
		String saleCode5 = Util.saleCode("tom7777");
		System.out.println(saleCode5);
		String saleCode6 = Util.saleCode("123");
		System.out.println(saleCode6);
		
		String deSaleCode = Util.DeSaleCode(saleCode);
		System.out.println(deSaleCode);
	}
	
}
