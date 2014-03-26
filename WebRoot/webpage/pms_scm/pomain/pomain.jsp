<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<t:base type="jquery,easyui,tools"></t:base>
</head>
<body style = "overflow-y: hidden" scroll="no">
	<t:formvalid layout="div" dialog="true" formid="formobj" action="pomainController.do?savePomain">
		<input type="hidden" name="id" id="id" value="${pomain.id}"/>
		<fieldset class="step">
		 	<div class="form">
		 		<label class="Validform_label">
		 			采购产品：
		 		</label>
		 		<input type="text" name="productCode" class="inputxt" value="${pomain.productCode}"/>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			创建用户：
		 		</label>
		 		<input type="text" name="productCode" class="inputxt" value="${pomain.productCode}"/>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			创建时间：
		 		</label>
		 		<input type="text" name="createTime" class="inputxt" value="${pomain.createTime}"/>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			数量：
		 		</label>
		 		<input type="text" name="num" class="inputxt" value="${pomain.num}"/>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			单价：
		 		</label>
		 		<input type="text" name="unitPrice" class="inputxt" value="${pomain.unitPrice}"/>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			总价：
		 		</label>
		 		<input type="text" name="totalPrice" class="inputxt" value="${pomain.totalPrice}"/>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			供应商：
		 		</label>
		 		<input type="text" name="vender" class="inputxt" value="${pomain.vender}"/>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			付款方式：
		 		</label>
		 		<input type="text" name="payType" class="inputxt" value="${pomain.payType}"/>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			釆购单状态：
		 		</label>
		 		<input type="text" name="status" class="inputxt" value="${pomain.status}"/>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			备注：
		 		</label>
		 		<input type="text" name="comm" class="inputxt" value="${pomain.comm}"/>
		 		<span class="Validform_checktip"></span>
		 	</div>
		</fieldset>	
	</t:formvalid>
</body>
</html>