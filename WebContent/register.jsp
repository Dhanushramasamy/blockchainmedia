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
<div style="width:960px;height:150px;border:1px solid rgb(233,204,46);padding:0 auto;margin:0 auto; ">
  <img src="images/title.png">
    <div style="width:70%;align:center;height:auto;font-size:40px;color:#F5F5F5;border:0px solid rgb(233,204,46);padding:0 auto;margin-top:30px;">

    </div>
</div>




<div style="width:960px;height:820px;border:1px solid rgb(233,204,46);padding:0 auto;margin:0 auto;margin-top:10px;">

<div style="float:right;width:500px;height:790px;border:1px solid rgb(233,204,46);padding:0px;margin:0 auto;margin-right:10px;margin-top:10px;">
<div style="width:450px;height:40px;border:0px solid rgb(233,204,46);background:#004acc;color:#FFFFFF;font-size:25px;padding-top:10px;padding-left:50px; auto;margin-right:0px;margin-top:0px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Create An New Account</div>

<%
String stas=request.getParameter("createstas");
String staf=request.getParameter("createstaf");
if(stas!=null)
{%>
	<div style="width:480px;height:40px;border:0px solid rgb(233,204,46);background:#DFF2BF;color:green;font-size:18px;padding-top:10px;padding-bottom:3px;padding-left:20px; auto;margin-right:0px;margin-top:0px;">
&nbsp;Thanks for registering. <a href="index.jsp"> Click here to login</a></div>	
<%}
if(staf!=null)
{%>
	<div style="width:480px;height:40px;border:0px solid rgb(233,204,46);background:#FFBABA;color:#D8000C;font-size:19px;padding-top:10px;padding-bottom:3px;padding-left:20px; auto;margin-right:0px;margin-top:0px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Already Registered, please give different email id or <a href="index.jsp"> Click here to login</a></div>	
<%}%>

<div style="width:450px;height:auto;border:0px solid rgb(233,204,46);background:#60c4dd;color:#004acc;padding-top:10px;padding-left:30px; auto;margin-right:0px;margin-top:0px;">

<form name="second" class="snform" id="create-form" action="create" method="post">
<label class="req label">First Name</label><br />
<input type="text" class="stext" id="fname" name="fname" value="" placeholder = "Eg:Balaji"/><br />
<label class="req label">Last Name</label><br />
<input type="text" class="stext" id="lname" name="lname" value="" placeholder = "Eg:Rajendiran"/><br />
<label class="req label">Email Id</label><br />
<input type="text" class="stext" id="email" name="email" value="" placeholder = "Eg:balaji@gmail.com"/><br />
<label class="req label">Enter the Password</label><br />
<input type="password" class="stext" id="pass" name="pass" value="" /><br />


<label class="req label">Date Of Birth</label><br />
<input type="text" class="stext" id="dob" name="dob" value="" placeholder = "Eg:05-02-1986"/><br />

<label class="req label">Location</label><br />
<input type="text" class="stext" id="city" name="city" value="" placeholder = "Eg:Chennai"/><br />

<label class="req label">I am </label><br />
<input type="text" class="stext" id="iam" name="iam" value="" placeholder = "Eg:Student or designation"/><br />

<label class="req label">Name Of School/College or Company </label><br />
<input type="text" class="stext" id="working" name="working" value="" placeholder = "Eg:Mary's or Wipro"/><br />


<label class="req label">Gender</label>&nbsp;&nbsp;&nbsp;
 <label>
      <input type="radio" name="gender" value="Male" id="gender" checked/>
      <font color="black">Male&nbsp;&nbsp;&nbsp;</font></label>
   
    <label>
      <input type="radio" name="gender" value="Female" id="gender" />
      <font color="black">Female</font></label><br />
 
 <br/><div align="left">
  <label>
<input type="checkbox" checked="checked"  id="agree" name="agree" value="agree"/>
I Agree to the All Terms of Service and Privacy Policy.</label>

</div><br />
<div align="left">
<button class="search_btn">Create</button>
</div>

</form>
</div>

</div>
</div>
<div style="width:960px;height:100px;border:1px solid rgb(233,204,46);padding:0 auto;margin:0 auto;margin-top:10px;">
<div class="footer1_rev_3x1"><div style="font-size:12px;padding-left:380px;">Copyright &#169; 2019  All rights reserved.</div></div>
</div>
</div>
</body>
</html>