package com.pms_scm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeecg.system.service.SystemService;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pms_scm.entity.Teacher;
import com.pms_scm.service.TeacherServiceI;

@Controller
@RequestMapping("/teacherController")
public class TeacherController {

	@SuppressWarnings("unused")
	private static final Logger log = Logger.getLogger(TeacherController.class);

	private TeacherServiceI teacherService;
	private SystemService systemService;
	private String message = null;

	@Autowired
	public void setTeacherService(TeacherServiceI teacherService) {
		this.teacherService = teacherService;
	}

	@Autowired
	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}
	
	@RequestMapping(params = "teacher")
	public String teacher(){
		return "pms_scm/teacherList";
	}
	
	@RequestMapping(params="dataGrid")
	public void dataGrid(Teacher teacher, HttpServletRequest reqeust, HttpServletResponse response, DataGrid datagrid){
		this.teacherService.dataGrid(teacher, reqeust, response, datagrid);
	}
	
	@RequestMapping(params = "addorupdate")
	public String addorupdate(Teacher teacher,HttpServletRequest request){
		if (StringUtil.isNotEmpty(teacher.getId())){
			teacher = systemService.getEntity(Teacher.class, teacher.getId());
			request.setAttribute("t", teacher);
		}
		Teacher t = (Teacher) request.getAttribute("t");
		return "pms_scm/teacher";
	}
	
	@RequestMapping(params = "saveTeacher")
	@ResponseBody
	public AjaxJson saveTeacher(HttpServletRequest request, Teacher teacher){
		AjaxJson j = new AjaxJson();
		if (!StringUtil.isEmpty(teacher.getId())){
			systemService.updateEntitie(teacher);
			j.setMsg("更新成功");
		}else{
			systemService.save(teacher);
			j.setMsg("添加成功");
		}
		
		
		/*AjaxJson j = new AjaxJson();
		if (!StringUtil.isEmpty(demo.getId())) {
			message = "Demo维护例子: " + demo.getDemotitle() + "被更新成功";
			TSDemo entity = this.systemService.get(TSDemo.class, demo.getId());
			MyBeanUtils.copyBeanNotNull2Bean(demo, entity);
			
			if (demo.getTSDemo() == null || StringUtil.isEmpty(demo.getTSDemo().getId())) {
				entity.setTSDemo(null);
			}
			this.systemService.saveOrUpdate(entity);
		}else {
			message = "Demo例子: " + demo.getDemotitle() + "被添加成功";
			if (demo.getTSDemo() == null || StringUtil.isEmpty(demo.getTSDemo().getId())) {
				demo.setTSDemo(null);
			}
			this.systemService.save(demo);
		}
		j.setMsg(message);
		return j;*/
		
		return j;
	}
	
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(Teacher teacher, HttpServletRequest request){
		AjaxJson j = new AjaxJson();
		if (teacher.getId()!=null){
			message = teacher.getTname() + "被删除 成功";
			systemService.deleteEntityById(Teacher.class, teacher.getId());
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}
}
