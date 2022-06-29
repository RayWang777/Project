package com.eeit144.drinkmaster.back.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.eeit144.drinkmaster.back.model.FirmBannerService;
import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.back.model.UserService;
import com.eeit144.drinkmaster.bean.FirmBanner;
import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.FirmColumn;
import com.eeit144.drinkmaster.bean.FirmSerch;
import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.dto.FirmDTO;

@Controller
@RequestMapping("backend/")
public class FirmController {

	private FirmService firmService;

	private UserService userService;

	private FirmBannerService firmBannerService;
	
	@Autowired
	public FirmController(FirmService firmService, UserService userService,FirmBannerService firmBannerService) {
		super();
		this.firmService = firmService;
		this.userService = userService;
		this.firmBannerService = firmBannerService;
	}

	@GetMapping("firm/{id}")
	public String findFirmById(@PathVariable Integer id,@SessionAttribute("userBean") UserBean user,Model m) {
		Optional<FirmBean> firmBean = firmService.findById(id);

		if (firmBean.isEmpty()) {
			return "redirect:/backend/firm/all";
		}
		
		if(!(user.getRole().equals("admin"))) {
			return "redirect:/backend/";			
		}

		FirmBean findById = firmService.findById(id).get();
		FirmDTO firmDTO = firmService.change(findById);

		List<UserBean> users = userService.findAllUsers();

		m.addAttribute("firmaddusers", users);
		m.addAttribute("firm", firmDTO);
		return "/backend/backfirmview";
	}

	@GetMapping("firm/{id}/photo")
	public ResponseEntity<byte[]> getFirmLogo(@PathVariable("id") Integer id) {
		Optional<FirmBean> firmBean = firmService.findById(id);

		byte[] firmLogo = firmBean.get().getFirmLogo();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(firmLogo, headers, HttpStatus.OK);
	}

	@GetMapping("firm/all")
	public String findAllPages(@ModelAttribute("firmSerch") FirmSerch firmSerch,@SessionAttribute("userBean") UserBean user, Model m) {
		
		if(!(user.getRole().equals("admin"))) {
			return "redirect:/backend/";			
		}
		
		String serchFirmName = firmSerch.getSfn();
		String serchFirmPhone = firmSerch.getSfp();
		String serchFirmAddress = firmSerch.getSfa();
		String serchUserName = firmSerch.getSun();
		Integer page = firmSerch.getP();
		Integer size = firmSerch.getS();
		Integer column = firmSerch.getC();
		boolean direct = firmSerch.isD();

		Pageable pab = null;
		if (direct) {
			pab = PageRequest.of(page - 1, size, Sort.Direction.ASC, FirmColumn.getColumne(column));
		} else {
			pab = PageRequest.of(page - 1, size, Sort.Direction.DESC, FirmColumn.getColumne(column));
		}


		UserBean userBean = new UserBean();
		userBean.setUserName(serchUserName);
		FirmBean firmBean = new FirmBean();
		firmBean.setFirmName(serchFirmName);
		firmBean.setFirmPhone(serchFirmPhone);
		firmBean.setFirmAddress(serchFirmAddress);
		firmBean.setUserBean(userBean);
		ExampleMatcher matcher = ExampleMatcher.matchingAll()
				.withMatcher("firmName", ExampleMatcher.GenericPropertyMatchers.contains())
				.withMatcher("firmPhone", ExampleMatcher.GenericPropertyMatchers.contains())
				.withMatcher("firmAddress", ExampleMatcher.GenericPropertyMatchers.contains())
				.withMatcher("userBean.userName", ExampleMatcher.GenericPropertyMatchers.contains());

		Example<FirmBean> example = Example.of(firmBean, matcher);
		

		Page<FirmBean> allFirm = firmService.findAll2(example, pab);

//		Page<FirmBean> allFirm = firmService.findAllByFirmNameOrFirmPhone("0", "3", pab);

		for (FirmBean firm : allFirm) {
			firm.setFirmLogo(null);
		}

		
		FirmSerch firmSerch2 = new FirmSerch();
		m.addAttribute("serchFirm", firmSerch);
		m.addAttribute("firmSerch", firmSerch2);
		m.addAttribute("firms", allFirm);

		return "/backend/backfirm";
	};

	@GetMapping("/firm/add")
	public String firmAddPage(@SessionAttribute("userBean") UserBean user,Model m) {
		
		if(!(user.getRole().equals("admin"))) {
			return "redirect:/backend/";			
		}

		
		List<Integer> findUserNullFirmBean = firmService.findUserNullFirmBean();
	
		if(findUserNullFirmBean.isEmpty()) {
			
			return "redirect:/backend/firm/all";
		}
		
		FirmDTO firmDTO = new FirmDTO();
		List<UserBean> users = userService.findNullFirmUsers(findUserNullFirmBean);
		
	

		m.addAttribute("firmaddusers", users);
		m.addAttribute("firm", firmDTO);
		return "/backend/backfirmadd";
	}

	@PostMapping("firm/add")
	public String addNewFirm(@SessionAttribute("userBean") UserBean user,@ModelAttribute("firm") FirmDTO firm,BindingResult result, @RequestPart("reallogo") MultipartFile logo,
			Model m) {
		
		if(!(user.getRole().equals("admin"))) {
			return "redirect:/backend/";			
		}
		
		List<Integer> findUserNullFirmBean = firmService.findUserNullFirmBean();
		List<UserBean> users = userService.findNullFirmUsers(findUserNullFirmBean);
		m.addAttribute("firmaddusers", users);
		
		FirmDtoValidator firmDtoValidator = new FirmDtoValidator();
		firmDtoValidator.validate(firm, result);
		if(result.hasErrors()) {
	
			return "/backend/backfirmadd";
		}

		FirmBean newFirm = new FirmBean();

		newFirm.setFirmId(firm.getFirmId());
		newFirm.setFirmName(firm.getFirmName());
		newFirm.setFirmAddress(firm.getFirmAddress());
		newFirm.setFirmPhone(firm.getFirmPhone());

		String contentType = logo.getContentType();

		if (!contentType.startsWith("image")) {

			Map<String, String> errors = new HashMap<String, String>();
			errors.put("firmLogo", "檔案必須為圖片");

			m.addAttribute("errors", errors);
			m.addAttribute("firm", newFirm);
			return "/backend/backfirmadd";
		}
		UserBean userBean = new UserBean();
		userBean.setUserId(firm.getUserId());
		newFirm.setUserBean(userBean);

		try {
			newFirm.setFirmLogo(logo.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
			FirmDTO firmDTO = new FirmDTO();
			m.addAttribute("firm", firmDTO);
			return "/backend/backfirmadd";
		}
		firmService.insertFirm(newFirm);
		return "redirect:/backend/firm/all";
	}

	@GetMapping("firm/edit/{id}")
	public String firmUpdatePage(@PathVariable("id") Integer id,@SessionAttribute("userBean") UserBean user, Model m) {
		FirmBean findById = firmService.findById(id).get();
		FirmDTO firmDTO = firmService.change(findById);

		if((!(user.getRole().equals("admin"))) && (!(user.getRole().equals("firm")))) {
			return "redirect:/backend/";			
		}
		List<UserBean> users = userService.findAllUsers();

		m.addAttribute("firmaddusers", users);

		Integer originUserId = firmService.findById(id).get().getUserBean().getUserId();
		
		m.addAttribute("originUserId", originUserId);
		
		if(user.getRole().equals("firm")) {

			List<UserBean> list = new ArrayList<UserBean>();
			list.add(user);
			m.addAttribute("firmaddusers", list);		
		};
		
		m.addAttribute("firm", firmDTO);
		return "/backend/backfirmupdate";
	}

	@PostMapping("firm/edit/{id}")
	public String updateFirm(@ModelAttribute("firm") FirmDTO firm,@SessionAttribute("userBean") UserBean user, @RequestPart("reallogo") MultipartFile logo,
			Model m) {
		
		if((!(user.getRole().equals("admin"))) && (!(user.getRole().equals("firm")))) {
			return "redirect:/backend/";			
		}
		

		FirmBean oldFirm = firmService.findById(firm.getFirmId()).get();
		String contentType = logo.getContentType();
		oldFirm.setFirmName(firm.getFirmName());
		oldFirm.setFirmAddress(firm.getFirmAddress());
		oldFirm.setFirmPhone(firm.getFirmPhone());
		oldFirm.setUserBean(firm.getUserBean());
	

		if (logo.getSize() == 0) {
			firmService.insertFirm(oldFirm);
			return "redirect:/backend/firm/all";
		}

		if (!contentType.startsWith("image")) {

			Map<String, String> errors = new HashMap<String, String>();
			errors.put("firmLogo", "檔案必須為圖片");
			m.addAttribute("firm", oldFirm);
			m.addAttribute("errors", errors);
			return "/backend/backfirmupdate";
		}
		try {
			oldFirm.setFirmLogo(logo.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
			m.addAttribute("firm", oldFirm);
			return "/backend/backfirmupdate";
		}
		firmService.insertFirm(oldFirm);
		return "redirect:/backend/firm/all";
	}

	@GetMapping("firm/delete/{id}")
	public String deleteFirm(@PathVariable("id") Integer id,@SessionAttribute("userBean") UserBean user) {
		
		if(!(user.getRole().equals("admin"))) {
			return "redirect:/backend/";			
		}
		
		firmService.deleteById(id);
		return "redirect:/backend/firm/all";
	}
	
	@GetMapping("firm/minus")
	public void DeleteFirms(Integer[] ids){}
	
	@GetMapping("firm/banner/all")
	public String AllFirmBanner(@RequestParam(name="p",defaultValue = "1") Integer page,Model m) {
		
		List<FirmBanner> findByFirmIdNull = firmBannerService.findAllList();
		System.out.println(findByFirmIdNull);
		if(findByFirmIdNull.isEmpty()) {

			PageRequest firmBannerPage = PageRequest.of(page-1, 2, Sort.Direction.ASC, "id");		
			Page<FirmBanner> findAll = firmBannerService.findAll(firmBannerPage);		
			m.addAttribute("firmBanners", findAll);
			return "/backend/backfirmBanner";
		
		}
		
		
		List<Integer> list = new ArrayList<Integer>();
		Integer firmId = null;
		for(FirmBanner one: findByFirmIdNull) {
			firmId = one.getFirmBean().getFirmId();
			list.add(firmId);
		}
		List<FirmBean> findByIdNotIn = firmService.findByIdNotIn(list);
		if(findByIdNotIn.isEmpty()) {
			m.addAttribute("error", "沒有新廠商需要新增Banner");
		}
			
		PageRequest firmBannerPage = PageRequest.of(page-1, 2, Sort.Direction.ASC, "id");		
		Page<FirmBanner> findAll = firmBannerService.findAll(firmBannerPage);		
		m.addAttribute("firmBanners", findAll);
		return "/backend/backfirmBanner";
	}
	
	
	@GetMapping("firm/banner/{id}")
	public ResponseEntity<byte[]> getFirmBanner(@PathVariable("id") Integer id) {
		Optional<FirmBanner> findByfirmId = firmBannerService.findByfirmId(id);
		
		if(findByfirmId.isEmpty()) {
			return new ResponseEntity<byte[]>(HttpStatus.OK);
		}

		byte[] firmLogo = findByfirmId.get().getFirmPiic();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(firmLogo, headers, HttpStatus.OK);
	}
	
	@GetMapping("firm/banner/add")
	public String addFirmBanner(Model m) {
		
		List<FirmBanner> findByFirmIdNull = firmBannerService.findAllList();
		FirmBanner newFirmBanner = new FirmBanner();
		m.addAttribute("newBanner", newFirmBanner);

		if(findByFirmIdNull.isEmpty()) {
			List<FirmBean> findAll3 = firmService.findAll3();
			m.addAttribute("firms", findAll3);
			return "/backend/backfirmbanneradd";
		}

		List<Integer> list = new ArrayList<Integer>();
		Integer firmId = null;
		for(FirmBanner one: findByFirmIdNull) {
			firmId = one.getFirmBean().getFirmId();
			list.add(firmId);
		}
		List<FirmBean> findByIdNotIn = firmService.findByIdNotIn(list);
			if(findByIdNotIn.isEmpty()) {
			return "redirect:/backend/firm/banner/all";
		}
		m.addAttribute("firms", findByIdNotIn);
		return "/backend/backfirmbanneradd";
	}
	

	@PostMapping("firm/banner/add")
	public String addNewFirmBanner(@ModelAttribute("newBanner") FirmBanner newBanner, @RequestPart("reallogo") MultipartFile logo,
			Model m) {
		
		
		List<FirmBean> list = firmService.findAll3();
		m.addAttribute("firms", list);
		FirmBanner newFirmBanner = new FirmBanner();
		
		FirmBean findById = firmService.findById(newBanner.getFirmId()).get();
		newFirmBanner.setFirmBean(findById);

		String contentType = logo.getContentType();

		if (!contentType.startsWith("image")) {

			Map<String, String> errors = new HashMap<String, String>();
			errors.put("firmLogo", "檔案必須為圖片");

			m.addAttribute("errors", errors);
			m.addAttribute("newBanner", newFirmBanner);
			return "/backend/backfirmbanneradd";
		}
		try {
			newFirmBanner.setFirmPiic(logo.getBytes());
		} catch (IOException e) {
			e.printStackTrace();

			m.addAttribute("firm", newFirmBanner);
			return "/backend/backfirmbanneradd";
		}
		firmBannerService.insertBanner(newFirmBanner);
		return "redirect:/backend/firm/banner/all";
	}

	
	
	
	@GetMapping("firm/banner/edit/{id}")
	public String firmBannerUpdatePage(@PathVariable("id") Integer id,Model m) {
		

		List<FirmBean> list = firmService.findAll3();

		FirmBanner oldBanner = firmBannerService.findById(id).get();
		
		
		m.addAttribute("firms", list);
		m.addAttribute("oldBanner", oldBanner);

		return "/backend/backfirmbannerupdate";
	}

	@PostMapping("firm/banner/edit/{id}")
	public String updateFirmBanner(@PathVariable("id") Integer id,@ModelAttribute("oldBanner") FirmBanner oldBanner, @RequestPart("reallogo") MultipartFile logo,
			Model m) {

		FirmBanner oldFirmBanner = firmBannerService.findById(id).get();
	
		String contentType = logo.getContentType();
		
		if (logo.getSize() == 0) {
			firmBannerService.insertBanner(oldFirmBanner);
			return "redirect:/backend/firm/banner/all";
		}

		if (!contentType.startsWith("image")) {
			Map<String, String> errors = new HashMap<String, String>();
			errors.put("firmLogo", "檔案必須為圖片");
			m.addAttribute("firm", oldFirmBanner);
			m.addAttribute("errors", errors);
			return "/backend/backfirmbannerupdate";
		}
		try {
			oldFirmBanner.setFirmPiic(logo.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
			m.addAttribute("firm", oldFirmBanner);
			return "/backend/backfirmbannerupdate";
		}
		firmBannerService.insertBanner(oldFirmBanner);
		return "redirect:/backend/firm/banner/all";
	}

	
	@GetMapping("firm/banner/delete/{id}")
	public String deleteFirmBanner(@PathVariable("id") Integer id,@SessionAttribute("userBean") UserBean user) {
		
		if(!(user.getRole().equals("admin"))) {
			return "redirect:/backend/";			
		}
		FirmBanner firmBanner = firmBannerService.findById(id).get();
			
		firmBannerService.deleteById(firmBanner.getId());
		return "redirect:/backend/firm/banner/all";
	}
	
	

}
