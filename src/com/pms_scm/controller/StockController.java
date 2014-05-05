package com.pms_scm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jeecg.system.service.SystemService;

import org.jeecgframework.core.common.model.common.SessionInfo;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.DataUtils;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pms_scm.entity.Pomain;
import com.pms_scm.entity.Somain;
import com.pms_scm.service.StockServiceI;

@Controller
@RequestMapping("/stockController")
public class StockController {

	@Autowired
	private SystemService systemService;

	@Autowired
	private StockServiceI stockService;

	public void setStockService(StockServiceI stockService) {
		this.stockService = stockService;
	}

	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}

	@RequestMapping(params = "dataGrid")
	public void dataGrid(Pomain pomain,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		stockService.getDataGrid(pomain, request, response, dataGrid);
	}

	@RequestMapping(params = "dataGridSomain")
	public void dataGrid(Somain somain,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		stockService.getDataGridSomain(somain, request, response, dataGrid);
	}
	
	@RequestMapping(params = "toStockIn")
	public String toStockIn(HttpServletRequest request) {
		return "/pms_scm/stock/stockInList";
	}

	@RequestMapping(params = "stockIn")
	@ResponseBody
	public AjaxJson stockIn(Pomain pomain) {
		AjaxJson j = new AjaxJson();
		HttpSession session = ContextHolderUtils.getSession();
	    SessionInfo sessioninfo = ( SessionInfo ) session.getAttribute( Globals.USER_SESSION );
		if (StringUtil.isNotEmpty(pomain.getId())){
			Pomain p = stockService.get(Pomain.class, pomain.getId());
			p.setStatus("已入库");
			p.setStockUser(sessioninfo.getUser().getRealName());
			p.setStockTime(DataUtils.date2Str(DataUtils.yyyyMMdd));
			stockService.saveOrUpdate(p);
			j.setMsg("入库登记成功！");
		}
		return j;
	}
	
	@RequestMapping(params = "toStockOut")
	public String toStockOut(HttpServletRequest request) {
		return "/pms_scm/stock/stockOutList";
	}
	
	@RequestMapping(params = "stockOut")
	@ResponseBody
	public AjaxJson stockOut(Somain somain) {
		AjaxJson j = new AjaxJson();
		HttpSession session = ContextHolderUtils.getSession();
	    SessionInfo sessioninfo = ( SessionInfo ) session.getAttribute( Globals.USER_SESSION );
		if (StringUtil.isNotEmpty(somain.getId())){
			Somain s = stockService.get(Somain.class, somain.getId());
			s.setStatus("已出库");
			s.setStockUser(sessioninfo.getUser().getRealName());
			s.setStockTime(DataUtils.date2Str(DataUtils.yyyyMMdd));
			stockService.saveOrUpdate(s);
			j.setMsg("出库登记成功！");
		}
		return j;
	}
}
