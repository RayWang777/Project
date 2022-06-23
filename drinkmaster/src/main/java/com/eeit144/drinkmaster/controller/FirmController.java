package com.eeit144.drinkmaster.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.FirmColumn;
import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.dto.FirmDTO;
import com.eeit144.drinkmaster.model.FirmService;
import com.eeit144.drinkmaster.model.UserService;

@Controller
@RequestMapping("backend/")
public class FirmController {

	private FirmService firmService;
	
	private UserService userService;

	@Autowired
	public FirmController(FirmService firmService, UserService userService) {
		super();
		this.firmService = firmService;
		this.userService = userService;
	}

	@GetMapping("firm/{id}")
	public ResponseEntity<FirmDTO> findFirmById(@PathVariable Integer id) {
		Optional<FirmBean> firmBean = firmService.findById(id);

		if (firmBean.isEmpty()) {
			return new ResponseEntity<FirmDTO>(HttpStatus.NO_CONTENT);
		}
		FirmDTO firmDTO = new FirmDTO();
		firmDTO.setFirmId(firmBean.get().getFirmId());
		firmDTO.setFirmName(firmBean.get().getFirmName());
		firmDTO.setFirmAddress(firmBean.get().getFirmAddress());
		firmDTO.setFirmPhone(firmBean.get().getFirmPhone());
		firmDTO.setUserId(firmBean.get().getUserBean().getUserId());
		return new ResponseEntity<FirmDTO>(firmDTO, HttpStatus.OK);
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
	public String findAllPages(@RequestParam(name = "p", defaultValue = "1") Integer page,
			@RequestParam(name = "s", defaultValue = "5") Integer size,
			@RequestParam(name = "d", defaultValue = "true") boolean direct, Model m) {
	



		Pageable pab = null;
		if (direct) {
			pab = PageRequest.of(page - 1, size, Sort.Direction.ASC,"firmId");
		} else {
			pab = PageRequest.of(page - 1, size, Sort.Direction.DESC,"firmId");
		}

//		Page<FirmBean> allFirm = firmService.findAll(pab);
		
		
		
		
		
		UserBean userBean = new UserBean();
//		userBean.setUserName("0");
		FirmBean firmBean = new FirmBean();
//		firmBean.setFirmName("");		
//		firmBean.setFirmPhone("");	
//		firmBean.setFirmAddress("");
//		firmBean.setUserBean(userBean);
		ExampleMatcher matcher = ExampleMatcher.matchingAll().withMatcher("firmName",ExampleMatcher.GenericPropertyMatchers.contains())
				.withMatcher("firmPhone", ExampleMatcher.GenericPropertyMatchers.contains())
				.withMatcher("firmAddress", ExampleMatcher.GenericPropertyMatchers.contains())
				.withMatcher("userBean.userName", ExampleMatcher.GenericPropertyMatchers.contains());
		
		Example<FirmBean> example = Example.of(firmBean,matcher);
		
		Page<FirmBean> allFirm = firmService.findAll2(example,pab);
		
		allFirm.getContent();
		allFirm.getTotalPages();
		allFirm.getNumber();
//		Page<FirmBean> allFirm = firmService.findAllByFirmNameOrFirmPhone("0", "3", pab);
		

		for (FirmBean firm : allFirm) {
			firm.setFirmLogo(null);
		}

		m.addAttribute("firms", allFirm);

		return "backfirm";
	};

	@GetMapping("/firm/add")
	public String firmAddPage(Model m) {
		FirmDTO firmDTO = new FirmDTO();
		List<UserBean> users = userService.findAllUsers();
		
		m.addAttribute("firmaddusers", users);
		m.addAttribute("firm", firmDTO);
		return "backfirmadd";
	}

	@PostMapping("firm/add")
	public String addNewFirm(@ModelAttribute("firm") FirmDTO firm, @RequestPart("reallogo") MultipartFile logo,
			Model m) {

		String contentType = logo.getContentType();

		if (!contentType.startsWith("image")) {

			Map<String, String> errors = new HashMap<String, String>();
			errors.put("firmLogo", "檔案必須為圖片");

			FirmDTO firmDTO = new FirmDTO();

			m.addAttribute("errors", errors);
			m.addAttribute("firm", firmDTO);
			return "backfirmadd";
		}

		FirmBean newFirm = new FirmBean();
		UserBean userBean = new UserBean();
		userBean.setUserId(firm.getUserId());
		newFirm.setFirmId(firm.getFirmId());
		newFirm.setUserBean(userBean);
		newFirm.setFirmName(firm.getFirmName());
		newFirm.setFirmAddress(firm.getFirmAddress());
		newFirm.setFirmPhone(firm.getFirmPhone());
		try {
			newFirm.setFirmLogo(logo.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
			FirmDTO firmDTO = new FirmDTO();
			m.addAttribute("firm", firmDTO);
			return "backfirmadd";
		}
		firmService.insertFirm(newFirm);
		return "redirect:/backend/firm/all";
	}

	@GetMapping("firm/edit/{id}")
	public String firmUpdatePage(@PathVariable("id") Integer id, Model m) {
		FirmBean findById = firmService.findById(id).get();
		FirmDTO firmDTO = firmService.change(findById);
		m.addAttribute("firm", firmDTO);
		return "backfirmupdate";
	}

	@PostMapping("firm/edit/{id}")
	public String updateFirm(@ModelAttribute("firm") FirmDTO firm, @RequestPart("reallogo") MultipartFile logo,
			Model m) {

		FirmBean oldFirm = firmService.findById(firm.getFirmId()).get();
		String contentType = logo.getContentType();
		oldFirm.setFirmName(firm.getFirmName());
		oldFirm.setFirmAddress(firm.getFirmAddress());
		oldFirm.setFirmPhone(firm.getFirmPhone());

		if (logo.getSize() == 0) {
			firmService.insertFirm(oldFirm);
			return "redirect:/backend/firm/all";
		}

		if (!contentType.startsWith("image")) {

			Map<String, String> errors = new HashMap<String, String>();
			errors.put("firmLogo", "檔案必須為圖片");
			m.addAttribute("firm", oldFirm);
			m.addAttribute("errors", errors);
			return "backfirmupdate";
		}
		try {
			oldFirm.setFirmLogo(logo.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
			m.addAttribute("firm", oldFirm);
			return "backfirmupdate";
		}
		firmService.insertFirm(oldFirm);
		return "redirect:/backend/firm/all";
	}

	@GetMapping("firm/delete/{id}")
	public String deleteFirm(@PathVariable("id") Integer id) {
		firmService.deleteById(id);
		return "redirect:/backend/firm/all";
	}

}
