<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>男装</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
	<link rel="shortcut icon" href="<%=basePath%>img/logo.png">
	
	<script src="<%=basePath%>js/jquery.min.js"></script>
	<style>
	    li{
	       float:left;
	       list-style:none;
	       padding:8px 50px;
	       margin-left:100px;
	    }
	    #div2{
	       margin-left:200px;
	    }
	    #div2 h3{
	       
	    }
	   
	    table,thead{
	       width: 100%;
	    }
	    tr th{
	       width:25%;
	    }
	    #url_info{
	       display:block;
	       position:fixed;
	       right:0;
	       top:20%;
	       width:150px;
	       padding:5px;
	       -moz-borde-radius:4px;
	       -webkit-border-radius:4px;
	       border=radius:4px;
	       color:black;
	       font-size:large;
	    }
	   
	    #time{
	       dispaly:block;
	       position:fixed;
	       left:80%;
	       top:90%;
	    }
	    
	   
	</style>
	
	
  </head>
  
  <body>
 
  <header>
      <div class="logo">CLOTHES</div>
      <div class="account">
      <c:choose>
          <c:when test="${customer.name ==null and master.name==null}">
	         <a href="masterlogin.jsp">店主登录</a>
	         <a href="reg.jsp">顾客注册</a>
	         <a href="login.jsp">顾客登录</a>
	      </c:when>
	      <c:otherwise>
	         <c:choose>
	             <c:when test="${master.name !=null}">
	              <c:out value="${master.name}"></c:out>,欢迎您！
	              <a href="order/order_showAllOrder">我收到的订单</a>
	             </c:when>
	             <c:otherwise>
	               <c:out value="${customer.name}"></c:out>, 欢迎您!
	               <a href="order/order_showOrder?customer.name=${customer.name}">我的订单</a>
	               <a href="masterlogin.jsp">店主登录</a>	                
	             </c:otherwise>
	          </c:choose>
	             <a href="logout.jsp">退出登录</a>
	       </c:otherwise>
	  </c:choose>
	     <a href="loading.jsp">返回首页</a>
      </div>
  </header>
  <main>     
	      <div class="div2">
	       <h3>男装</h3>
	      </div>
<s:if test="#session.customer.name !=null">
	       
  <div id="url_info">
            <span style="cursor:pointer" id="span1"><img src="img/logo.png"></span><a href="cart/cart_showCart?customer.name=${customer.name}">我的购物车</a>
  </div>     
</s:if>
	      <s:iterator value="clothesList" status="status">
	          
	          <li>
	            <img src="<%=basePath%><s:property value='filepath'/>" width="150px" height="150px">
	             <p>
	                <a href="clothes/clothes_showDetail?clothes.clothesid=<s:property value='clothesid'/>">
	                  <s:property value="clothestype"/>
	                </a>
	                <span class="price"> &yen;<s:property value="unitprice"/></span>
	             </p>
	             <p>
	                <form action="order/order_addOrder?clothes.clothesid=<s:property 
	                  value='clothesid'/>&customer.name=<s:property 
	                  value='#session.customer.name'/>&order.clothesnum=<s:property 
	                  value='clothesnum'/>" method="post">
                        <input type=button value="-" onClick="javascript:this.form.clothesnum.value--;">
                        <input type="text" name="clothesnum" value="1" style="width:50px;text-align:center">
                        <input type="button" value="+" onClick="javascript:this.form.clothesnum.value++;">
                     <input type="submit" value="购买">
                   </form>
	             </p>
	             <p><a href="cart/cart_addCart?clothes.clothesid=<s:property 
	                  value='clothesid'/>&customer.name=<s:property 
	                  value='#session.customer.name'/>">加入购物车</a></p>
	          </li>
	          
	        </s:iterator>
	      
	    
	   
	   <div id="time">
    <script>
        document.getElementById('time').innerHTML = new Date().toLocaleString()
                + ' 星期' + '日一二三四五六'.charAt(new Date().getDay());
        setInterval(
                "document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",
                1000);
    </script>
</div>
     </main>     
     
  </body>
</html>
