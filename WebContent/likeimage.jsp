
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page language="java" import="java.io.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.lang.*" %>
<%@ page language="java" import="java.net.*" %>

<%@ page import="java.util.*,java.text.*,java.text.SimpleDateFormat" %>
<%
String ad1=request.getParameter("postid");

ResultSet rs12;
HttpSession session1 = request.getSession();
int state11=0;
int state12=0;
try {
	 	Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
		Statement s12 = con.createStatement();
	   
		 state11=s12.executeUpdate("update viewpost set likes=likes + 1 where Postid='"+ad1+"'");
		 state12=s12.executeUpdate("update newpost set likes=likes + 1 where memberid='"+ad1+"'");
		 response.sendRedirect("userhome.jsp?labels=recentpost&words=occur&res=noth");
}
catch(Exception ex1){
ex1.printStackTrace();
}

%>