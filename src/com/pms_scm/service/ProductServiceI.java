package com.pms_scm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.common.service.CommonService;

import com.pms_scm.entity.Product;

public interface ProductServiceI extends CommonService{

	public void dataGrid(Product product, HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid);
}
