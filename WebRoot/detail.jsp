<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>服装详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- meta http-equiv="Refresh" content="2;url=clothes/clothes_showClothes" -->
	
	<link rel="stylesheet" type="text/css" href="index.css">
	<link rel="stylesheet" type="text/css" href="bootstrap.css">
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
	<link rel="shortcut icon" href="<%=basePath%>img/logo.png">
	
	<style type="text/css">
	div2{
	text-align:center;
	-moz-border-radius: 15px;
    -webkit-border-radius: 15px;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#FFFFFF), to(#DCDCDC));
	position:absolute;
	top:50%;
	left:50%;
	margin:-150px 0 0 -200px;
	padding-top:30px;
	width:400px;
	height:300px;
	border:1px solid #008800;
}
	
	</style>
  </head>
  
  <body>
  <div class="div2">
   <p>服装名称：<c:out value="${clothes.clothestype}"></c:out></p>
   <p>单价：<c:out value="${clothes.unitprice}"></c:out></p>
   <p>衣服图片展示：</p>
   <p>
    <img src="<%=basePath%><s:property value='clothes.filepath'/>" width="150px" height="150px">
   </p>
  </div> 
  </body>
</html>
