<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:datagrid name="studentList" title="学生管理" actionUrl="studentController.do?dataGrid" fit="true" fitColumns="true" idField="id" queryMode="group">
	<t:dgCol title="编号" field="id" hidden="false" ></t:dgCol>
	<t:dgCol title="用户名" sortable="false" field="sname" query="true" width="20"></t:dgCol>
	<t:dgCol title="年龄" field="sage" query="true" queryMode="single"></t:dgCol>
	<t:dgCol title="操作" field="opt" width="100"></t:dgCol>
	<t:dgDelOpt title="删除" url="studentController.do?del&id={id}" />
	<t:dgToolBar title="用户录入" icon="icon-add" url="studentController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="用户编辑" icon="icon-edit" url="studentController.do?addorupdate" funname="update"></t:dgToolBar>
</t:datagrid>
