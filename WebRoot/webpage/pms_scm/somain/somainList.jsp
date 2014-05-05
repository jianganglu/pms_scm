<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/context/mytags.jsp"%>
<t:datagrid actionUrl="somainController.do?dataGrid" name="somainList" title="管理销售单" fit="true" fitColumns="true" queryMode="group" idField="id">
	<t:dgCol field="id" title="id" hidden="false"></t:dgCol>
	<t:dgCol field="somainId" title="销售单号" query="true"></t:dgCol>
	<t:dgCol field="productCode" title="销售产品" query="true"></t:dgCol>
	<t:dgCol field="createTime" title="创建时间" query="true" queryMode="single"></t:dgCol>
	<t:dgCol field="num" title="数量"></t:dgCol>
	<t:dgCol field="unitPrice" title="单价"></t:dgCol>
	<t:dgCol field="totalPrice" title="总价"></t:dgCol>
	<t:dgCol field="customer" title="客户"></t:dgCol>
	<t:dgCol field="payType" title="付款方式"></t:dgCol>
	<t:dgCol field="status" title="状态"></t:dgCol>
	<t:dgCol field="opt" title="操作"></t:dgCol>
	<t:dgDelOpt title="删除" url="somainController.do?del&id={id}" exp="status#eq#新建"></t:dgDelOpt>
	<t:dgToolBar title="新增" icon="icon-add" url="somainController.do?addSomain" funname="add"></t:dgToolBar>
	<t:dgToolBar title="编辑" icon="icon-edit" url="somainController.do?editSomain" funname="update"></t:dgToolBar>
</t:datagrid>