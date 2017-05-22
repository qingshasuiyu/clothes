<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>下单页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
	<link rel="shortcut icon" href="<%=basePath%>img/logo.png">
	
	<style type="text/css">
	div{
	text-align:center;
	-moz-border-radius: 15px;
    -webkit-border-radius: 15px;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#FFFFFF), to(#DCDCDC));
	position:absolute;
	top:50%;
	left:50%;
	margin:-150px 0 0 -200px;
	padding-top:60px;
	width:400px;
	height:300px;
	border:1px solid #008800;
}
	
	</style>

  </head>
  
  <body>
    <header>
       <div class="logo">CLOTHES</div>
       <div class="account">
           <c:out value="${customer.name}"></c:out>, 欢迎您!
	       <a href="clothes/clothes_queryClothes">返回首页</a>
       </div>    
    </header>
  <div>
    <dl> 
       <dt>订单</dt>       
             <dd>服装型号：
    <select name="size">
       <option value="extra small">XS</option>
       <option value="small">S</option>
       <option value="middle">M</option>
       <option value="large">L</option>
       <option value="extra large">XL</option>
    </select></dd>
             <dd>服装数量
    <form>
      <input type=button value="-" onClick="javascript:this.form.clothesnum.value--;">
      <input type=text name="clothesnum" value=1 style="width:50px;text-align:center">
      <input type=button value="+" onClick="javascript:this.form.clothesnum.value++;">
    </form></dd>
    </dl>
    <a href="order/order_addOrder?clothes.clothesid=<s:property 
           value='clothesid'/>&customer.name=<s:property 
           value='#session.customer.name'/>&clothes.clothesnum=<s:property 
           value='clothesnum'/>" class="add-order">
	<button type="submit" class="btn btn-success btn-login">下 单 </button>
	</a>
    
    <a href="mainnew.jsp">我再考虑一下</a>
    </div>
  </body>
</html>
