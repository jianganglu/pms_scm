package com.pms_scm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.pms_scm.service.PayServiceI;

@Controller
@RequestMapping("/payController")
public class PayController {

	@Autowired
	private PayServiceI payService;
	
	public void setPayService(PayServiceI payService) {
		this.payService = payService;
	}

	@RequestMapping(params = "pay")
	public String pay(){
		return "/pms_scm/pay/payList";
	}
	
	@RequestMapping(params = "dataGrid")
	public void dataGrid(Pomain pomain,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		payService.getDataGrid(pomain, request, response, dataGrid);
	}
	
	@RequestMapping(params = "payOut")
	@ResponseBody
	public AjaxJson stockIn(Pomain pomain) {
		AjaxJson j = new AjaxJson();
		HttpSession session = ContextHolderUtils.getSession();
	    SessionInfo sessioninfo = ( SessionInfo ) session.getAttribute( Globals.USER_SESSION );
		if (StringUtil.isNotEmpty(pomain.getId())){
			Pomain p = payService.get(Pomain.class, pomain.getId());
			if ("预付款到发货".equals(p.getPayType()) && "新建".equals(p.getStatus())){
				p.setStatus("已预付");
				j.setMsg("预付款登记成功！");
			}else{
				p.setStatus("已付款");
				j.setMsg("付款登记成功！");
			}
			p.setPayUser(sessioninfo.getUser().getRealName());
			p.setPayTime(DataUtils.date2Str(DataUtils.yyyyMMdd));
			payService.saveOrUpdate(p);
			j.setMsg("付款登记成功！");
		}
		return j;
	}
}
