<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/context/mytags.jsp"%>
<t:datagrid actionUrl="teacherController.do?dataGrid" name="teacherList" title="教师管理" fit="true" fitColumns="true" queryMode="group" idField="id">
	<t:dgCol field="id" title="编号" hidden="false"></t:dgCol>
	<t:dgCol field="tname" title="用户名" query="true"></t:dgCol>
	<t:dgCol field="tage" title="年龄" query="true" queryMode="single"></t:dgCol>
	<t:dgCol field="opt" title="操作"></t:dgCol>
	<t:dgDelOpt title="删除" url="teacherController.do?del&id={id}"></t:dgDelOpt>
	<t:dgToolBar title="教师录入" icon="icon-add" url="teacherController.do?addorupdate" funname="add"></t:dgToolBar>
	<t:dgToolBar title="教师编辑" icon="icon-edit" url="teacherController.do?addorupdate" funname="update"></t:dgToolBar>
</t:datagrid>