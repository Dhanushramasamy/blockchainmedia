<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@ page import="java.io.*" %>  
      <%@ page import="java.sql.*" %>
      <%@ page import="java.util.Calendar" %>
      <%@ page import="java.text.SimpleDateFormat" %>
      <%@ page import="java.util.Date;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%
String t1=request.getParameter("meid");
String t2=request.getParameter("receiver");
String t3=request.getParameter("privatemsg");
Date datex = new Date();
String currentdate=datex.toString();
String receiver=new String("");
int state,st,loginok;
Connection con=null;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
Statement st1z=con.createStatement();
ResultSet rs1z=st1z.executeQuery("select * from responsefriend where  memberid='"+t1+"' and requestid='"+t2+"' ");
if(rs1z.next())
  {
	receiver=rs1z.getString("memberid");
	Statement st2=con.createStatement();
	st=st2.executeUpdate("insert into privatemsg values('"+t1+"','"+t2+"','"+t3+"','"+currentdate+"') ");
	System.out.println("registration success");
	
  }

response.sendRedirect("userhome.jsp?labels=pumessage&stat=success");
//most posted msg checks start
Connection con23=null;
boolean pr=false;
String repmesg=null,msgtype="Private",msgtype1=null;
Class.forName("com.mysql.jdbc.Driver");
con23=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
Statement st1z23=con23.createStatement();
ResultSet rs1z23=st1z23.executeQuery("select * from mostposted ");
while(rs1z23.next())
  {
	repmesg=rs1z23.getString(1);
 
	st=0;
	int count=0;
	if(t3.equalsIgnoreCase(repmesg)){
		msgtype1=rs1z23.getString(2);
		if(	msgtype.equalsIgnoreCase(msgtype1)){
		count=rs1z23.getInt(3);
		count++;
		
	
	Statement st222=con23.createStatement();
	pr=true;
	st=st222.executeUpdate("update mostposted set reqdate='"+count+"' where message='"+t3+"'");

	System.out.println("updation success"+count+"null");
	}}
  }
//most posted message insert Start 
if(pr==false){
st=0;
	int count=1;
Connection con22=null;
Class.forName("com.mysql.jdbc.Driver");

con22=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
Statement st1z22=con22.createStatement();
int rs1z22=st1z22.executeUpdate("insert into mostposted values('"+t3+"','"+msgtype+"','"+count+"') ");
System.out.println("insertion success");
}
//most posted message insert end
%>

</body>
</html>