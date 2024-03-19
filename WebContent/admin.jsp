<%			


//response.setIntHeader("Refresh", 10);
Format formatter= new SimpleDateFormat("dd.MM.yyyy.HH.mm.ss");
Date date = new Date();
String newDate = formatter.format(date);
%>
<?xml version="1.0" encoding="iso-8859-1" ?>
<%@ page language="java" import="java.util.*" import="java.io.*"%>
<jsp:useBean id="ker" class="model.CommonModel"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=iso-8859-1"
    pageEncoding="ISO-8859-1"%>
 
      <%@ page import="java.io.*" %>  
      <%@ page import="java.sql.*" %>
      <%@ page import="java.util.Calendar" %>
      <%@ page import="java.text.SimpleDateFormat" %>
      <%@ page import="java.io.*,java.util.*, java.text.*" %>
<%@ page import="java.util.Date" %>
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
<%		
				Object adminemails=session.getAttribute("adminemail");
				String adminemail=adminemails.toString();
				Object adminnames=session.getAttribute("adminname");
				String adminname=adminnames.toString();
				String labels=request.getParameter("label");
				String status=request.getParameter("sta");
				%>

<%			



				
				
				
				
				%>
				 
<div style="width:960px;height:auto;padding:0 auto;margin:0 auto; border:0px solid #004acc";>
<div style="width:960px;height:auto;float:left; border:0px solid #004acc";>
<img src="images/title.png">
<div style="width:960px;height:150px;float:left; border:0px solid #004acc;background-color:#eac914;">

<%System.out.println("works"); %>




</div>
<div style="width:960px;height:auto;float:left; border:0px solid #004acc";>
<div style="width:960px;height:40px;border:1px solid rgb(233,204,46);padding:0 auto;margin:0 auto;margin-top:10px;">
<ul id="navigation11" >
				<li class="selected">
					<a href="index.jsp">Home</a>
				</li>
				<li class="selected">
					<a href="admin.jsp?label=userview&sta=noth">User View</a>
				</li>
				<li class="selected">
					<a href="admin.jsp?label=addfilter&sta=noth">Add Affective Text</a>
				</li>
				
				<li class="selected">
					<a href="admin.jsp?label=mostposted&sta=noth">Most Posted Message</a>
				</li>
				<li class="selected">
					<a href="alogout.jsp">Logout</a>
				</li>
				<li style="font-size:18px;color:blue;padding-left:50px;">
					<i>	welcome,<%=adminnames %></i>
				</li>
			</ul>
			
</div>
</div>
<div style="width:960px;height:auto;float:left; margin-top:10px;margin-bottom:10px;border:1px solid #004acc";>
<div style="width:190px;height:auto;float:left; margin-top:10px;margin-bottom:10px;border:0px solid #004acc";>


<div style="width:935px;border-radius:5px;height:auto;float:left; margin-left:10px;margin-top:10px;margin-bottom:10px;border:1px solid #004acc";>
<div style="width:220px;height:auto;float:left; margin-top:10px;margin-bottom:10px;border:0px solid #004acc";>

<div style="border-radius:5px;width:210px;height:auto;border:1px solid #004acc;margin-left:5px;margin-bottom:5px;">
<div style="border-radius:0px;width:180px;height:30px;font-size:16px;color:#FFFFFF;background-color:#004acc;border-bottom:1px solid rgb(233,204,46);padding-left:30px;padding-top:10px;margin-bottom:5px;margin-top:0px;">
Admin Catalog
</div>
<div style="border-radius:0px;width:150px;height:auto;font-size:16px;color:#004acc;background-color:#FFFFFF;border-bottom:1px solid rgb(233,204,46);padding-left:20px;padding-top:5px;padding-bottom:10px;margin-top:0px;">
User View<a href="admin.jsp?label=userview&sta=noth"><img src="images/user.png" style="width:180px;height:100px;"></img></a>
</div>
<div style="border-radius:0px;width:150px;height:auto;font-size:16px;color:#004acc;background-color:#FFFFFF;border-bottom:1px solid rgb(233,204,46);padding-left:20px;padding-top:5px;padding-bottom:10px;margin-top:0px;">
Add Affective Text<a href="admin.jsp?label=addfilter&sta=noth"><img src="images/word.png" style="width:180px;height:100px;"></img></a>
</div>
<div style="border-radius:0px;width:150px;height:auto;font-size:16px;color:#004acc;background-color:#FFFFFF;border-bottom:1px solid rgb(233,204,46);padding-left:20px;padding-top:5px;padding-bottom:10px;margin-top:0px;">
View Affective Text Performance<a href="admin.jsp?label=filterperform&sta=noth"><img src="images/filter.png" style="width:180px;height:100px;"></img></a>
</div>
<div style="border-radius:0px;width:150px;height:auto;font-size:16px;color:#004acc;background-color:#FFFFFF;border-bottom:1px solid rgb(233,204,46);padding-left:20px;padding-top:5px;padding-bottom:10px;margin-top:0px;">
Overall Affective Text Performance<a href="chart1.jsp"><img src="images/chart1.jpg" style="width:180px;height:100px;"></img></a>
</div>

<div style="border-radius:0px;width:150px;height:auto;font-size:16px;color:#004acc;background-color:#FFFFFF;border-bottom:0px solid rgb(233,204,46);padding-left:20px;padding-top:5px;padding-bottom:10px;margin-top:0px;">
<a href="alogout.jsp">Logout</a>
</div>
</div>
</div>
<% if(labels.equals("setlabel")){
	%>
	<div style="width:680px;height:auto;float:left; border-radius:5px;margin-left:10px;margin-top:10px;margin-bottom:10px;border:1px solid #004acc";>
	<%
	out.println("<br /><font size=\"5px\" color=\"green\" align=\"center\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Successfully Added</font></br /></br />");
	%></div>
	<%} %>
	
	
	
	
	
	
	
<% if(labels.equals("userview")){ 
	%>
	

<div style="width:670px;height:auto;float:left; border-radius:5px; padding-right:10px;padding-left:10px;padding-bottom:10px;padding-top:30px;margin-left:10px;margin-top:10px;margin-bottom:10px;border:1px solid #004acc";>
<%
if(status.equals("failed"))
	{
		%>
		<font color="red" size="5px";>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Already Exist</font><br /><br />
		<%
	}
	if(status.equals("success"))
	{
		%>
		<font color="green" size="5px";>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Successfully Added</font><br /><br />
		<%
	}	
	%>

<!--table start-->
<div class="admintablegenerator" ><font color="green" size="5px";>View User Details</font><br /><br />
                <table >
                    <tr>
                    <td>
                           	MEMBER ID
                        </td>
                        <td>
                           	USERNAME
                        </td>
                       
                        <td >
                            LASTNAME
                        </td>
                         <td >
                            EMAIL
                        </td>
                        <td >
                            Date-of-Birth
                        </td>
                       
                        <td >
                            REGDATE
                        </td>
                        
                        
                        
                    </tr>
                    
                    
                    <%
                    
                    String ad11=new String("");
                    
        			String ad12=new String("");
        			String ad13=new String("");
        			String ad14=new String("");
        			String ad15=new String("");
        			String ad16=new String("");
        			String ad17=new String("");
        			String ad18=new String("");
        			String ad19=new String("");
        			ResultSet rs12;
        			Class.forName("com.mysql.jdbc.Driver");
        			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
        		    Statement st=con1.createStatement();
        		    String sql12 = "select * from register" ;
        	 		st.executeQuery (sql12);
        	 		rs12 = st.getResultSet();
        			while (rs12.next ())
        				{
        				
        					ad11=rs12.getString("Memberid");
        					ad12=rs12.getString("Firstname");
        					ad13=rs12.getString("Lastname");
        					ad14=rs12.getString("Email");
        					ad16=rs12.getString("Dob");
        					ad18=rs12.getString("Regdate");
        				
        					
        					
        				%> 
                    
                    
                    <tr>
                        <td>
                          <%=ad11%>
                        </td>
                        <td>
                          <%=ad12%>
                        </td>
                         <td>
                          <%=ad13%>
                        </td>
                         <td>
                          <%=ad14%>
                        </td>
                         
                         <td>
                          <%=ad16%>
                        </td>
                         <td>
                          <%=ad18%>
                        </td>
                        
                         
                        
                        
                        <%} %>
                    </tr>
                   
                   
                </table>
                </div>



</div>
<%} %>
<% if(labels.equals("mostposted")){ 
	%>
	

<div style="width:670px;height:auto;float:left; border-radius:5px; padding-right:10px;padding-left:10px;padding-bottom:10px;padding-top:30px;margin-left:10px;margin-top:10px;margin-bottom:10px;border:1px solid #004acc";>
<%
if(status.equals("failed"))
	{
		%>
		<font color="red" size="5px";>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Already Exist</font><br /><br />
		<%
	}
	if(status.equals("success"))
	{
		%>
		<font color="green" size="5px";>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Successfully Added</font><br /><br />
		<%
	}	
	%>

<!--table start-->
<div class="admintablegenerator" ><font color="green" size="5px";>View Message Details</font><br /><br />
                <table >
                    <tr>
                    <td>
                           	MESSAGE
                        </td>
                         <td>
                           	TYPE
                        </td>
                        <td>
                           	NUMBER OF TIMES
                        </td>
                        <td>
                           	VIEW DETAILS
                        </td>
                       
                        
                        
                        
                    </tr>
                    
                    
                    <%
                    
                    String ad111=new String("");
                    String ad112=new String("");
        			int ad121=0;
        			
        			ResultSet rs12;
        			Class.forName("com.mysql.jdbc.Driver");
        			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
        		    Statement st=con1.createStatement();
        		    String sql12 = "select * from mostposted ORDER BY reqdate DESC" ;
        	 		st.executeQuery (sql12);
        	 		rs12 = st.getResultSet();
        			while (rs12.next ())
        				{
        				
        					ad111=rs12.getString("message");
        					ad112=rs12.getString("type");
        					ad121=rs12.getInt("reqdate");
        					
        				
        					
        					
        				%> 
                    
                    
                    <tr>
                        <td>
                          <%=ad111%>
                        </td>
                        <td>
                          <%=ad112%>
                        </td>
                        <td>
                          <%=ad121%>
                        </td>
                         
                        <td>
                          <a href="userpost.jsp?sid=<%=ad111 %>">View Posted user details</a>
                        </td>
                         
                        
                        
                        <%} %>
                    </tr>
                   
                   
                </table>
                </div>
<%
  if(status.equals("display"))
	                {
	  String sid=request.getParameter("sid");
	  System.out.println(sid);
	                %>
	                	<div class="admintablegenerator" ><font color="green" size="5px";>View User Post Details</font><br /><br />
                <table >
                    <tr>
                    <td>
                           	MESSAGE
                        </td>
                         <td>
                           	USER E-MAIL ID
                        </td>
                        <td>
                           	NUMBER OF TIMES
                        </td>
                        
                       
                        
                        
                        
                    </tr>
                    
                    
                    <%
                    
                    String ad1111=new String("");
                    String ad1121=new String("");
        			int ad1211=0;
        			
        			ResultSet rs121;
        			Class.forName("com.mysql.jdbc.Driver");
        			Connection con11=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
        		    Statement st11=con11.createStatement();
        		   
        		    String sql121 = "select * from mostposteduser" ;
        	 		st11.executeQuery (sql121);
        	 		 System.out.println(sid+"  hai");
        	 		rs121 = st11.getResultSet();
        			while (rs121.next ())
        				{
        				
        					ad1111=rs121.getString("message");
        					ad1121=rs121.getString("user");
        					ad1211=rs121.getInt("reqdate");
        					
        					 System.out.println(ad1111);
        					
        					
        				%> 
                    
                    
                    <tr>
                        <td>
                          <%=ad1111%>
                        </td>
                        <td>
                          <%=ad1121%>
                        </td>
                        <td>
                          <%=ad1211%>
                        </td>
                         
                      
                         
                        
                        
                        <%} %>
                    </tr>
                   
                   
                </table>
                </div>
	                <% } else {
	                	%>
	                <% } %>


</div>
<%} %>





<% if(labels.equals("addfilter")){ 
	%>

<div style="width:590px;height:auto;float:left; border-radius:5px;margin-left:10px;padding-left:100px;padding-top:30px;margin-top:10px;margin-bottom:10px;border:1px solid #004acc";>
<%
if(status.equals("failed"))
	{
		%>
		<font color="red" size="5px";>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Process Failed</font><br /><br />
		<%
	}
if(status.equals("failed1"))
{
	%>
	<font color="red" size="5px";>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Already Available This Keyword</font><br /><br />
	<%
}
	if(status.equals("success"))
	{
		%>
		<font color="green" size="5px";>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Successfully Added</font><br /><br />
		<%
	}	
	%>
<form  class="snform" name="profileimage-form" id="profileimage-form" method="post"  action="addfilterword">

 
  
                      <table width="450" height="221" align="center">
                        <tr>
                          <td width="450" height="128" bgcolor="#ffffff">
                          <table width="350" height="126">
                            <tr>
                              <td width="99" align="left" valign="middle"></td>
                              <td width="200" align="left" valign="middle"><label>
                              
                              </label></td>
                            </tr>
                             <tr>
                              <td align="left" valign="middle"><h5>Add Keyword:*</h5></td>
                              <td align="left" valign="middle"><label>
                                <input name="keyword" class="stext bgm" type="text" id="keyword" style="width:300px" />
                              </label></td>
                            </tr>
                             <tr>
                              <td align="left" valign="middle"><h5>Catagory:*</h5></td>
                              <td align="left" valign="middle"><label>
                                <select name="cat" class="stext bgm"  id="cat" style="width:300px;padding:5px;">
                                <option value="">-Category-</option>
                                <option value="Vulgar">Vulgar</option>
                                <option value="Violence">Violence</option>
                                <option value="Hate">Hate</option>
                                <option value="Offensive">Offensive</option>
                                
                                </select>
                                
                              </label></td>
                            </tr>
                       
                            
                         
                            
                           
                          </table></td>
                        </tr>
                        <tr>
                          <td height="26" align="center" valign="middle">&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="32" align="center" valign="middle"><label>
                           <button class="search_btn">Add Keyword</button>
                          </label></td>
                        </tr>
                        <tr>
                          <td height="21" align="center" valign="middle">&nbsp;</td>
                        </tr>
                      </table>
                </form>

</div>
<%} %>

<% if(labels.equals("filterperform")){ 
	%>


<div style="width:670px;height:auto;float:left; border-radius:5px; padding-right:10px;padding-left:10px;padding-bottom:10px;padding-top:30px;margin-left:10px;margin-top:10px;margin-bottom:10px;border:1px solid #004acc";>


<!--table start-->
<div class="admintablegenerator" ><font color="green" size="5px";>View Filter Performance</font><br /><br />
                <table >
                    <tr>
                    <td>
                           	MEMBER ID
                        </td>
                       
                        
                         <td >
                            VIOLENCE      
                        </td>
                        <td >
                           VULGAR
                        </td>
                          <td >
                           OFFENSIVE
                        </td>
                          <td >
                           HATE
                        </td>
                          <td >
                           TOTAL
                        </td>
                       
                        <td >
                            ACTION
                        </td>
                        
                        
                        
                    </tr>
                    
                    
                    <%
                    
                    String ad11=new String("");
                    
        			String ad12=new String("");
        			String ad13=new String("");
        			String ad14=new String("");
        			String ad15=new String("");
        			String ad16=new String("");
        			String ad17=new String("");
        			String ad18=new String("");
        			String ad19=new String("");
        			String ad20=new String("");
        			ResultSet rs12;
        			Class.forName("com.mysql.jdbc.Driver");
        			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
        		    Statement st=con1.createStatement();
        		    String sql12 = "select * from finalreport" ;
        	 		st.executeQuery (sql12);
        	 		rs12 = st.getResultSet();
        			while (rs12.next ())
        				{
        				
        					
        				
        					ad11=rs12.getString(1);//memberid
        					ad12=rs12.getString(2);//Violence
        					ad13=rs12.getString(3);//Vulgar
        					ad14=rs12.getString(4);//Offensive
        					ad15=rs12.getString(5);//Hate
        					ad16=rs12.getString(6);//totalcount
        					
        					
        					
        				%> 
                    
                    
                    <tr>
                        <td>
                          <%=ad11%>
                        </td>
                        <td>
                          <%=ad12%>
                        </td>
                         <td>
                          <%=ad13%>
                        </td>
                         <td>
                          <%=ad14%>
                        </td>
                         
                         <td>
                          <%=ad15%>
                        </td>
                         <td>
                          <%=ad16%>
                        </td>
                        
                         <td>
                       <a href="chart.jsp?sid=<%=ad11 %>">Report</a>
                        </td>
                        
                         
                        
                        
                        <%} %>
                    </tr>
                   
                   
                </table>
                </div>

<%
  if(status.equals("display"))
	                {
	  String sid=request.getParameter("sid");
	                %>
	                	<div style="width:635px;float:left;align:center;height:auto;background-color:#000000;margin-left:0px;margin-top:20px;padding-top:30px;padding-bottom:30px;padding-left:20px;border:1px solid #ffffff;">
<img src="chart/<%=sid %>.png" width="300px" height="300px;"></img>
</div>
	                <% } else {
	                	%>
	                <% } %>


</div>


<%} %>

<% if(labels.equals("ofilterperform")){ 
	%>


<div style="width:670px;height:auto;float:left; border-radius:5px; padding-right:10px;padding-left:10px;padding-bottom:10px;padding-top:30px;margin-left:10px;margin-top:10px;margin-bottom:10px;border:1px solid #004acc";>
<%
  if(status.equals("display"))
	                {
	  String sid=request.getParameter("sid");
	                %>
	                	<div style="width:635px;float:left;align:center;height:auto;background-color:#000000;margin-left:0px;margin-top:20px;padding-top:30px;padding-bottom:30px;padding-left:20px;border:1px solid #ffffff;">
<img src="overall/overall.png" width="300px" height="300px;"></img>
</div>
	                <% } else {
	                	%>
	                <% } %>
</div>
<% } %>

<div style="width:160px;height:300px;float:right; margin-top:10px; margin-right:5px;margin-bottom:10px;border:0px solid #004acc";>



</div>
</div>








</div>











</div>

<div style="width:960px;height:100px;float:left; border:0px solid #004acc;background-color:#004acc";>
<div class="footer1_rev_3x1"><div style="font-size:12px;padding-left:380px;">Copyright &#169; 2019  All rights reserved.</div></div>
</div>



</div>
</div>
</body>
</html>