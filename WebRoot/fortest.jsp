<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<title>����д������</title>
<style type="text/css">
<!--
*{margin:0;padding:0;}
body{padding:2em;background:#242424;color:#ccc;}
h1{text-align:center;line-height:200%;}
h3{text-indent:1em;line-height:160%;color:#666;font-weight:normal;font-size:1em;}
h3 a{color:#bbb; text-decoration:none;margin:0 0.5em;}
h3 a:hover{color:#fff;}
p{margin:5em;}
span{margin:0 0.5em;font-size:85.7%;}
-->
</style>
</head> 

<body>
<h1>����д������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
<form action="#" method="post">
<p><label for="password">���룺</label><input type="password" id="password" name="password" /><span style="display:none;">��д�����������£���ע���Сд</span></p>
</form>
<script type="text/javascript">
//<![CDATA[
function  detectCapsLock(event){
    var e = event||window.event;
    var o = e.target||e.srcElement;
    var oTip = o.nextSibling;
    var keyCode  =  e.keyCode||e.which; // ������keyCode 
    var isShift  =  e.shiftKey ||(keyCode  ==   16 ) || false ; // shift���Ƿ�ס
     if (
     ((keyCode >=   65   &&  keyCode  <=   90 )  &&   !isShift) // Caps Lock �򿪣���û�а�סshift�� 
     || ((keyCode >=   97   &&  keyCode  <=   122 )  &&  isShift)// Caps Lock �򿪣��Ұ�סshift��
     ){oTip.style.display = '';}
     else{oTip.style.display  =  'none';} 
}
document.getElementById('password').onkeypress = detectCapsLock;
//]]>
</script> 
</body> 
</html>