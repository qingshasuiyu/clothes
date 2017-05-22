<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Refresh" content="1;url=order/order_showOrder?customer.name=${customer.name}">
	
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
	<link rel="shortcut icon" href="<%=basePath%>img/logo.png">
	

  </head>
  
  <body>
     <p>订单号：<s:property value="order.orderid"></s:property></p>
     <p>下单顾客：<s:property value="order.customer.name"></s:property></p>
     <p>服装：<s:property value="order.clothes.clothestype"></s:property></p>
     <p>单价：<s:property value="order.clothes.unitprice"></s:property></p>
     <p>数量：<s:property value="order.clothesnum"></s:property></p>
     <p>总价：<s:property value="order.total"></s:property></p>
  </body>
</html>
