package com.eeit144.drinkmaster.back.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.back.model.SaleCodeService;
import com.eeit144.drinkmaster.back.util.Util;
import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.SaleCodeBean;
import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.dto.SaleCodeDTO;
import com.eeit144.drinkmaster.dto.SaleCodeExcel;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;

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
	public String allSaleCodePage() {
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

			List<FirmBean> firmOne = new ArrayList();
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
		for(int i = 0; i < count; i++) {
			salecode  =  Util.DeSaleCode(insertSaleCodeToDB.get(i).getSaleCode());
			insertSaleCodeToDB.get(i).setSaleCode(salecode);
		}
		
		m.addAttribute("salecodes", insertSaleCodeToDB);
		return "/backend/backsalecode";
	}

//	@GetMapping("valied")
//	public CheckSaleCodeValied(String saleCode) {
//		
//	}

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

	@GetMapping("xlsx")
	public ResponseEntity<byte[]> OutputExcel(@SessionAttribute("salecodes") List<SaleCodeBean> salecodes,
			SessionStatus status) throws IOException {

		// 讓orderBeanxslx可以重複利用
		SaleCodeExcel saleCodeExcel = null;

		List<SaleCodeExcel> list = new ArrayList<SaleCodeExcel>();

		// 將找到list的所有資料放到list2裡面
		for (SaleCodeBean salecode : salecodes) {
			saleCodeExcel = new SaleCodeExcel();
			saleCodeExcel.setSaleCode(salecode.getSaleCode());
			saleCodeExcel.setDiscount(salecode.getDiscount());
			saleCodeExcel.setValidDate(salecode.getValidDate());
			list.add(saleCodeExcel);
		}

		ExportParams exportParams = new ExportParams();
		exportParams.setSheetName("訂單列表");

		Workbook workbook = ExcelExportUtil.exportExcel(exportParams, SaleCodeExcel.class, list);

		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		try {
			workbook.write(bos);
		} finally {
			bos.close();
		}
		byte[] bytes = bos.toByteArray();

		HttpHeaders headers = new HttpHeaders();
		headers.add("content-disposition", "attachment;fileName=" + URLEncoder.encode("折扣碼清單.xls", "UTF-8"));

		status.setComplete();

		return new ResponseEntity<byte[]>(bytes, headers, HttpStatus.OK);
	}

}
