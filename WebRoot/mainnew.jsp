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
    
    <title>店铺首页</title>
    
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
	
	<style>
	    li{
	       float:left;
	       list-style:none;
	       padding:8px 50px;
	       margin-right:200px;
	    }
	    #url_info{
	       display:block;
	       position:fixed;
	       right:0;
	       bottom:50%;
	       width:75px;
	       height:200px;
	       padding:5px;
	       -moz-borde-radius:4px;
	       -webkit-border-radius:4px;
	       border=radius:4px;
	       color:black;
	       font-size:xx-large;
	    }
	    #time{
	       dispaly:block;
	       position:fixed;
	       left:0;
	       top:90%;
	    }
	   
	</style>
	
  </head>
  
  <body>
  <div id=url_info>
            <a href="hhh.jsp">屠点龙击宝就刀送</a>
  </div>
  <header>
      <div class="logo">CLOTHES</div>
      <div class="account">
      <c:choose>
          <c:when test="${customer.name ==null and master.name==null}">
	         <a href="masterlogin.jsp">店主登录</a>
	         <a href="masterreg.jsp">我要开店</a> 
	         <a href="reg.jsp">顾客注册</a>
	         <a href="login.jsp">顾客登录</a>
	      </c:when>
	      <c:otherwise>
	         <c:choose>
	             <c:when test="${master.name !=null}">
	              <c:out value="${master.name}"></c:out>,欢迎您！
	             </c:when>
	             <c:otherwise>
	               <c:out value="${customer.name}"></c:out>, 欢迎您!
	               <a href="order_main.jsp">我的订单</a>
	               <a href="masterlogin.jsp">店主登录</a>
	               <a href="masterreg.jsp">我要开店</a> 
	             </c:otherwise>
	          </c:choose>
	       </c:otherwise>
	  </c:choose>
      </div>
  </header>
  <main>
     <s:form action="clothes/clothes_queryClothes" method="post">
     <div class="form-inline search-box">
              <div class="form-group pull-right mr200">
                <input class="search-field form-control input-sm" title="关键词" name="keyWords" placeholder="输入关键词...">
                <button class="btn btn-info btn-sm" type="submit">搜  索</button>
              </div> 
     </div>         
      <c:choose>
	        <c:when test="${master.name !=null}">
	             
	             		        
		            <h2><div class="add"><a href="add.jsp">上架服装</a></div></h2>	        
	             
	             
	             <s:iterator value="clothesList" status="status">
	          <li>
	             <img src="<%=basePath%><s:property value='filepath'/>" width="150px" height="150px">
	             <p>
	                <a href="clothes/clothes_showDetail?clothes.clothesid=<s:property value='clothesid'/>">
	                  <s:property value="clothestype"/>
	                </a>
	                <span class="price"> &yen;<s:property value="unitprice"/></span>
	                <a href="clothes/clothes_showEdit?clothes.clothesid=<s:property 
	                  value='clothesid'/>">
	                  <i class="fa fa-pencil"></i> 
	                </a>
	                &nbsp;&nbsp;<a href="clothes/clothes_deleteClothes?clothes.clothesid=<s:property 
	                  value='clothesid'/>">
	                  <i class="fa fa-trash"></i> 
	                </a>
	             </p>
	          </li>
	        </s:iterator> 
            
	      </c:when>       
	      
	      <c:otherwise>
	      <s:iterator value="clothesList" status="status">
	          
	          <li>
	          
	             <img src="<%=basePath%><s:property value='filepath'/>" width="150px" height="150px">
	             <p>
	                <a href="clothes/clothes_showDetail?clothes.clothesid=<s:property value='clothesid'/>">
	                  <s:property value="clothestype"/>
	                </a>
	                <span class="price"> &yen;<s:property value="unitprice"/></span>
	                <a href="order/order_addOrder?clothes.clothesid=<s:property 
	                  value='clothesid'/>&customer.name=<s:property value='#session.customer.name'/>" class="add-order">
	                                               下单
	                </a>
	             </p>
	          </li>
	          
	        </s:iterator>
	      </c:otherwise>  
	      </c:choose>   
	    
	    </s:form>  
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
