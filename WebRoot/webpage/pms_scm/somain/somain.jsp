<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
</head>
<body style = "overflow-y: hidden" scroll="no">
	<t:formvalid layout="div" dialog="true" formid="formobj" action="somainController.do?saveSomain">
		<input type="hidden" name="id" id="id" value="${s.id}"/>
		<input type="hidden" name="somainId" value="${s.somainId}"/>
		<fieldset class="step">
		 	<div class="form">
		 		<label class="Validform_label">
		 			销售产品：
		 		</label>
		 		<%-- <c:choose>
		 			<c:when test="${p.id} != null">
		 				<input type="text" name="productCode" class="inputxt" value="${p.productCode}"/>
		 			</c:when>
		 			<c:otherwise>
		 				<select name="productCode" >
       						<c:forEach items="${products}" var="p">
           					<option value="${p.name}" <c:if test="${p.name==p.productCode}">selected</c:if>>${p.name}</option>
        					</c:forEach>
       					</select>
		 			</c:otherwise>
		 		</c:choose> --%>
		 		<select name="productCode" class="inputxt">
       						<c:forEach items="${products}" var="product">
           					<option value="${product.name}" <c:if test="${product.name==p.productCode}">selected</c:if>>${product.name}</option>
        					</c:forEach>
       					</select>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			创建用户：
		 		</label>
		 		<input type="text" name="account" class="inputxt" value="${realName}" readonly="readonly"/>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			创建时间：
		 		</label>
		 		<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="createTime" name="createTime" 
								   value="${s.createTime}" datatype="*">
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			数量：
		 		</label>
		 		<input type="text" id="num" name="num" class="inputxt" value="${s.num}"/>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			单价：
		 		</label>
		 		<c:choose>
		 			<c:when test="${s.id == null}">
		 				<input type="text" id="unitPrice" name="unitPrice" class="inputxt" value="20"/>
		 			</c:when>
		 			<c:otherwise>
		 				<input type="text" id="unitPrice" name="unitPrice" class="inputxt" value="${s.unitPrice}"/>
		 			</c:otherwise>
		 		</c:choose>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			总价：
		 		</label>
		 		<input type="text" id="totalPrice" name="totalPrice" class="inputxt" value="${s.totalPrice}" readonly="readonly"/>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			客户名称：
		 		</label>
		 		<input type="text" name="customer" class="inputxt" value="${s.customer}"/>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			付款方式：
		 		</label>
		 		<c:choose>
		 			<c:when test="${s.payType != null}">
		 				<input class="inputxt" type="text" name="payType" value="${s.payType }" readonly/>
		 			</c:when>
		 			<c:otherwise>
		 				<select class="inputxt" name = "payType">
    						<option value="货到付款">货到付款</option>
    						<option value="款到发货">款到发货</option>
    						<option value="预付款到发货">预付款到发货</option>
    					</select>
		 			</c:otherwise>
		 		</c:choose>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			销售单状态：
		 		</label>
		 		<c:choose>
		 			<c:when test="${s.id == null}">
		 				<input type="text" name="status" class="inputxt" value="新建" readonly="readonly"/>
		 			</c:when>
		 			<c:otherwise>
		 				<input type="text" name="status" class="inputxt" value="${s.status}"/>
		 			</c:otherwise>
		 		</c:choose>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			备注：
		 		</label>
		 		<textarea type="text" name="comm" class="inputxt">${s.comm}</textarea>
		 		<span class="Validform_checktip"></span>
		 	</div>
		</fieldset>	
	</t:formvalid>
</body>
<script type="text/javascript">
	$(function(){
		if ($("#createTime").val()==""){
			$("#createTime").val(myformatter(new Date()));
		}
		
		$("#num").blur(function(){
			util();
		});
		
		$("#unitPrice").blur(function(){
			util();
		});
		
		function util(){
			var num = $("#num").val();
			var unitPrice=$("#unitPrice").val();
			if(num!=""&&unitPrice!=""){
				$("#totalPrice").attr("readonly","readonly");
				$("#totalPrice").val(num*unitPrice);
			}
		}
		
		function myformatter(date) {
			var y = date.getFullYear();
			var m = date.getMonth() + 1;
			var d = date.getDate();
			return y + '-' + (m < 10 ? ('0' + m) : m) + '-'
					+ (d < 10 ? ('0' + d) : d);
		}
	});
</script>
</html>