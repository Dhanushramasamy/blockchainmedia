			<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page language="java" import="java.io.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.lang.*" %>
<%@ page language="java" import="java.net.*" %>

<%@ page import="java.util.*,java.text.*,java.text.SimpleDateFormat" %>
			<%
				Object memberids=session.getAttribute("Memberid");
				String memberid=memberids.toString();
				Object memberemails=session.getAttribute("Memberemail");
				String memberemail=memberemails.toString();
				Object membernames=session.getAttribute("Membername");
				String membername=membernames.toString();
				Object memberstatuss=session.getAttribute("Memberstatus");
				String memberstatus=memberstatuss.toString();
				
			ResultSet rs12;
			HttpSession session1 = request.getSession();
			String countt=new String("");
			Class.forName("com.mysql.jdbc.Driver");
		 	java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
	        Statement st=con.createStatement();
	        
	        String sql13 = "select * from enteruser where  Memberid='"+memberid+"' and Email='"+memberemail+"'" ;
	 		st.executeQuery (sql13);
	 		rs12 = st.getResultSet();
			if (rs12.next ())
				{
				countt=rs12.getString("visited");
				if(countt.equals("new"))
				{
					 response.sendRedirect("profileimage.jsp?mid="+memberid);
				}
				else
				{
					 response.sendRedirect("userhome.jsp?labels=recentpost&words=occur&res=noth");
				}
				}
			else
			{
				 response.sendRedirect("index.jsp?losta=failure");
			}%>