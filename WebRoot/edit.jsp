<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>编辑</title>
    
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
          <c:out value="${master.name}"></c:out>,欢迎您！
      </div>
  </header>
         <main class="container-fluid">
	    <div class="row">
		   <div class="col-md-10">
		      <s:form action="clothes/clothes_editClothes" cssClass="form-horizontal" enctype="multipart/form-data">
		      <s:hidden name="clothes.clothesid"/>
		      <div class="panel panel-success">
			       <div class="panel-heading">
		               <h4 class="panel-title"> 编 辑 服 装 信 息</h4>
		           </div>
		           <div class="panel-body">
				       <div class="form-group">
			                <label class="control-label col-md-3">服装名称</label>
			                <div class="col-md-4">
                              <input type="text" name="clothes.clothestype" value="<s:property value='clothes.clothestype'/>" class="form-control input-sm" required>
                           </div>
			           </div>
			           <div class="form-group">
			                <label class="control-label col-md-3">服装类型</label>
			                <div class="col-md-4">
                              <select name="clothes.type">
                                   <option value="男装">男装</option>
                                   <option value="女装">女装</option>
                                   <option value="童装">童装</option>
                              </select>
                            </div>
       			       </div>      
			           <div class="form-group">
			                <label class="control-label col-md-3">服装单价</label>
			                <div class="col-md-2">
                              <input type="text" name="clothes.unitprice" value="<s:property value='clothes.unitprice'/>" class="form-control input-sm" placeholder="&yen;" required>
                            </div>
			           </div>
			           <div class="form-group">
			                <label class="control-label col-md-3">服装图片</label>
			                <div class="col-md-4">
			                  <div class="fileupload fileupload-new" data-provides="fileupload">
                                  <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                    <img src="<%=basePath%><s:property value='clothes.filepath'/>" alt="" />
                                  </div>
                                  <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height:150px; line-height: 20px;">
                                  </div>
                                  <div>
                                      <span class="btn btn-file btn-primary">
                                         <span class="fileupload-new">换张图片</span>
                                         <span class="fileupload-exists">换张图片</span>
                                         <input type="file" name="clothesPhoto"/>
                                      </span>
                                      <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">取消</a>
                                  </div>
                              </div>
                            </div>
			           </div>    

			           <div class="form-group col-md-3">
				          <button type="submit" class="btn btn-success pull-right">提  交 </button>
				       </div>
				   </div>
				</div>
		    </s:form>
		  </div>
	   </div>
	</main>
  </body>
</html>
