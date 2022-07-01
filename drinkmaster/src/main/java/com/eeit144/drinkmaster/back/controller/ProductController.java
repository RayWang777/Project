package com.eeit144.drinkmaster.back.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.back.model.OrderItemsService;
import com.eeit144.drinkmaster.back.service.FirmServiceImp;
import com.eeit144.drinkmaster.back.service.OrderItemsServiceImp;
import com.eeit144.drinkmaster.back.service.ProductCategoryServiceImp;
import com.eeit144.drinkmaster.back.service.ProductServiceImp;
import com.eeit144.drinkmaster.back.service.StoreServiceImp;
import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.OrderItems;
import com.eeit144.drinkmaster.bean.ProductBean;
import com.eeit144.drinkmaster.bean.ProductCategoryBean;
import com.eeit144.drinkmaster.bean.ProductMaterial;
import com.eeit144.drinkmaster.bean.StoreBean;
import com.eeit144.drinkmaster.bean.UserBean;

@Controller
@Transactional
@RequestMapping("/backend")
@SessionAttributes(names = { "userBean", "canSeeStore" })
public class ProductController {
	@Autowired
	private ProductServiceImp proService;
	@Autowired
	ProductCategoryServiceImp categoryService;
	@Autowired
	private StoreServiceImp storeService;
	@Autowired
	private FirmServiceImp firmService;
	
	@Autowired
	private OrderItemsServiceImp itemsService;

	@GetMapping("product/insertview")
	public String addView(Model m, @SessionAttribute("canSeeStore") StoreBean storeBean) {
		ProductBean pro = new ProductBean();
		m.addAttribute("now", "新增商品");
		m.addAttribute("status", "確定新增");
		List<ProductCategoryBean> productcategory1 = categoryService.findByStoreBean(storeBean);
		m.addAttribute("productcategory1", productcategory1);
		m.addAttribute("product", pro);
		m.addAttribute("insert", "product/insert");
		return "/backend/backproductinsert";
	}

	@GetMapping("productanalyze")
	public String analyzeview(@SessionAttribute("canSeeStore") StoreBean storeBean,Model m) {
		
		List<ProductMaterial> sales = sales(storeBean);
		m.addAttribute("store",storeBean);
		m.addAttribute("list", sales);
		return "/backend/productanalyze";
	}
	
	@GetMapping ("material")
	@ResponseBody
	public  List<ProductMaterial> sales(@SessionAttribute("canSeeStore") StoreBean storeBean){
		List<ProductMaterial> list =new ArrayList<ProductMaterial>();
		 List<ProductBean> product= proService.findByproduuctCategoryBean_storeBean(storeBean);
		for(ProductBean pro: product ) {
			ProductMaterial material =new ProductMaterial();
			material.setProductName(pro.getProductName());
		List<OrderItems> items= itemsService.findByproductBean(pro);
		int sum=0;
		for(OrderItems items2:items) {
			sum+=items2.getQuantity();
		}
		material.setSales(sum);
		list.add(material);
		}
		
		return list;
	}

	@PostMapping("/product/insert")
	public String insertProduct(@RequestParam String productName, @RequestParam String price,
			@RequestParam String coldHot, @RequestParam Boolean status, @RequestParam Integer select,
			@RequestPart("productImage") MultipartFile productImage,
			@SessionAttribute("canSeeStore") StoreBean storeBean, Model m) throws IOException {
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		if (productName == null || productName.length() == 0) {
			errors.put("name", "請輸入品項");
		}
		if (price == null || price.length() == 0) {
			errors.put("price1", "請輸入正確金額");
		}
		if (price.length() != 0 && Integer.parseInt(price) < 0) {
			errors.put("price1", "請輸入正確金額");
		}

		if (errors != null && !errors.isEmpty()) {
			ProductBean pro = new ProductBean();
			m.addAttribute("now", "新增商品");
			m.addAttribute("product", pro);
			m.addAttribute("insert", "product/insert");
			m.addAttribute("status", "確定新增");
			List<ProductCategoryBean> productcategory1 = categoryService.findByStoreBean(storeBean);
			m.addAttribute("productcategory1", productcategory1);
			return "/backend/backproductinsert";
		}
		ProductCategoryBean cateB = categoryService.findById(select);
		System.out.println(select);
		ProductBean pro = new ProductBean();
		String filetype = productImage.getContentType();
		pro.setPrice(Integer.parseInt(price));
		pro.setColdHot(coldHot);
		pro.setStatus(status);
		pro.setProductName(productName);
		pro.setProductCategoryBean(cateB);

		String filebase64 = proService.getFileBase64String(productImage);
		String productimage = "data:" + filetype + ";base64," + filebase64 + "";
		System.out.println(productimage + "<--");
		if (productimage.equals("data:application/octet-stream;base64,")) {
			pro.setProductImage(null);
		} else {
			pro.setProductImage(productimage);
		}

		proService.insertProduct(pro);

		return "redirect:/backend/product/all";
	}

	@GetMapping("product/all")
	public ModelAndView findView(ModelAndView mav, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
			@SessionAttribute("userBean") UserBean userBean) {
		mav.getModel().put("past", "1");
		if (userBean.getRole().equals("admin")) {
			Page<ProductBean> page = proService.findByPage(pageNumber);
			mav.getModel().put("page", page);
		} else if (userBean.getRole().equals("store")) {
			Optional<StoreBean> StoreByUserId = storeService.findStoreByUserId(userBean.getUserId());
			StoreBean store = StoreByUserId.get();
			Page<ProductBean> page = proService.findByPage2(pageNumber, store.getStoreId());
			mav.getModel().put("page", page);
		} else if (userBean.getRole().equals("firm")) {
			List<FirmBean> firmByUserId = firmService.findFirmByUserId(userBean.getUserId());
			FirmBean firm = firmByUserId.get(0);
			Page<ProductBean> page = proService.findByPage3(pageNumber, firm.getFirmId());
			mav.getModel().put("page", page);
		}
		mav.setViewName("/backend/backproduct");
		return mav;
	}

	@GetMapping("product/select")
	public ModelAndView selectLike(ModelAndView mav, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
			@RequestParam("select") String select, @RequestParam("filed") String filed,
			@SessionAttribute("userBean") UserBean userBean) {
		mav.getModel().put("past", "2");
		mav.getModel().put("select", select);
		mav.getModel().put("filed",filed);
		if (userBean.getRole().equals("admin")) {
			if (filed.equals("上架中") || filed.equals("已下架")) {
				Page<ProductBean> page = proService.select(pageNumber, filed, filed);
				mav.getModel().put("page", page);
			} else {
				Page<ProductBean> page = proService.select(pageNumber, select, filed);
				mav.getModel().put("page", page);
			}
		} else if (userBean.getRole().equals("store")) {
			Optional<StoreBean> StoreByUserId = storeService.findStoreByUserId(userBean.getUserId());
			StoreBean store = StoreByUserId.get();
			if (filed.equals("上架中") || filed.equals("已下架")) {
				Page<ProductBean> page = proService.select2(pageNumber, filed, filed, store.getStoreId());
				mav.getModel().put("page", page);
			} else {
				Page<ProductBean> page = proService.select2(pageNumber, select, filed, store.getStoreId());
				mav.getModel().put("page", page);
			}
		} else if (userBean.getRole().equals("firm")) {
			List<FirmBean> firmByUserId = firmService.findFirmByUserId(userBean.getUserId());
			FirmBean firm = firmByUserId.get(0);
			if (filed.equals("上架中") || filed.equals("已下架")) {
				Page<ProductBean> page = proService.select3(pageNumber, filed, filed, firm.getFirmId());
				mav.getModel().put("page", page);
			} else {
				Page<ProductBean> page = proService.select3(pageNumber, select, filed, firm.getFirmId());
				mav.getModel().put("page", page);
			}
		}

		mav.setViewName("/backend/backproduct");
		return mav;

	}

	@GetMapping("deleteproduct")
	public String deleteById(@RequestParam("id") Integer id) {

		proService.deleteById(id);
		return "redirect:/backend/product/all";

	}

	@GetMapping("editproduct")
	public String updateById(@RequestParam("id") Integer id, Model m,
			@SessionAttribute("canSeeStore") StoreBean storeBean) {
		ProductBean proBean = proService.findById(id);
		List<ProductCategoryBean> productcategory1 = categoryService.findByStoreBean(storeBean);
		m.addAttribute("now", "編輯商品");
		m.addAttribute("status", "確定修改");
		m.addAttribute("productcategory1", productcategory1);
		m.addAttribute("product", proBean);
		m.addAttribute("insert", "updateproduct");
		return "/backend/backproductinsert";
	}

	@PostMapping("updateproduct")
	public String postUpdate(@RequestParam Integer productId, @RequestParam Integer select,
			@RequestParam String productName, @RequestParam String price, @RequestParam String coldHot,
			@RequestParam Boolean status, @RequestPart("productImage") MultipartFile productImage,
			@SessionAttribute("canSeeStore") StoreBean storeBean, Model m) throws IOException {

		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		if (productName == null || productName.length() == 0) {
			errors.put("name", "請輸入品項");
		}
		if (price == null || price.length() == 0) {
			errors.put("price1", "請輸入正確金額");
		}
		if (price.length() != 0 && Integer.parseInt(price) < 0) {
			errors.put("price1", "請輸入正確金額");
		}

		if (errors != null && !errors.isEmpty()) {
			ProductBean oldBean = proService.findById(productId);
			List<ProductCategoryBean> productcategory1 = categoryService.findByStoreBean(storeBean);
			m.addAttribute("now", "編輯商品");
			m.addAttribute("status", "確定修改");
			m.addAttribute("productcategory1", productcategory1);
			m.addAttribute("product", oldBean);
			m.addAttribute("insert", "updateproduct");
			return "/backend/backproductinsert";
		}
		ProductCategoryBean cateB = categoryService.findById(select);
		System.out.println(select);
		ProductBean pro = new ProductBean();
		ProductBean oldBean = proService.findById(productId);
		pro.setProductId(productId);
		pro.setPrice(Integer.parseInt(price));
		pro.setColdHot(coldHot);
		pro.setStatus(status);
		pro.setProductName(productName);

		pro.setProductCategoryBean(cateB);

		String filetype = productImage.getContentType();

		String filebase64 = proService.getFileBase64String(productImage);
		String productimage = "data:" + filetype + ";base64," + filebase64 + "";
		if (productimage.equals("data:application/octet-stream;base64,")) {
			pro.setProductImage(oldBean.getProductImage());
		} else {
			pro.setProductImage(productimage);
		}
		proService.insertProduct(pro);

		return "redirect:/backend/product/all";
	}

}
