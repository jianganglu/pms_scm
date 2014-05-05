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
import com.pms_scm.entity.Somain;
import com.pms_scm.service.SomainServiceI;

@Controller
@RequestMapping("/somainController")
public class SomainController {

	@SuppressWarnings("unused")
	private static final Logger log = Logger.getLogger(SomainController.class);

	private SomainServiceI somainService;
	private SystemService systemService;
	private String message = null;

	@Autowired
	public void setSomainService(SomainServiceI somainService) {
		this.somainService = somainService;
	}

	@Autowired
	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}

	@RequestMapping(params = "somain")
	public String somain() {
		return "pms_scm/somain/somainList";
	}

	@RequestMapping(params = "toEnd")
	public String toEnd(){
		return "pms_scm/somain/somainEndList";
	}
	
	@RequestMapping(params = "dataGrid")
	public void dataGrid(Somain somain, HttpServletRequest reqeust,
			HttpServletResponse response, DataGrid datagrid) {
		somainService.dataGrid(somain, reqeust, response, datagrid);
	}

	@RequestMapping(params = "addSomain")
	public String addSomain(Somain somain, HttpServletRequest request) {
		Somain s = (Somain) request.getAttribute("somain");
		HttpSession session = ContextHolderUtils.getSession();
	    SessionInfo sessioninfo = ( SessionInfo ) session.getAttribute( Globals.USER_SESSION );
		request.setAttribute("realName", sessioninfo.getUser().getRealName());
		List<Product> products = systemService.getList(Product.class);
		request.setAttribute("products", products);
	    return "pms_scm/somain/somain";
	}
	
	@RequestMapping(params = "editSomain")
	public String editSomain(Somain somain, HttpServletRequest request) {
		if (StringUtil.isNotEmpty(somain.getId())) {
			somain = systemService.getEntity(Somain.class, somain.getId());
			request.setAttribute("s", somain);
		}
		HttpSession session = ContextHolderUtils.getSession();
	    SessionInfo sessioninfo = ( SessionInfo ) session.getAttribute( Globals.USER_SESSION );
		request.setAttribute("realName", sessioninfo.getUser().getRealName());
		List<Product> products = systemService.getList(Product.class);
		request.setAttribute("products", products);
	    return "pms_scm/somain/somain";
	}

	@RequestMapping(params = "saveSomain")
	@ResponseBody
	public AjaxJson saveSomain(HttpServletRequest request, Somain somain) {
		AjaxJson j = new AjaxJson();
		if (!StringUtil.isEmpty(somain.getId())) {
			systemService.updateEntitie(somain);
			j.setMsg("更新成功");
		} else {
			somain.setSomainId(DataUtils.date2Str(DataUtils.yyyymmddhhmmss));
			systemService.save(somain);
			j.setMsg("添加成功");
		}

		return j;
	}
	
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(Somain somain, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (somain.getId() != null) {
			message = "删除 成功";
			systemService.deleteEntityById(Somain.class, somain.getId());
			systemService.addLog(message, Globals.Log_Type_DEL,
					Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}
	
	@RequestMapping(params = "dataGridEnd")
	public void dataGridEnd(Somain somain,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		somainService.getDataGridEnd(somain, request, response, dataGrid);
	}
	
	@RequestMapping(params = "toEndSomain")
	@ResponseBody
	public AjaxJson stockIn(Somain somain) {
		AjaxJson j = new AjaxJson();
		HttpSession session = ContextHolderUtils.getSession();
	    SessionInfo sessioninfo = ( SessionInfo ) session.getAttribute( Globals.USER_SESSION );
		if (StringUtil.isNotEmpty(somain.getId())){
			Somain p = somainService.get(Somain.class, somain.getId());
			p.setStatus("已了结");
			p.setEndUser(sessioninfo.getUser().getRealName());
			p.setEndTime(DataUtils.date2Str(DataUtils.yyyyMMdd));
			somainService.saveOrUpdate(p);
			j.setMsg("了结成功！");
		}
		return j;
	}
}
