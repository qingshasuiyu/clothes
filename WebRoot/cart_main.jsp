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
    
    <title>我的购物车</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/font-awesome.css">
	<!-- link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css"-->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/cart.css">
	<link rel="shortcut icon" href="<%=basePath%>img/logo.png">
	 
	<script src="<%=basePath%>js/jquery.min.js"></script>
  </head>
  
  <body>
    <header>
       <div class="logo">CLOTHES</div>
       <div class="account">
         
	         <c:out value="${customer.name}"></c:out>, 欢迎您!
	       
	         <a href="loading.jsp">返回首页</a>
       </div>    
    </header>
    <main>
       <h3>我的购物车</h3>
       <table>
         <thead>
           <tr>
              <th>序号</th>
              <th>服装</th>
              <th>单价</th>
              <th>数目</th>
              <th>总价</th>
              <th>操作</th>
           </tr>
         </thead>
         <tbody>
           <s:iterator value="cartList" status="status">
            <tr>
             <td><s:property value="#status.index+1"></s:property></td>
             <td>
             <a href="clothes/clothes_showDetail?clothes.clothesid=<s:property value='clothes.clothesid'/>">
	         <s:property value="clothes.clothestype"></s:property>
	         </a></td>	         
	         <td><s:property value="clothes.unitprice"></s:property></td>
	         <td><s:property value="clothesnum"></s:property></td>
	        
	         <td><s:property value="total"></s:property></td>
	         <td><a href="cart/cart_deleteCart?cart.cartid=<s:property value='cartid'/>">删除</a>
	         /<a href="order/order_addOrder?clothes.clothesid=<s:property 
	                  value='clothes.clothesid'/>&customer.name=<s:property 
	                  value='#session.customer.name'/>&clothesnum=<s:property 
	                  value='clothesnum'/>">下单</a></td>                         
            </tr>
           </s:iterator>
         </tbody>
       </table>
    </main>
  </body>
</html>
