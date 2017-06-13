<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>顾客登录</title>
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/login.css">
	
	<link rel="shortcut icon" href="<%=basePath%>img/logo.png">
	
	
  </head>
  
  <body>
    
    <div class="wrapper">
     <div class="container">    
	    <form action="customer/customer_login" method="post">
	      <h1>顾客登录</h1>
	          <input type="text" name="customer.name" placeholder="Username">
              <input type="password" name="customer.password" placeholder="Password">
	          <button type="submit" id="login-button">Login</button>
	      </form>
    </div>
    </div>
  </body>
</html>
