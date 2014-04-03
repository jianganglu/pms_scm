<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/context/mytags.jsp" %>
<t:datagrid actionUrl="productController.do?dataGrid" name="productList" title="产品管理" fit="true" fitColumns="true" queryMode="group" idField="id">
	<t:dgCol field="id" title="id" hidden="false"></t:dgCol>
	<t:dgCol field="productCode" title="产品编号"></t:dgCol>
	<t:dgCol field="name" title="产品名称"></t:dgCol>
	<t:dgCol field="unitName" title="单位"></t:dgCol>
	<t:dgCol field="createTime" title="添加日期"></t:dgCol>
	<t:dgCol field="stockNum" title="库存数量"></t:dgCol>
	<t:dgCol field="opt" title="操作"></t:dgCol>
	<t:dgDelOpt url="productController.do?del&id={id}" title="删除"></t:dgDelOpt>
	<t:dgToolBar title="新增" icon="icon-add" url="productController.do?addOrUpdate" funname="add"></t:dgToolBar>
	<t:dgToolBar title="编辑" icon="icon-edit" url="productController.do?addOrUpdate" funname="update"></t:dgToolBar>
</t:datagrid>