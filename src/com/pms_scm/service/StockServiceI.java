package com.pms_scm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.common.service.CommonService;

import com.pms_scm.entity.Pomain;

public interface StockServiceI extends CommonService {

	public void getStockIn();

	public void getDataGrid(Pomain pomain, HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid);

}
