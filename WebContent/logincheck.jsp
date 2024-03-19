
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page language="java" import="java.io.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.lang.*" %>
<%@ page language="java" import="java.net.*" %>

<%@ page import="java.util.*,java.text.*,java.text.SimpleDateFormat" %>
<%
String ad1=request.getParameter("logemail");
String ad2=request.getParameter("logpassword");
String ad12=new String("");
String ad11=new String("");
String ad13=new String("");
String ad14=new String("");
String ad11t=new String("");
String ad13t=new String("");
ResultSet rs12;
HttpSession session1 = request.getSession();
String adminemail="admin@admin.com";
String adminpass="adminadmin";
String adminname="Admin";


if(adminemail.equals(request.getParameter("logemail")) && adminpass.equals(request.getParameter("logpassword")))
{
	 response.sendRedirect("admin.jsp?label=noth&status=noth");
	session1.setAttribute("adminname",adminname);
	session1.setAttribute("adminemail",adminemail);
}
else
{
try {
	 Class.forName("com.mysql.jdbc.Driver");
 		java.sql.Connection conn12=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
 		Statement s12 = conn12.createStatement();
 		String sql12 = "select * from register where Email='"+ad1+"' and Password='"+ad2+"'" ;
 		s12.executeQuery (sql12);
 		rs12 = s12.getResultSet();
		while (rs12.next ())
			{
				ad11=rs12.getString("Memberid");
				ad12=rs12.getString("Firstname");
				ad13=rs12.getString("Email");
				ad14=rs12.getString("Password");
				
			}
		if(ad13.equals(request.getParameter("logemail")) && ad14.equals(request.getParameter("logpassword")))
	 {
			

			Class.forName("com.mysql.jdbc.Driver");
		 	java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
	        Statement st=con.createStatement();
	        
	        String sql13 = "select * from enteruser where  Memberid='"+ad11+"' and Email='"+ad13+"'" ;
	 		s12.executeQuery (sql13);
	 		rs12 = s12.getResultSet();
			if (rs12.next ())
				{
				  int i1=st.executeUpdate("update enteruser set visited='exist',counte=counte + 1 where Memberid='"+ad11+"' and Email='"+ad13+"'");
				}
			else
			{
	        int i=st.executeUpdate("insert into enteruser(Memberid,Email,visited,counte) values('"+ad11+"','"+ad13+"','new','0')");
			}
			
			session1.setAttribute("Memberid",ad11);
			session1.setAttribute("Membername",ad12);
			session1.setAttribute("Memberemail",ad13);
			 int i1y=st.executeUpdate("update chatingmember set status='online' where memberid='"+ad11+"'");
			 String msta="online";
			 session1.setAttribute("Memberstatus",msta);
			response.sendRedirect("pass.jsp");
	 }
	 else
	 {
			
		 response.sendRedirect("index.jsp?losta=failure");
	 }
}
catch(Exception ex1){
ex1.printStackTrace();
}
}
%>