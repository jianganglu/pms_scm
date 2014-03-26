package com.pms_scm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.common.service.CommonService;

import com.pms_scm.entities.Teacher;

public interface TeacherServiceI extends CommonService{

	public void dataGrid(Teacher teacher, HttpServletRequest reqeust, HttpServletResponse response, DataGrid datagrid);
}
