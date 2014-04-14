package com.pms_scm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeecg.demo.entity.test.JeecgDemo;
import jeecg.system.service.SystemService;

import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pms_scm.entity.Product;
import com.pms_scm.service.ProductServiceI;

@Controller
@RequestMapping("/productController")
public class ProductController {

	private ProductServiceI productService;
	private SystemService systemService;
	private String message = null;

	@Autowired
	public void setProductService(ProductServiceI productService) {
		this.productService = productService;
	}

	@Autowired
	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}

	@RequestMapping(params = "product")
	public String product() {
		return "/pms_scm/product/productList";
	}

	@RequestMapping(params = "dataGrid")
	public void dataGrid(Product product, HttpServletRequest request,
			HttpServletResponse response, DataGrid dataGrid) {
		productService.dataGrid(product, request, response, dataGrid);
	}

	@RequestMapping(params = "addOrUpdate")
	public String addOrUpdate(Product product, HttpServletRequest request) {
		if (StringUtil.isNotEmpty(product.getId())){
			product = systemService.getEntity(Product.class, product.getId());
			request.setAttribute("p", product);
		}
		return "/pms_scm/product/product";
	}

	@RequestMapping(params = "saveProduct")
	@ResponseBody
	public AjaxJson saveProduct(Product product, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(product.getId())){
			systemService.updateEntitie(product);
			j.setMsg("更新成功");
		}else{
			systemService.save(product);
			j.setMsg("添加成功");
		}
		return j;
	}
	
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson delProduct(Product product, HttpServletRequest request){
		AjaxJson j = new AjaxJson();
		if (product.getId() != null) {
			message = product.getName() + "被删除 成功";
			systemService.deleteEntityById(Product.class, product.getId());
			systemService.addLog(message, Globals.Log_Type_DEL,
					Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 产品列表
	 */
	@RequestMapping(params = "combox")
	@ResponseBody
	public List<Product> combox(HttpServletRequest request, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(Product.class);
		List<Product> ls = this.productService.getListByCriteriaQuery(cq, false);
		return ls;
	}
		
}
