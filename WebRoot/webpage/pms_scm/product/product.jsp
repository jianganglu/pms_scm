<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/context/mytags.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
</head>
<body>
<t:formvalid layout="div" dialog="true" formid="formobj" action="productController.do?saveProduct">
	<input type="hidden" name="id" id="id" value="${p.id}"/>
	<fieldset class="step">
	  <div class="form">
		<label class="Validform_label">
		 	产品编号：
		</label>
		<input type="text" name="productCode" class="inputxt" value="${p.productCode}" datatype="*"/>
		<span class="Validform_checktip"></span>
	  </div>
	  <div class="form">
		<label class="Validform_label">
		 	产品名称：
		</label>
		<input type="text" name="name" class="inputxt" value="${p.name}" datatype="*"/>
		<span class="Validform_checktip"></span>
	  </div>
	  <div class="form">
		<label class="Validform_label">
		 	单位：
		</label>
		<input type="text" name="unitName" class="inputxt" value="${p.unitName}" datatype="*"/>
		<span class="Validform_checktip"></span>
	  </div>
	  <div class="form">
		<label class="Validform_label">
		 	添加日期：
		</label>
		<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="createTime" name="createTime" 
								   value="${p.createTime}" datatype="*">
		<span class="Validform_checktip"></span>
	  </div>
	  <div class="form">
		<label class="Validform_label">
		 	库存数量：
		</label>
		<input type="text" name="stockNum" class="inputxt" value="${p.stockNum}" datatype="n"/>
		<span class="Validform_checktip"></span>
	  </div>
	  <div class="form">
		<label class="Validform_label">
		 	备注：
		</label>
		<textarea type="text" name="comm" class="inputxt">${p.comm}</textarea>
		<span class="Validform_checktip"></span>
	  </div>
	</fieldset>
</t:formvalid>
</body>
</html>