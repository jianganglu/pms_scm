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
	<t:formvalid layout="div" dialog="true" formid="formobj" action="teacherController.do?saveTeacher">
		<input type="hidden" name="id" id="id" value="${teacher.id}"/>
		<fieldset class="step">
		 	<div class="form">
		 		<label class="Validform_label">
		 			用户名：
		 		</label>
		 		<input type="text" name="tname" class="inputxt" value="${t.tname}"/>
		 		<span class="Validform_checktip"></span>
		 	</div>
		 	<div class="form">
		 		<label class="Validform_label">
		 			年龄：
		 		</label>
		 		<input type="text" name="tage" class="inputxt" value="${t.tage}"/>
		 		<span class="Validform_checktip"></span>
		 	</div>
		</fieldset>	
	</t:formvalid>
</body>
</html>