<%@ page contentType="text/html" language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML >
<html>
  <head>
    <title>注销页面</title>
  </head>
  <body>
    <%
      response.setHeader("refresh","3;URL=clothes/clothes_showClothes");
      session.invalidate();
     %>
     <h3>你已经成功退出本系统,3秒后会跳转到首页</h3>
     <img alt="" src="img/timg.gif" width="20px" height="20px">
     <h3>如果没有跳转请点击<a href="clothes/clothes_showClothes">这里</a></h3>
     
  </body>
</html>