package com.pms_scm.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeecg.system.service.SystemService;

import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pms_scm.entities.Pomain;
import com.pms_scm.entities.Teacher;
import com.pms_scm.service.PomainServiceI;

@Service("pomainService")
@Transactional
public class PomainServiceImpl extends CommonServiceImpl implements PomainServiceI{

	private SystemService systemService;
	
	@Autowired
	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}

	@Override
	public void dataGrid(Pomain pomain, HttpServletRequest reqeust,
			HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(Pomain.class, dataGrid);
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, pomain);
		this.systemService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
}
