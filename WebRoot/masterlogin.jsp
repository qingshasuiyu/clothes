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
    
    <title>店主登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/font-awesome.css">
	<!-- link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css"-->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/login.css">
	<link rel="shortcut icon" href="<%=basePath%>img/logo.png">
	
	
  </head>
  
  <body>
    <div class="wrapper">
     <div class="container">
          <h1>店主登录</h1>
           <form action="master/master_login" method="post">
              <input type="text" name="master.name" placeholder="Username">
              <input type="password" name="master.password" placeholder="Password">
	          <button type="submit" id="login-button">Login</button>
           </form>
     </div>
    </div>
  </body>
</html>
