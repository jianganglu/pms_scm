<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>用户信息</title>
  <t:base type="jquery,easyui,tools"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" layout="div" dialog="true" action="studentController.do?saveStudent">
   <input type="hidden" name="id" id="id" value="${student.id}">
   <fieldset class="step">
    <div class="form">
     <label class="Validform_label">
      DEMO名称：
     </label>
     <input name="sname" class="inputxt" value="${student.sname}" datatype="s2-50">
     <span class="Validform_checktip"></span>
    </div>
    <div class="form">
     <label class="Validform_label">
      DEMO地址：
     </label>
     <input name="sage" class="inputxt" value="${student.sage}">
     <span class="Validform_checktip"></span>
    </div>
   </fieldset>
  </t:formvalid>
 </body>