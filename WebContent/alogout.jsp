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



<div style="width:960px;height:40px;border:1px solid rgb(233,204,46);padding:0 auto;margin:0 auto;margin-top:10px;">
<ul id="navigation">
				<li >
					<a href="index.jsp">Home</a>
				</li>
				<li class="selected">
					<a href="#">Profile Image</a>
				</li>
				
				<li>
					<a href="logout.jsp">Logout</a>
				</li>
				<li>
					<a href="#">Contact Us</a>
				</li>
				
			</ul>
			
</div>
<form name="second" class="snform" id="profileimage-form" action="uploadprofilepic.jsp" enctype="multipart/form-data" method="post">
<div style="width:960px;height:400px;border:1px solid rgb(233,204,46);padding:0 auto;margin:0 auto;margin-top:10px;">
<div style="width:500px;height:380px;border:1px solid rgb(233,204,46);padding:0 auto;margin:0 auto;margin-top:10px;">
<div style="width:500px;height:40px;background:#004acc;color:#FFFFFF;font-size:18px;border:0px solid rgb(233,204,46);padding-top:10px;margin:auto;margin-top:0px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Logout
</div>

<div style="width:500px;height:auto;background:#FFFFFF;color:#004acc;font-size:18px;border:0px solid rgb(233,204,46);padding-top:50px;margin:auto;margin-top:0px;">

<%

     String membername1=(String)session.getAttribute("adminname");
	String memberid1=(String)session.getAttribute("adminemail");
	
    if(membername1!=null)
        {
    	
    	 	
    	
      %>
      <font size="7" face="French Script MT">
    	Hi <font color="green"><%=membername1 %></font></font>,<br />
           <div style="align:center;padding-top:30px;padding-left:60px;">
      <font size="7" face="French Script MT">
	You are Logout Successfully <br />
	Thank You</font>
	</div>
      <%
        session.removeAttribute("adminname");
      session.removeAttribute("adminemail");
      
        }else 
        {
        	
        	
            %>
              <div style="align:center;padding-top:100px;padding-left:100px;">
         <font size="7" face="French Script MT">
   	You are  not login 
   	<font color="blue"><a href="index.jsp">Back</a></font> <br />
   	</font>
   	</div>
            <%
        } %>


</div>
</div>
</div>
</form>
<div style="width:960px;height:100px;border:1px solid rgb(233,204,46);padding:0 auto;margin:0 auto;margin-top:10px;">
<div class="footer1_rev_3x1"><div style="font-size:12px;padding-left:380px;">Copyright &#169; 2019  All rights reserved.</div></div>
</div>
</div>
</body>
</html>