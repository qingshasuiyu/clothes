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
	
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
	
	<link rel="shortcut icon" href="<%=basePath%>img/logo.png">
	
	
  </head>
  
  <body>
    
    <main class="bg">
    
	    <s:form action="customer/customer_login" method="post" cssClass="login">
	      <h3>顾客登录</h3>
	      <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" name="customer.name" class="form-control" placeholder="请输入用户名" required>
              </div>
              <s:fielderror fieldName="customer.name" cssClass="fielderror"/>
               <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" name="customer.password" pattern="^[a-zA-Z]\w{5,15}$" class="form-control" placeholder="请输入密码" required>
              </div>
              <s:fielderror fieldName="customer.password" cssClass="fielderror"/>
          </div>
	      <button type="submit" class="btn btn-success btn-login">登 录 </button>
	    </s:form>
    </main>
  </body>
</html>
