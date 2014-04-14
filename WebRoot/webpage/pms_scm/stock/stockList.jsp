<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/context/mytags.jsp"%>
<t:datagrid actionUrl="stockController.do?dataGrid" name="stockList" title="入库管理" fit="true" fitColumns="true" queryMode="group" idField="id">
	<t:dgCol field="id" title="id" hidden="false"></t:dgCol>
	<t:dgCol field="pomainId" title="采购单单号"></t:dgCol>
	<t:dgCol field="productCode" title="釆购产品" query="true"></t:dgCol>
	<t:dgCol field="createTime" title="创建时间" query="true" queryMode="single"></t:dgCol>
	<t:dgCol field="num" title="数量"></t:dgCol>
	<t:dgCol field="unitPrice" title="单价"></t:dgCol>
	<t:dgCol field="totalPrice" title="总价"></t:dgCol>
	<t:dgCol field="vender" title="供应商"></t:dgCol>
	<t:dgCol field="payType" title="付款方式"></t:dgCol>
	<t:dgCol field="status" title="状态"></t:dgCol>
	<t:dgCol field="opt" title="操作"></t:dgCol>
	<t:dgConfOpt url="stockController.do?stockIn&id={id}" message="确定要入库吗?" title="入库"></t:dgConfOpt>
</t:datagrid>