package com.eeit144.drinkmaster.back.controller;

import java.lang.annotation.Repeatable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.jaxb.SpringDataJaxb.PageRequestDto;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.back.model.SaleCodeService;
import com.eeit144.drinkmaster.back.util.Util;
import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.SaleCodeBean;
import com.eeit144.drinkmaster.bean.SaleCodeVO;
import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.dto.SaleCodeDTO;

@Controller
@RequestMapping("backend/salecode/")
@SessionAttributes(names = { "salecodes", "userBean" })
public class SaleCodeController {

	private SaleCodeService saleCodeService;

	private FirmService firmService;

	@Autowired
	public SaleCodeController(SaleCodeService saleCodeService, FirmService firmService) {
		super();
		this.saleCodeService = saleCodeService;
		this.firmService = firmService;
	}

	@GetMapping("all")
	public String allSaleCodePage(@RequestParam(name="p",defaultValue = "1") Integer page,Model m) {
		
		Page<SaleCodeBean> showAllSaleCode = showAllSaleCode(page);
		m.addAttribute("allValiedCode", showAllSaleCode);
		
		return "/backend/backsalecode";
	}

	@GetMapping("add")
	public String createSaleCodePage(Model m) {

		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String formatDate = formatter.format(date);
		m.addAttribute("now", formatDate);

		SaleCodeDTO newSaleCode = new SaleCodeDTO();
		m.addAttribute("newSaleCode", newSaleCode);

		UserBean user = (UserBean) m.getAttribute("userBean");

		String role = user.getRole();

		if (role.equals("admin")) {
			List<FirmBean> findAll3 = firmService.findAll3();
			m.addAttribute("firms", findAll3);
		} else {

			FirmBean firmBean = firmService.findFirmByUserId(user.getUserId()).get(0);

			List<FirmBean> firmOne = new ArrayList<FirmBean>();
			firmOne.add(firmBean);
			m.addAttribute("firms", firmOne);
		}

		return "/backend/backsalecodeadd";

	}

	@PostMapping("add")
	public String createSaleCode(@ModelAttribute("newSaleCode") SaleCodeDTO saleCode,
			@RequestParam(name = "count", defaultValue = "1") Integer count, Model m) {
		Double discount = saleCode.getDiscount() / 100.0;
		FirmBean firmBean = firmService.findById(saleCode.getFirmId()).get();
		Date validDate = saleCode.getValidDate();

		List<SaleCodeBean> list = new ArrayList<SaleCodeBean>();
		SaleCodeBean saleCodeBean = null;

		for (int i = 0; i < count; i++) {
			saleCodeBean = new SaleCodeBean();
			saleCodeBean.setDiscount(discount);
			saleCodeBean.setFirmBean(firmBean);
			saleCodeBean.setValidDate(validDate);

			String code = Util.saleCode(createSaleCode());
			saleCodeBean.setSaleCode(code);
			list.add(saleCodeBean);
		}

		m.addAttribute("createNum", count);
		List<SaleCodeBean> insertSaleCodeToDB = saleCodeService.insertSaleCodeToDB(list);

		String salecode = null;
		for (int i = 0; i < count; i++) {
			salecode = Util.DeSaleCode(insertSaleCodeToDB.get(i).getSaleCode());
			insertSaleCodeToDB.get(i).setSaleCode(salecode);
		}

		m.addAttribute("salecodes", insertSaleCodeToDB);
		return "/backend/backsalecode";
	}

	@GetMapping("valied")
	@ResponseBody
	public Double CheckSaleCodeValied(String saleCode,Model m) {
		String code = Util.saleCode(saleCode);
		Optional<SaleCodeBean> saleCodeBeanOp = saleCodeService.findBySaleCode(code);
		
		Page<SaleCodeBean> showAllSaleCode = showAllSaleCode(0);
		m.addAttribute("allValiedCode", showAllSaleCode);

		if (saleCodeBeanOp.isEmpty()) {
			return null;
		}
		SaleCodeBean saleCodeBean = saleCodeBeanOp.get();
		Date validDate = saleCodeBean.getValidDate();
		Date date = new Date(System.currentTimeMillis());
		boolean after = date.after(validDate);

		if (after) {
			return 1.0;
		}

		return saleCodeBean.getDiscount();
	}
	
	@PostMapping("check")
	public String CheckSaleCodeStatus(@RequestParam(name ="salecode") String saleCode,Model m) {
		String code = Util.saleCode(saleCode);
		Optional<SaleCodeBean> saleCodeBeanOp = saleCodeService.findBySaleCode(code);

		SaleCodeVO saleCodeVO = new SaleCodeVO();
		if (saleCodeBeanOp.isEmpty()) {
			saleCodeVO.setSaleCode("無此序號");
			saleCodeVO.setDiscount(null);
			m.addAttribute("status", saleCodeVO);
			return "/backend/backsalecode";
		}
		SaleCodeBean saleCodeBean = saleCodeBeanOp.get();
		Date validDate = saleCodeBean.getValidDate();
		Date date = new Date(System.currentTimeMillis());
		boolean after = date.after(validDate);

		if (after) {
			saleCodeVO.setSaleCode("已過期");
			saleCodeVO.setDiscount(null);
			m.addAttribute("status", saleCodeVO);
			return "/backend/backsalecode";
			}
		saleCodeVO.setSaleCode("可使用");
		saleCodeVO.setDiscount(saleCodeBeanOp.get().getDiscount());
		m.addAttribute("status", saleCodeVO);
		return "/backend/backsalecode";
	}
	
	@PostMapping("destroy")
	@ResponseBody
	public ResponseEntity<String> disableSaleCode(@RequestParam(name="s") String saleCode,Model m) {
		
		String code = Util.saleCode(saleCode);
		Optional<SaleCodeBean> saleCodeBeanOp = saleCodeService.findBySaleCode(code);

		System.out.println(saleCode);
		if (saleCodeBeanOp.isEmpty()) {

			return new ResponseEntity<String>("無此序號", HttpStatus.OK);
		}
		SaleCodeBean saleCodeBean = saleCodeBeanOp.get();
			
		Date validDate = saleCodeBean.getValidDate();
		Date date = new Date(System.currentTimeMillis());
		boolean after = date.after(validDate);

		if (after) {
			return new ResponseEntity<String>("已過期", HttpStatus.OK);
			}
		saleCodeBean.setValidDate(date);
		saleCodeService.insertSaleCode(saleCodeBean);
		return new ResponseEntity<String>("註銷成功", HttpStatus.OK);
	}
	
	@GetMapping("destroy")
	public String disableSaleCodeForm(@RequestParam(name="s") String saleCode,Model m){
		
		ResponseEntity<String> disableSaleCode = disableSaleCode(saleCode, m);
		
		return "redirect:/backend/salecode/all";
		
		
	}
	
	private Page<SaleCodeBean> showAllSaleCode(Integer page) {
		Pageable pab = PageRequest.of(page-1, 7);
		Page<SaleCodeBean> valiedCodes = saleCodeService.findAllValiedCode(pab);
		valiedCodes.forEach(valiedCode -> valiedCode.setSaleCode(Util.DeSaleCode(valiedCode.getSaleCode())));
		return valiedCodes;
	}
	

	private String createSaleCode() {
		String str = "zxcvbnmlkjhgfdsaqwertyuiopQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 12; ++i) {
			int number = random.nextInt(62);
			sb.append(str.charAt(number));
		}
		return sb.toString();
	}

}
