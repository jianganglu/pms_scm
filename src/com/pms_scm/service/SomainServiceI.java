package com.pms_scm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.common.service.CommonService;

import com.pms_scm.entity.Pomain;
import com.pms_scm.entity.Somain;

public interface SomainServiceI extends CommonService{

	public void dataGrid(Somain somain, HttpServletRequest reqeust, HttpServletResponse response, DataGrid datagrid);
	
	public void getDataGridEnd(Somain somain, HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid);
}
