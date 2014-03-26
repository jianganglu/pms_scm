<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/context/mytags.jsp"%>
<t:datagrid actionUrl="pomainController.do?dataGrid" name="pomainList" title="管理釆购单" fit="true" fitColumns="true" queryMode="group" idField="id">
	<t:dgCol field="pomainId" title="采购单单号" hidden="false"></t:dgCol>
	<t:dgCol field="productCode" title="釆购产品" query="true"></t:dgCol>
	<t:dgCol field="createTime" title="创建时间" query="true" queryMode="single"></t:dgCol>
	<t:dgCol field="num" title="数量"></t:dgCol>
	<t:dgCol field="unitPrice" title="单价"></t:dgCol>
	<t:dgCol field="totalPrice" title="总价"></t:dgCol>
	<t:dgCol field="vender" title="供应商"></t:dgCol>
	<t:dgCol field="payType" title="付款方式"></t:dgCol>
	<t:dgCol field="status" title="状态"></t:dgCol>
	<t:dgCol field="opt" title="操作"></t:dgCol>
	<t:dgDelOpt title="删除" url="teacherController.do?del&id={id}"></t:dgDelOpt>
	<t:dgToolBar title="新增" icon="icon-add" url="pomainController.do?addorupdate" funname="add"></t:dgToolBar>
	<t:dgToolBar title="编辑" icon="icon-edit" url="pomainController.do?addorupdate" funname="update"></t:dgToolBar>
</t:datagrid>