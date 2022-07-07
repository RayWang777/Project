package com.eeit144.drinkmaster.back.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.eeit144.drinkmaster.bean.SaleCodeBean;
import com.eeit144.drinkmaster.dto.SaleCodeExcel;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;

@Controller
@RequestMapping("backend/salecode/")
@SessionAttributes(names = { "salecodes" })
public class SaleCodeDownloadController {

	public SaleCodeDownloadController() {
		super();
	}

	@GetMapping("xlsx")
	public ResponseEntity<byte[]> OutputExcel(@SessionAttribute("salecodes") List<SaleCodeBean> salecodes,
			SessionStatus status) throws IOException {

		SaleCodeExcel saleCodeExcel = null;

		List<SaleCodeExcel> list = new ArrayList<SaleCodeExcel>();

		for (SaleCodeBean salecode : salecodes) {
			saleCodeExcel = new SaleCodeExcel();
			saleCodeExcel.setSaleCode(salecode.getSaleCode());
			saleCodeExcel.setDiscount(salecode.getDiscount());
			saleCodeExcel.setValidDate(salecode.getValidDate());
			list.add(saleCodeExcel);
		}

		ExportParams exportParams = new ExportParams();
		exportParams.setSheetName("折扣碼清單");

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
