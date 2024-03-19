<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
</head>
<body>
<%
String t1=request.getParameter("meid");
String t2=request.getParameter("mname");
String t3=request.getParameter("cpass");
String t4=request.getParameter("npass");
int state,st,loginok;
Connection con=null;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
Statement st1z=con.createStatement();
ResultSet rs1z=st1z.executeQuery("select * from register where memberid='"+t1+"' and Password='"+t3+"'");
if(rs1z.next())
  {
	Statement st2=con.createStatement();
    st=st2.executeUpdate("update register set Password='"+t4+"' where memberid='"+t1+"'");
    System.out.println("registration success");
	response.sendRedirect("userhome.jsp?labels=chpass&stat=success");
    
  }
else
{
	
	
	response.sendRedirect("userhome.jsp?labels=chpass&stat=failed");
}
%>
</body>
</html>