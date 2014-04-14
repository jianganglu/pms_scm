package com.pms_scm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jeecg.system.service.SystemService;

import org.apache.log4j.Logger;
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
import com.pms_scm.entity.Product;
import com.pms_scm.service.PomainServiceI;

@Controller
@RequestMapping("/pomainController")
public class PomainController {

	@SuppressWarnings("unused")
	private static final Logger log = Logger.getLogger(PomainController.class);

	private PomainServiceI pomainService;
	private SystemService systemService;
	private String message = null;

	@Autowired
	public void setPomainService(PomainServiceI pomainService) {
		this.pomainService = pomainService;
	}

	@Autowired
	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}

	@RequestMapping(params = "pomain")
	public String pomain() {
		return "pms_scm/pomain/pomainList";
	}

	@RequestMapping(params = "toEnd")
	public String toEnd(){
		return "pms_scm/pomain/pomainEndList";
	}
	
	@RequestMapping(params = "dataGrid")
	public void dataGrid(Pomain pomain, HttpServletRequest reqeust,
			HttpServletResponse response, DataGrid datagrid) {
		pomainService.dataGrid(pomain, reqeust, response, datagrid);
	}

	@RequestMapping(params = "addPomain")
	public String addPomain(Pomain pomain, HttpServletRequest request) {
		Pomain p = (Pomain) request.getAttribute("pomain");
		HttpSession session = ContextHolderUtils.getSession();
	    SessionInfo sessioninfo = ( SessionInfo ) session.getAttribute( Globals.USER_SESSION );
		request.setAttribute("realName", sessioninfo.getUser().getRealName());
		List<Product> products = systemService.getList(Product.class);
		request.setAttribute("products", products);
	    return "pms_scm/pomain/pomain";
	}
	
	@RequestMapping(params = "editPomain")
	public String editPomain(Pomain pomain, HttpServletRequest request) {
		if (StringUtil.isNotEmpty(pomain.getId())) {
			pomain = systemService.getEntity(Pomain.class, pomain.getId());
			request.setAttribute("p", pomain);
		}
		HttpSession session = ContextHolderUtils.getSession();
	    SessionInfo sessioninfo = ( SessionInfo ) session.getAttribute( Globals.USER_SESSION );
		request.setAttribute("realName", sessioninfo.getUser().getRealName());
		List<Product> products = systemService.getList(Product.class);
		request.setAttribute("products", products);
	    return "pms_scm/pomain/pomain";
	}

	@RequestMapping(params = "savePomain")
	@ResponseBody
	public AjaxJson savePomain(HttpServletRequest request, Pomain pomain) {
		AjaxJson j = new AjaxJson();
		if (!StringUtil.isEmpty(pomain.getId())) {
			systemService.updateEntitie(pomain);
			j.setMsg("更新成功");
		} else {
			pomain.setPomainId(DataUtils.date2Str(DataUtils.yyyymmddhhmmss));
			systemService.save(pomain);
			j.setMsg("添加成功");
		}

		return j;
	}
	
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(Pomain pomain, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (pomain.getId() != null) {
			message = "删除 成功";
			systemService.deleteEntityById(Pomain.class, pomain.getId());
			systemService.addLog(message, Globals.Log_Type_DEL,
					Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}
	
	@RequestMapping(params = "dataGridEnd")
	public void dataGridEnd(Pomain pomain,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		pomainService.getDataGridEnd(pomain, request, response, dataGrid);
	}
	
	@RequestMapping(params = "toEndPomain")
	@ResponseBody
	public AjaxJson stockIn(Pomain pomain) {
		AjaxJson j = new AjaxJson();
		HttpSession session = ContextHolderUtils.getSession();
	    SessionInfo sessioninfo = ( SessionInfo ) session.getAttribute( Globals.USER_SESSION );
		if (StringUtil.isNotEmpty(pomain.getId())){
			Pomain p = pomainService.get(Pomain.class, pomain.getId());
			p.setStatus("已了结");
			p.setEndUser(sessioninfo.getUser().getRealName());
			p.setEndTime(DataUtils.date2Str(DataUtils.yyyyMMdd));
			pomainService.saveOrUpdate(p);
			j.setMsg("了结成功！");
		}
		return j;
	}
}
