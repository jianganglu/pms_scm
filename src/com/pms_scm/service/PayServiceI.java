package com.pms_scm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.common.service.CommonService;

import com.pms_scm.entity.Pomain;
import com.pms_scm.entity.Somain;

public interface PayServiceI extends CommonService{
	public void getDataGrid(Pomain pomain, HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid);
	public void getDataGridSomain(Somain somain, HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid);
}
