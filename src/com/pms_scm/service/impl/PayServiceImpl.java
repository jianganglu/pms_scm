package com.pms_scm.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeecg.system.service.SystemService;

import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pms_scm.entity.Pomain;
import com.pms_scm.service.PayServiceI;

@Service("payService")
@Transactional
public class PayServiceImpl extends CommonServiceImpl implements PayServiceI{

	@Autowired
	private SystemService systemService;

	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}

	@Override
	public void getDataGrid(Pomain pomain, HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(Pomain.class, dataGrid);
		cq.add(Restrictions.sqlRestriction("({alias}.payType='货到付款' and {alias}.status='已入库') or ({alias}.payType='款到发货' and {alias}.status='新建') or ({alias}.payType='预付款到发货' and {alias}.status='已入库') or ({alias}.payType='预付款到发货' and {alias}.status='新建')"));
		systemService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
}
