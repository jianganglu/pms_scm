package jeecg.demo.controller.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeecg.demo.entity.test.JeecgDemo;
import jeecg.demo.service.test.JeecgDemoServiceI;
import jeecg.system.pojo.base.TSDepart;
import jeecg.system.service.SystemService;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


/**   
 * @Title: Controller
 * @Description: 单表模型（DEMO）
 * @author zhangdaihao
 * @date 2013-01-23 17:12:40
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/jeecgDemoController")
public class JeecgDemoController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(JeecgDemoController.class);

	@Autowired
	private JeecgDemoServiceI jeecgDemoService;
	@Autowired
	private SystemService systemService;
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	/**
	 * JeecgDemo例子列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "jeecgDemo")
	public ModelAndView jeecgDemo(HttpServletRequest request) {
		return new ModelAndView("jeecg/demo/jeecgDemo/jeecgDemoList");
	}

	/**
	 * easyuiAJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */

	@RequestMapping(params = "datagrid")
	public void datagrid(JeecgDemo jeecgDemo,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(JeecgDemo.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, jeecgDemo);
		String ctBegin = request.getParameter("createTime_begin");
		String ctEnd = request.getParameter("createTime_end");
		if(StringUtil.isNotEmpty(ctBegin)&& StringUtil.isNotEmpty(ctEnd)){
			try {
				cq.ge("createTime", new SimpleDateFormat("yyyy-MM-dd").parse(ctBegin));
				cq.le("createTime", new SimpleDateFormat("yyyy-MM-dd").parse(ctEnd));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			cq.add();
		}
		this.jeecgDemoService.getDataGridReturn(cq, true);
		//update-begin--Author:zhaojunfu  Date:20130520 for：TASK #109 datagrid标签没有封装合计功能
		String total_salary = String.valueOf(jeecgDemoService.findOneForJdbc("select sum(salary) as ssum from jeecg_demo").get("ssum"));
		/*
		 * 说明：格式为 字段名:值(可选，不写该值时为分页数据的合计) 多个合计 以 , 分割
		 */
		dataGrid.setFooter("salary:"+total_salary+",age,email:合计");
		//update-end--Author:zhaojunfu  Date:20130520 for：TASK #109 datagrid标签没有封装合计功能
		TagUtil.datagrid(response, dataGrid);
	}

	
	/**
	 * 权限列表
	 */
	@RequestMapping(params = "combox")
	@ResponseBody
	public List<JeecgDemo> combox(HttpServletRequest request, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(JeecgDemo.class);
		List<JeecgDemo> ls = this.jeecgDemoService.getListByCriteriaQuery(cq, false);
		return ls;
	}
	/**
	 * 删除JeecgDemo例子
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(JeecgDemo jeecgDemo, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		jeecgDemo = systemService.getEntity(JeecgDemo.class, jeecgDemo.getId());
		message = "JeecgDemo例子: " + jeecgDemo.getUserName() + "被删除 成功";
		jeecgDemoService.delete(jeecgDemo);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加JeecgDemo例子
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(JeecgDemo jeecgDemo, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(jeecgDemo.getId())) {
			message = "JeecgDemo例子: " + jeecgDemo.getUserName() + "被更新成功";
			JeecgDemo t =jeecgDemoService.get(JeecgDemo.class, jeecgDemo.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(jeecgDemo, t);
				jeecgDemoService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "JeecgDemo例子: " + jeecgDemo.getUserName() + "被添加成功";
			jeecgDemo.setStatus("0");
			jeecgDemoService.save(jeecgDemo);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}
	
	
	/**
	 * 审核报错
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "saveAuthor")
	@ResponseBody
	public AjaxJson saveAuthor(JeecgDemo jeecgDemo, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(jeecgDemo.getId())) {
			message = "用户申请成功";
			JeecgDemo t =jeecgDemoService.get(JeecgDemo.class, jeecgDemo.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(jeecgDemo, t);
				t.setStatus("1");
				jeecgDemoService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return j;
	}

	/**
	 * JeecgDemo例子列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(JeecgDemo jeecgDemo, HttpServletRequest req) {
		//获取部门信息
		List<TSDepart> departList = systemService.getList(TSDepart.class);
		req.setAttribute("departList", departList);
		
		Map sexMap = new HashMap();
		sexMap.put(0, "男");
		sexMap.put(1, "女");
		req.setAttribute("sexMap", sexMap);
		
		if (StringUtil.isNotEmpty(jeecgDemo.getId())) {
			jeecgDemo = jeecgDemoService.getEntity(JeecgDemo.class, jeecgDemo.getId());
			req.setAttribute("jgDemo", jeecgDemo);
		}
		return new ModelAndView("jeecg/demo/jeecgDemo/jeecgDemo");
	}
	
	
	/**
	 * 设置签名跳转页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "doCheck")
	public ModelAndView doCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		if (StringUtil.isNotEmpty(id)) {
			JeecgDemo jeecgDemo = jeecgDemoService.getEntity(JeecgDemo.class,id);
			request.setAttribute("jeecgDemo", jeecgDemo);
		}
		return new ModelAndView("jeecg/demo/jeecgDemo/jeecgDemo-check");
	}
}
