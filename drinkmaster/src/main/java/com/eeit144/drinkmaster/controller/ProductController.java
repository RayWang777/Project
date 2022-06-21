package com.eeit144.drinkmaster.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.service.ProductServiceImp;

@Controller
@Transactional
@RequestMapping("/backend")
public class ProductController {
	@Autowired
	private ProductServiceImp proService;

	@GetMapping("product/insertview")
	public String addView(Model m) {
		ProductBean pro = new ProductBean();
		m.addAttribute("product", pro);
		return "backproductinsert";
	}

	@PostMapping("/product/insert")
	public String insertProduct(@RequestParam String productName, @RequestParam Integer price,
			@RequestParam String coldHot, @RequestParam Boolean status, @RequestParam StoreBean storeBean,
			@RequestPart("productImage") MultipartFile productImage, Model m) throws IOException, ServletException {
		ProductBean pro = new ProductBean();
		String filetype = productImage.getContentType();
		pro.setPrice(price);
		pro.setColdHot(coldHot);
		pro.setStatus(status);
		pro.setProductName(productName);
		pro.setStoreBean(storeBean);

		String filebase64 = proService.getFileBase64String(productImage);
		String productimage = "data:" + filetype + ";base64," + filebase64 + "";
		if (productimage.equals("data:image/form-data; name=\"productImage\"; filename=\";base64,")) {
			pro.setProductImage(null);
		} else {
			pro.setProductImage(productimage);
		}

		proService.insertProduct(pro);

		return "redirect:/backend/product/all";
	}

	@GetMapping("product/all")
	public ModelAndView findView(ModelAndView mav, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		Page<ProductBean> page = proService.findByPage(pageNumber);

		mav.getModel().put("page", page);
		mav.setViewName("backproduct");
		return mav;
	}

	@GetMapping("product/select")
	public ModelAndView selectLike(ModelAndView mav, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
			@RequestParam("select") String select, @RequestParam("filed") String filed) {

		System.out.println(select);
		System.out.println(filed);
		if (filed.equals("上架中") || filed.equals("已下架")) {
			Page<ProductBean> page = proService.select(pageNumber, filed, filed);
			mav.getModel().put("page", page);
			mav.setViewName("backproduct");
			return mav;
		}
		Page<ProductBean> page = proService.select(pageNumber, select, filed);
		mav.getModel().put("page", page);
		mav.setViewName("backproduct");
		return mav;
	}

	@GetMapping("deleteproduct")
	public String deleteById(@RequestParam("id") Integer id) {

		proService.deleteById(id);
		return "redirect:/backend/product/all";

	}

	@GetMapping("editproduct")
	public String updateById(@RequestParam("id") Integer id, Model m) {
		ProductBean proBean = proService.findById(id);
		m.addAttribute("product", proBean);
		return "backproductupdate";
	}

	@PostMapping("updateproduct")
	public String postUpdate(@RequestParam Integer productId, @RequestParam String productName,
			@RequestParam Integer price, @RequestParam String coldHot, @RequestParam Boolean status,
			@RequestParam StoreBean storeBean, @RequestPart("productImage") MultipartFile productImage, Model m)
			throws IOException, ServletException {
		ProductBean pro = new ProductBean();
		ProductBean oldBean = proService.findById(productId);
		pro.setProductId(productId);
		pro.setPrice(price);
		pro.setColdHot(coldHot);
		pro.setStatus(status);
		pro.setProductName(productName);
		pro.setStoreBean(storeBean);

		String filetype = productImage.getContentType();

		String filebase64 = proService.getFileBase64String(productImage);
		String productimage = "data:" + filetype + ";base64," + filebase64 + "";
		if (productimage.equals("data:image/form-data; name=\"productImage\"; filename=\";base64,")) {
			pro.setProductImage(oldBean.getProductImage());
		} else {
			pro.setProductImage(productimage);
		}
		proService.insertProduct(pro);

		return "redirect:/backend/product/all";
	}

}
