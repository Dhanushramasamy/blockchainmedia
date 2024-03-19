<?xml version="1.0" encoding="iso-8859-1" ?>
<%@ page language="java" import="java.util.*" import="java.io.*"%>
<jsp:useBean id="ker" class="model.CommonModel"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=iso-8859-1"
    pageEncoding="ISO-8859-1"%>

      <%@ page import="java.io.*" %>   
      <%@ page import="java.sql.*" %>
      <%@ page import="java.util.Calendar" %>
      <%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
	<link rel="stylesheet" href="css/components.css" type="text/css">
	<jsp:include page="script.jsp"></jsp:include>
	
</head>
<body>

<div style="width:100%;border:0px solid black;">
<div style="width:960px;height:150px;border:1px solid rgb(233,204,46);padding:0 auto;margin:0 auto;">
                    <img src="images/title.png">
<div style="width:70%;align:center;height:auto;font-size:40px;color:#F5F5F5;border:0px solid rgb(233,204,46);padding:0 auto;margin-top:30px;">

</div>
</div>



<div style="width:960px;height:600px;border:1px solid rgb(233,204,46);padding:0 auto;margin:0 auto;margin-top:10px;">

<div style="float:left;width:380px;padding-left:30px;padding-top:10px;color:#004acc;">
<%
String losta=request.getParameter("losta");
if(losta!=null)
{%>
	<div style="width:300px;height:20px;border:0px solid rgb(233,204,46);background:#FFBABA;color:#D8000C;font-size:15px;padding:5px;padding-bottom:3px;padding-left:20px; auto;margin-right:0px;margin-top:0px;">
&nbsp;Incorrect Email id/Password.</div>	
<%}%>
<form name="second" class="snform" id="login-form" action="logincheck.jsp" method="post">
<label class="req label">Email-ID</label><br />
<input type="text" class="stext bgm" id="logemail" name="logemail" value="" placeholder = "Email Id"/><br />
<label class="req label">Password</label><br />
<input type="password" class="stext bgp" id="logpassword" name="logpassword" value="" placeholder = "Password"/><br />
 <br/>
<div align="left">
<button class="search_btn">Login</button>
</div>
</form>
<div align="left">
<h5><a href="register.jsp">New User Register here!</a></h5>
</div>
</div>
<div style="float:left;width:100px;height:100px;border:0px solid #000000;"" >

</div>


</div>

<!--  -->

<div style="width:960px;height:100px;border:1px solid rgb(233,204,46);padding:0 auto;margin:0 auto;margin-top:10px;">
<div class="footer1_rev_3x1"><div style="font-size:12px;padding-left:380px;">Copyright &#169; 2019  All rights reserved.</div></div>
</div>
</div>
</body>
</html>