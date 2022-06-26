package com.eeit144.drinkmaster.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.dto.StoreDTO;
import com.eeit144.drinkmaster.model.FirmService;
import com.eeit144.drinkmaster.model.StoreService;
import com.eeit144.drinkmaster.model.UserService;

@Controller
@RequestMapping("backend/")
public class StoreController {

	private StoreService storeService;
	
	private FirmService firmService;
	
	private UserService userService;

	@Autowired
	public StoreController(StoreService storeService,UserService userService,FirmService firmService) {
		super();
		this.storeService = storeService;
		this.userService = userService;
		this.firmService = firmService;
	}

	@GetMapping("store/{id}")
	public ResponseEntity<StoreDTO> findstoreById(@PathVariable Integer id) {
		Optional<StoreBean> storeBean = storeService.findById(id);

		if (storeBean.isEmpty()) {
			return new ResponseEntity<StoreDTO>(HttpStatus.NO_CONTENT);
		}
		StoreDTO storeDTO = new StoreDTO();
		storeDTO.setStoreId(storeBean.get().getStoreId());
		storeDTO.setFirmId(storeBean.get().getFirmId());
		storeDTO.setStoreName(storeBean.get().getStoreName());
		storeDTO.setStoreAddress(storeBean.get().getStoreAddress());
		storeDTO.setStorePhone(storeBean.get().getStorePhone());
		storeDTO.setOpenTime(storeBean.get().getOpenTime());
		storeDTO.setLatitude(storeBean.get().getLatitude());
		storeDTO.setLongitude(storeBean.get().getLongitude());

		return new ResponseEntity<StoreDTO>(storeDTO, HttpStatus.OK);
	}

	@GetMapping("store/all")
	public String findAllPages(@RequestParam(name = "p", defaultValue = "1") Integer page,@SessionAttribute("userBean") UserBean user,Model m) {

		String role = user.getRole();
		if( !(role.equals("admin"))&& !(role.equals("firm")) ) {
			return "redirect:/backend/";
		}

		Pageable pab = PageRequest.of(page - 1, 5, Sort.Direction.ASC, "storeId");

		if(role.equals("admin")) {
			Page<StoreBean> allStore = storeService.findAll(pab);
			m.addAttribute("stores", allStore);
			return "backstore";
		}
		Integer userFirmId = firmService.findFirmByUserId(user.getUserId()).get(0).getFirmId();
		Page<StoreBean> storeByFirmId = storeService.findStoreByFirmId(userFirmId, pab);
		m.addAttribute("stores", storeByFirmId);
		return "backstore";
	};
	
	
	
	@GetMapping("/store/add")
	public String storeAddPage(@SessionAttribute("userBean") UserBean user,Model m) {
		
		String role = user.getRole();
		if( !(role.equals("admin"))&& !(role.equals("firm")) ) {
			return "redirect:/backend/";
		}
		
		StoreDTO store = new StoreDTO();
		if(role.equals("admin")) {
			
			List<FirmBean> findAll3 = firmService.findAll3();
			List<UserBean> users = userService.findAllUsers();

			m.addAttribute("storeaddfirms", findAll3);
			m.addAttribute("storeaddusers", users);
			m.addAttribute("store", store);
			return "backstoreadd";
		}
		
		FirmBean findFirmByUserId = firmService.findFirmByUserId(user.getUserId()).get(0);
		List<UserBean> users = userService.findAllUsers();
		
		m.addAttribute("storeaddfirms", findFirmByUserId);
		m.addAttribute("storeaddusers", users);		
		m.addAttribute("store", store);
		return "backstoreadd";
	}

	@PostMapping("store/add")
	public String addNewStore(@ModelAttribute("store") StoreDTO store,@SessionAttribute("userBean") UserBean user, Model m) {
	
		String role = user.getRole();
		if( !(role.equals("admin"))&& !(role.equals("firm")) ) {
			return "redirect:/backend/";
		}
		
		StoreBean newStore = new StoreBean();

	
		FirmBean firmBean = new FirmBean();
		firmBean.setFirmId(store.getFirmId());
		UserBean oldUser = userService.findById(store.getUserId()).get();
		
		newStore.setFirmBean(firmBean);
		newStore.setStoreId(store.getStoreId());
		newStore.setStoreName(store.getStoreName());
		newStore.setStoreAddress(store.getStoreAddress());
		newStore.setStorePhone(store.getStorePhone());
		newStore.setOpenTime(store.getOpenTime());
		newStore.setLatitude(store.getLatitude());
		newStore.setLongitude(store.getLongitude());
		newStore.setUserBean(oldUser);

		storeService.insertStore(newStore);
		return "redirect:/backend/store/all";
	}

	@GetMapping("store/edit/{id}")
	public String storeAddPage(@PathVariable("id") Integer id, Model m) {
		StoreBean findById = storeService.findById(id).get();
		StoreDTO storeDTO = new StoreDTO();

		storeDTO.setFirmId(findById.getFirmId());
		storeDTO.setStoreId(findById.getStoreId());
		storeDTO.setStoreName(findById.getStoreName());
		storeDTO.setStoreAddress(findById.getStoreAddress());
		storeDTO.setStorePhone(findById.getStorePhone());
		storeDTO.setOpenTime(findById.getOpenTime());
		storeDTO.setLatitude(findById.getLatitude());
		storeDTO.setLongitude(findById.getLongitude());

		m.addAttribute("store", storeDTO);
		m.addAttribute("save", "修改店家");
		return "backstoreadd";
	}
	
	@GetMapping("store/delete/{id}")
	public String deleteStore(@PathVariable("id") Integer id) {
		storeService.deleteById(id);
		return "redirect:/backend/store/all";
	}

}
