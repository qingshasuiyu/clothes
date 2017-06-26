<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的订单</title>
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
    <header>
       <div class="logo">CLOTHES</div>
       <div class="account">
         
	         <c:out value="${customer.name}"></c:out>, 欢迎您!
	       
	         <a href="loading.jsp">返回首页</a>
       </div>    
    </header>
    
    <main class="container-fluid">
      <div class="row">
         <div class="col-md-12">
		    <s:form action="order/order_queryOrders" method="post">
		      <div class="panel panel-info">
	                 <div class="panel-heading">
	                    <h3 class="panel-title">我的订单</h3>
	                 </div>
	                 <div class="panel-body panel-body-table">
	                   <div class="table-responsive" style="overflow-x:hidden">
	                      <table class="table table-striped table-bordered table-hover" id="dataTables-example">
	                         <thead>
	                           <tr>
	                                  <th>序号</th>  
							          <th>类型</th>
							          <th>服装</th>
							          <th>单价</th> 
							          <th>数目</th>  
							          <th>总价</th>
	                              </tr>
	                          </thead>
	                          <tbody>
	                              <s:iterator value="orderList" status="status">
	                                  <tr>
	                                      <td><s:property value="#status.index+1"></s:property></td>
	                                      <td><s:property value="clothes.type"></s:property></td>
	                                      <td class="center"><s:property value="clothes.clothestype"></s:property></td>
	                                      <td class="center"><s:property value="clothes.unitprice"></s:property></td>
	                                      <td class="center"><s:property value="clothesnum"></s:property></td>
	                                      <td class="center"><s:property value="total"></s:property></td>
	                                  </tr>
	                              </s:iterator>
	                          </tbody>
	                        </table>
	                      </div>
	                    </div>
	                </div>
		       </s:form>
	       </div>
	   </div>
	</main>
	
	<script src="<%=basePath%>js/jquery.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <script src="<%=basePath%>js/jquery.dataTables.js"></script>
    <script src="<%=basePath%>js/dataTables.bootstrap.js"></script>
    <script>
       $(document).ready(function () {
           $('#dataTables-example').dataTable({
			   "language": {
                 "lengthMenu": "每页 _MENU_ 条记录",
                 "zeroRecords": "没有找到记录",
                 "info": "第 _PAGE_ 页 ( 共 _PAGES_ 页 )",
                 "infoEmpty": "无记录",
                 "infoFiltered": "(从 _MAX_ 条记录过滤)",
				 "sInfoPostFix": "",
				 "sSearch": "搜 索 : ",
				 "sUrl": "",
				 "sEmptyTable": "表中数据为空",
				 "sLoadingRecords": "载入中...",
				 "sInfoThousands": ",",
				 "oPaginate": {
					"sFirst": "首页",
					"sPrevious": "上页",
					"sNext": "下页",
					"sLast": "末页"
				 },
				 "oAria": {
				 "sSortAscending": ": 以升序排列此列",
				 "sSortDescending": ": 以降序排列此列"
			     },
				 
             }
		   });
       });
    </script>
  </body>
</html>