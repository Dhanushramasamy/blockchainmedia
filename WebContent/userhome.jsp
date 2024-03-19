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



				Object memberids=session.getAttribute("Memberid");
				String memberid=memberids.toString();
				Object memberemails=session.getAttribute("Memberemail");
				String memberemail=memberemails.toString();
				Object membernames=session.getAttribute("Membername");
				String membername=membernames.toString();
				Object memberstatuss=session.getAttribute("Memberstatus");
				String memberstatus=memberstatuss.toString();
				
				String labels=request.getParameter("labels");
				
				
				
				%>
				 
<div style="width:960px;height:auto;padding:0 auto;margin:0 auto; border:0px solid #000000";>
<div style="width:960px;height:auto;float:left; border:0px solid #000000";>
<img src="images/title.png">
<div style="width:960px;height:150px;float:left; border:0px solid #000000;">






</div>
<div style="width:960px;height:auto;float:left; border:0px solid #000000";>
<div style="width:960px;height:40px;border:1px solid rgb(233,204,46);padding:0 auto;margin:0 auto;margin-top:10px;">
<ul id="navigation">
				<li >
					<a href="index.jsp">Home</a>
				</li>
				<li class="selected">
					<a href="userhome.jsp?labels=recentpost&words=occur&res=noth">Recent Post</a>
				</li>
				<li >
					<a href="userhome.jsp?labels=view">Your Profile</a>
				</li>
				<li>
					<a href="logout.jsp">Logout</a>
				</li>
				<li style="font-size:18px;color:blue;padding-left:50px;">
					<i>Welcome,<%=membernames %>,<%=memberstatuss %></i>
				</li>
			</ul>
			
</div>
</div>
<div style="width:960px;height:auto;float:left; margin-top:10px;margin-bottom:10px;border:1px solid #eaef15";>
<div style="width:190px;height:auto;float:left; margin-top:10px;margin-bottom:10px;border:0px solid #eaef15";>


<div style="border-radius:5px;width:180px;height:180px;border:1px solid rgb(233,204,46);margin-left:5px;margin-top:00px;margin-bottom:5px;">

<%
java.sql.Connection con;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "wordfilter";
String driver = "com.mysql.jdbc.Driver";
String userName = "root"; 
String password = "root";
String ad14=new String("");
String ad11=new String("");
String ad12=new String("");
String ad13=new String("");
String ad15=new String("");
String ad16=new String("");
String ad17=new String("");
String ad13a=new String("");

Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(url+dbName,userName,password);
Statement st = con.createStatement();
ResultSet rs=null;
ResultSet rse=null;
try
{
 
rs=st.executeQuery("select * from register where Memberid='"+memberid+"'");
 
while(rs.next())
{
	ad11=rs.getString("Firstname");
	ad12=rs.getString("Lastname");
	ad13=rs.getString("Dob");
	ad13a=rs.getString("Gender");
	ad14=rs.getString("imagename");
	ad15=rs.getString("City");
	ad16=rs.getString("Iam");
	ad17=rs.getString("Working");

//System.out.println(ad14);

}
if(ad14.equals("balaji"))
{
	%>
	<a href="profileimage.jsp?mid=<%=memberid %>"><img src="images/human.png" style=width:170px;padding:5px;height:170px;" ></img></a>
	<%
}
else{
%>
<a href="profileimage.jsp?mid=<%=memberid %>"><img src=profileimage/<%=ad14 %> style=width:170px;padding:5px;height:170px;" ></img></a>
<%
}
}
catch(Exception e)
{
out.print(""+e.getMessage());
}
%>


</div>
<div style="border-radius:5px;width:180px;height:auto;border:1px solid rgb(233,204,46);margin-left:5px;margin-bottom:5px;">
<div style="border-radius:0px;width:150px;height:30px;font-size:16px;color:#FFFFFF;background-color:#004acc;border-bottom:1px solid rgb(233,204,46);padding-left:30px;padding-top:10px;margin-bottom:5px;margin-top:0px;">
Friends Catalog
</div>
<div style="border-radius:0px;width:150px;height:auto;font-size:16px;color:#2a2a2a;background-color:#FFFFFF;border-bottom:1px solid rgb(233,204,46);padding-left:20px;padding-top:5px;padding-bottom:10px;margin-top:0px;">
<a href="userhome.jsp?labels=friendslist">Friends</a>
</div>
<div style="border-radius:0px;width:150px;height:auto;font-size:16px;color:#2a2a2a;background-color:#FFFFFF;border-bottom:1px solid rgb(233,204,46);padding-left:20px;padding-top:5px;padding-bottom:10px;margin-top:0px;">
<a href="userhome.jsp?labels=requestedfriends&sekey=noth">Request from Friends</a>
</div>
<div style="border-radius:0px;width:150px;height:auto;font-size:16px;color:#2a2a2a;background-color:#FFFFFF;border-bottom:0px solid rgb(233,204,46);padding-left:20px;padding-top:5px;padding-bottom:10px;margin-top:0px;">
<a href="userhome.jsp?labels=findfriends">Find Friends</a>
</div>

</div>

<div style="border-radius:5px;width:180px;height:auto;border:1px solid rgb(233,204,46);margin-left:5px;margin-bottom:5px;">

<div style="border-radius:0px;width:150px;height:30px;font-size:16px;color:#FFFFFF;background-color:#004acc;border-bottom:1px solid rgb(233,204,46);padding-left:30px;padding-top:10px;margin-bottom:5px;margin-top:0px;">
Add Interests
</div>
<div style="border-radius:0px;width:150px;height:auto;font-size:16px;color:#2a2a2a;background-color:#FFFFFF;border-bottom:1px solid rgb(233,204,46);padding-left:20px;padding-top:5px;padding-bottom:10px;margin-top:0px;">
<a href="userhome.jsp?labels=games&stat=noth">Games</a>
</div>
<div style="border-radius:0px;width:150px;height:auto;font-size:16px;color:#2a2a2a;background-color:#FFFFFF;border-bottom:0px solid rgb(233,204,46);padding-left:20px;padding-top:5px;padding-bottom:10px;margin-top:0px;">
<a href="userhome.jsp?labels=movies&stat=noth">Movies</a>
</div>




</div>






</div>
<div style="width:490px;height:auto;float:left; margin-left:10px;margin-top:10px;margin-bottom:10px;border:1px solid #eaef15";>
<div style="width:450px;height:auto;float:left; margin-left:20px;margin-top:00px;margin-bottom:10px;border-bottom:1px solid #eaef15";>
<font color="#00006f" size="5px"><i><%=ad11+" "+ad12 %></i></font><br/>
<font color="#2a2a2a" size="3px">Studied / Worked at &nbsp;:&nbsp;</font><font color="#004acc" size="4px"><i><%=ad17 %></i></font><br/>
<font color="#2a2a2a" size="3px">Lives in &nbsp;:&nbsp;</font><font color="#004acc" size="4px"><i><%=ad15 %></i></font><br/>

<%
try
{
	int counttt=0;
rse=st.executeQuery("select * from enteruser where Memberid='"+memberid+"'");
 
while(rse.next())
{
	 counttt=rse.getInt("counte");
	

//System.out.println(counttt);

}%>
<div style="float:right;"><font color="#2a2a2a" size="4px">Number Of Visited : </font><font color="#004acc" size="5px"> <i><%=counttt %></i></font></div><br/>
<%}
catch(Exception e)
{
out.print(""+e.getMessage());
}
%>
</div>





<% if(labels.equals("recentpost")){ 
	
	String words=request.getParameter("words");
	String res=request.getParameter("res");
	%>
	<div style="width:165px;height:auto;float:left; margin-left:150px;margin-top:00px;margin-bottom:10px;border-bottom:1px solid #eaef15";>
<font color="#004acc" size="6px">Recent Posts</font><br/>
</div>


<%

	

	
	java.sql.Connection conre;
	String urlre = "jdbc:mysql://localhost:3306/";
	String dbNamere = "wordfilter";
	String driverre = "com.mysql.jdbc.Driver";
	String userNamere = "root"; 
	String passwordre = "root";
	String ad14re=new String("");
	String ad15re=new String("");
	String ad11re=new String("");
	String ad12re=new String("");
	String ad13re=new String("");
	String ad13are=new String("");
	String ad15rel=new String("");
	String ad11rev=new String("");
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(urlre+dbNamere,userNamere,passwordre);
	Statement stre = con.createStatement();
	ResultSet rsre=null;
	ResultSet rsre1=null;
	
	
		
	rsre=stre.executeQuery("SELECT DISTINCT (Postid),Memberid,Firstname,imagename,Regdate,viewtype,likes FROM viewpost where viewid='"+memberid+"'   UNION (select DISTINCT (Postid),Memberid,Firstname,imagename,Regdate,viewtype,likes from newpost where Memberid='"+memberid+"' ) order by Postid desc");
	
	 
	while(rsre.next())
	{
		ad11re=rsre.getString("Postid");
		ad12re=rsre.getString("Memberid");
		ad13re=rsre.getString("Firstname");
		ad13are=rsre.getString("imagename");
		ad14re=rsre.getString("Regdate");
		ad15re=rsre.getString("viewtype");
		ad15rel=rsre.getString("likes");


%>
<!----recent post image div>-->

<div style="width:440px;height:auto;float:left; margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#000000" size="3px"></font><font color="#000000">Posted by :&nbsp;&nbsp;</font><font color="gray"><i><%=ad13re%></i>&nbsp;&nbsp;|&nbsp;&nbsp;</font><font color="maroon"> <i><%=ad15re%></i></font><br/>
</div>
<div style="width:400px;height:auto;float:left; margin-left:20px;padding-left:50px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<img src="postimage/<%=ad13are%>" style="width:350px;height:350px;"></img>
</div>
<div style="width:440px;height:auto;float:left; margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#000000" size="3px">Posted Date :&nbsp;&nbsp;</font><font color="gray"><i><%=ad14re%></i></font> | <a href='likeimage.jsp?postid=<%=ad11re%>'><i>Like</i>&nbsp;:&nbsp;</a>(<%=ad15rel %>)<a href="#"><i>Image Owner</i>&nbsp;:&nbsp;</a>(<%=ad12re%>)<br/>
</div>
<!----recent post image div>-->

<%
String ad11scimg=new String("");
String ad11scmsg=new String("");
ResultSet rs12cimg=null;
ResultSet rsana=null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection connucimg=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
	Statement s12ucimg = connucimg.createStatement();
	String sql12cimg= "select * from imgcomments where Postid='"+ad11re+"' order by Regdate desc";
	s12ucimg.executeQuery (sql12cimg);
	rs12cimg = s12ucimg.getResultSet();
	while (rs12cimg.next ())
	{
		ad11scimg=rs12cimg.getString("Memberid");
		ad11scmsg=rs12cimg.getString("msg");
	
		
%>


<%
String ad11sc=new String("");
String ad12sc=new String("");
String ad12s1c=new String("");
String ad13sc=new String("");
String ad14sc=new String("");
String ad15sc=new String("");
String ad16sc=new String("");
String anamoname=new String("");
ResultSet rs12c=null;
try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection connuc=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
			Statement s12uc = connuc.createStatement();
			String sql12c= "select * from register Where Memberid='"+ad11scimg+"'";
			s12uc.executeQuery (sql12c);
			rs12c = s12uc.getResultSet();
			while (rs12c.next ())
			{
				ad11sc=rs12c.getString("Memberid");
				
				ad12sc=rs12c.getString("Firstname");
				
				ad12s1c=rs12c.getString("Lastname");
				ad13sc=rs12c.getString("Email");
				ad14sc=rs12c.getString("Password");
				ad16sc=rs12c.getString("Gender");
				ad15sc=rs12c.getString("imagename");
				//System.out.println(ad15sc);
	%>
<!----searching output start>-->
<div style="width:440px;height:auto;float:left; margin-left:20px;margin-top:10px;margin-bottom:10px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<div style="width:80px;height:auto;float:left; margin-left:10px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>



<% if(ad15sc.equals("balaji"))
{
	%>
	<a href="userhome.jsp?labels=otherview&friendid=<%=ad11sc %>" title="Click Here to View Your Friends Information"><img src="images/human.png" style=width:70px;height:70px;" ></img></a>
	<%
}
else{
%>
<a href="userhome.jsp?labels=otherview&friendid=<%=ad11sc %>" title="Click Here to View Your Friends Information"><img src=profileimage/<%=ad15sc %> style=width:70px;height:70px;" ></img></a>
<%
}%>

</div>
<div style="width:280px;height:auto;float:right;font-size:18px;color:#004acc; margin-top:5px;padding-right:30px;padding-top:5px;padding-bottom:10px;border:0px solid #004acc";>
<%=ad12sc %>&nbsp;&nbsp;<%=ad12s1c %>
<br/>
<div style="width:200px;height:auto;float:left;">
<font color="gray"><%=ad11scmsg %></font>
</div>


</div>

</div>
<%			}
}
catch(Exception ex1){
ex1.printStackTrace();
}
			
// if close 

			
			
			
			
		
	}
}
catch(Exception ex1){
ex1.printStackTrace();
}
	
		%>



<!----Comments start>-->

<div id=<%=ad11re%> style="width:440px;height:auto;float:left; margin-left:20px; margin-bottom:10px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<form name="fourth" class="snform" id="search-form" action="postcomments" style="margin-right:20px;" method="post" >
<input type="hidden" style="display:none; width:1px;height:1px" name="poid" id="poid" value=<%=ad11re%> readonly><br />
<input type="hidden" style="display:none; width:1px;height:1px" name="memid" id="memid" value=<%=memberid%> readonly><br />
<label style="font-size:20px;color:#004acc;">Write Your Comments About this Posted image</label>
<textarea style="padding-left:5px;margin-top:10px;margin-left:10px;" class="mtexta bgm" id="msg" name="msg" value="" placeholder = ""></textarea><br />
<div style="padding-left:200px;align:left";>
<button class="search_btn">Post</button>
</div>
</form>

<% if(words.equals("ava") && res.equals(ad11re))
	{
	String gsnor2="";
	String gsnor1="";
	String gsnor3="";
	String gsnor4="";
	String gsnor5="";
	String gsnor6="";
	String gsnor7="";
	String gsnor8="";
	String gsnor9="";
	int gsno5=0;
	try
	{
	 Class.forName("com.mysql.jdbc.Driver");
		Connection con7 = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
Statement st7=con7.createStatement();

	//ResultSet rs7=st7.executeQuery("select Top 1 * from classification where imageid='"+ad11re+"' and memberid='"+memberids+"' order by reportid1 desc");
	ResultSet rs7=st7.executeQuery("select * from classification where imageid='"+ad11re+"' and memberid='"+memberids+"' ");
	while(rs7.next())
	  {
		 gsno5=rs7.getInt(1);//reportid
		  gsnor1=rs7.getString(2);//reportid1
		  gsnor2=rs7.getString(3);//imageid
		  gsnor3=rs7.getString(4);//memberid
		  gsnor4=rs7.getString(5);//message
		  gsnor5=rs7.getString(6);//Violence
		  gsnor6=rs7.getString(7);//Vulgar
		  gsnor7=rs7.getString(8);//Offensive
		  gsnor8=rs7.getString(9);//Hate
	  }
	}
	catch(Exception ex)
	{
		
	}
	
	%>
	<div style="width:400px;height:auto;border:0px solid rgb(233,204,46);background:#2EECD1;color:#D8000C;font-size:19px;padding-top:10px;padding-bottom:3px;padding-left:20px; auto;margin-right:0px;margin-top:0px;">
<form name="fourth" class="snform" id="search-form" action="postcomments" style="margin-right:20px;" method="post">

<label style="font-size:14px;color:#004acc;">Your Comments Can't be posted because it was Affective Text !</label><br />
<label style="font-size:14px;color:#000000;">Your Comments : </label><label style="font-size:14px;color:#dc4614;"><i><%=gsnor4 %></i></label><br />
<label style="font-size:14px;color:#000000;">Violence &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=</label><label style="font-size:14px;color:maroon;"><i><%=gsnor5 %></i></label><br />
<label style="font-size:14px;color:#000000;">Vulgar   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=</label><label style="font-size:14px;color:maroon;"><i><%=gsnor6 %></i></label><br />
<label style="font-size:14px;color:#000000;">Offensive&nbsp;&nbsp;&nbsp;&nbsp;=</label><label style="font-size:14px;color:maroon;"><i><%=gsnor7 %></i></label><br />
<label style="font-size:14px;color:#000000;">Hate     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=</label><label style="font-size:14px;color:maroon;"><i><%=gsnor8 %></i></label><br />



</form>
</div>
<% } %>
</div>

<%
	
	}//while1		
	
	}
	 %>
	 
	 <% if(labels.equals("yourpost")){ 
		 %><div style="width:165px;height:auto;float:left; margin-left:150px;margin-top:00px;margin-bottom:10px;border-bottom:1px solid #eaef15";>
<font color="#004acc" size="6px">Your Posts</font><br/>
</div><% 
	java.sql.Connection conre;
	String urlre = "jdbc:mysql://localhost:3306/";
	String dbNamere = "wordfilter";
	String driverre = "com.mysql.jdbc.Driver";
	String userNamere = "root"; 
	String passwordre = "root";
	String ad14re=new String("");
	String ad15re=new String("");
	String ad11re=new String("");
	String ad12re=new String("");
	String ad13re=new String("");
	String ad13are=new String("");
	String ad15rel=new String("");

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(urlre+dbNamere,userNamere,passwordre);
	Statement stre = con.createStatement();
	ResultSet rsre=null;
	try
	{
	 
	rsre=stre.executeQuery("select * from newpost where Memberid='"+memberid+"' order by Postid desc");
	 
	while(rsre.next())
	{
		ad11re=rsre.getString("Postid");
		ad12re=rsre.getString("Memberid");
		ad13re=rsre.getString("Firstname");
		ad13are=rsre.getString("imagename");
		ad14re=rsre.getString("Regdate");
		ad15re=rsre.getString("viewtype");
		ad15rel=rsre.getString("likes");

%>
<!----recent post image div>-->

<div style="width:440px;height:auto;float:left; margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#000000" size="3px"></font><font color="#000000">Posted by :&nbsp;&nbsp;</font><font color="gray"><i><%=ad13re%></i>&nbsp;&nbsp;|&nbsp;&nbsp;</font><font color="maroon"> <i><%=ad15re%></i></font><br/>
</div>
<div style="width:400px;height:auto;float:left; margin-left:20px;padding-left:50px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<img src="postimage/<%=ad13are%>" style="width:350px;height:350px;"></img>
</div>
<div style="width:440px;height:auto;float:left; margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#000000" size="3px">Posted Date :&nbsp;&nbsp;</font><font color="gray"><i><%=ad14re%></i></font>|<a href="#"><i>Like</i>&nbsp;:&nbsp;</a>(<%=ad15rel%>) <a href="#"><i>Image Owner</i>&nbsp;:&nbsp;</a>(<%=ad12re%>)<br/>
</div>
<!----recent post image div>-->
<%
	}
	}
	catch(Exception e)
	{
	out.print(""+e.getMessage());
	}
	//comment start
	
	
	String ad11scimg=new String("");
	String ad11scmsg=new String("");
	ResultSet rs12cimg=null;
	ResultSet rsana=null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection connucimg=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
		Statement s12ucimg = connucimg.createStatement();
		String sql12cimg= "select * from imgcomments where Postid='"+ad11re+"' order by Regdate desc";
		s12ucimg.executeQuery (sql12cimg);
		rs12cimg = s12ucimg.getResultSet();
		while (rs12cimg.next ())
		{
			ad11scimg=rs12cimg.getString("Memberid");
			ad11scmsg=rs12cimg.getString("msg");


		/*	String ana=new String("");
			try {
				Class.forName("com.mysql.jdbc.Driver");
				java.sql.Connection anaa=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
				Statement sanna = anaa.createStatement();
				String sqlana= "select * from anonymity Where Memberid='"+ad11scimg+"'";
				sanna.executeQuery (sqlana);
				rsana = sanna.getResultSet();
				while (rsana.next ())
				{
					ana=rsana.getString("activeid");
					System.out.println("ActiveID:"+ana);
				}
			}
			catch(Exception ex1){
			ex1.printStackTrace();
			}*/
	%>


	<%
	String ad11sc=new String("");
	String ad12sc=new String("");
	String ad12s1c=new String("");
	String ad13sc=new String("");
	String ad14sc=new String("");
	String ad15sc=new String("");
	String ad16sc=new String("");
	ResultSet rs12c=null;
	try {
				Class.forName("com.mysql.jdbc.Driver");
				java.sql.Connection connuc=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
				Statement s12uc = connuc.createStatement();
				String sql12c= "select * from register Where Memberid='"+ad11scimg+"'";
				s12uc.executeQuery (sql12c);
				rs12c = s12uc.getResultSet();
				while (rs12c.next ())
				{
					ad11sc=rs12c.getString("Memberid");
					ad12sc=rs12c.getString("Firstname");
					ad12s1c=rs12c.getString("Lastname");
					ad13sc=rs12c.getString("Email");
					ad14sc=rs12c.getString("Password");
					ad16sc=rs12c.getString("Gender");
					ad15sc=rs12c.getString("imagename");
					//System.out.println(ad15sc);
		%>
	<!----searching output start>-->
	<div style="width:440px;height:auto;float:left; margin-left:20px;margin-top:10px;margin-bottom:10px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
	<div style="width:80px;height:auto;float:left; margin-left:10px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>



	<% if(ad15sc.equals("balaji"))
	{
		%>
		<a href="userhome.jsp?labels=otherview&friendid=<%=ad11sc %>" title="Click Here to View Your Friends Information"><img src="images/human.png" style=width:70px;height:70px;" ></img></a>
		<%
	}
	else{
	%>
	<a href="userhome.jsp?labels=otherview&friendid=<%=ad11sc %>" title="Click Here to View Your Friends Information"><img src=profileimage/<%=ad15sc %> style=width:70px;height:70px;" ></img></a>
	<%
	}%>

	</div>
	<div style="width:280px;height:auto;float:right;font-size:18px;color:#004acc; margin-top:5px;padding-right:30px;padding-top:5px;padding-bottom:10px;border:0px solid #004acc";>
	<%=ad12sc %>&nbsp;&nbsp;<%=ad12s1c %>
	<br/>
	<div style="width:200px;height:auto;float:left;">
	<font color="gray"><%=ad11scmsg %></font>
	</div>


	</div>

	</div>
	<%			}
	}
	catch(Exception ex1){
	ex1.printStackTrace();
	}
				}
				}
			catch(Exception ex1){
			ex1.printStackTrace();
			}
			//---------comment show
	
	
	
	}
	 %>

<% if(labels.equals("findfriends")){ %>
<!----find friends start>-->
<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#ffffff" size="5px">Find Your Friends</font><br/>
</div>
<div style="width:440px;height:auto;float:left; margin-left:20px;margin-bottom:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<form name="fourth" class="snform" id="search-form" action="userhome.jsp?labels=findfriends" method="post">
<label style="font-size:20px;color:#004acc;">Search Your Friends</label>
<input type="text" style="padding-left:5px;margin-top:10px;margin-left:10px;" class="stext bgm" id="sfriends" name="sfriends" value="" placeholder = "Eg: balaji, balaji@gmail.com"/><br />
<div style="padding-left:200px;align:left";>
<button class="search_btn">Search</button>
</div>
</form>
</div>
<!----find friends end>-->
<%
ResultSet rs12;
String ad12s=new String("");
String ad12s1=new String("");
String ad11s=new String("");
String ad13s=new String("");
String ad14s=new String("");
String ad15s=new String("");
String ad16s=new String("");
String t1=request.getParameter("sfriends");
try {
	 Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection conn12=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
		Statement s12 = conn12.createStatement();
		String sql12 = "select * from register where Firstname LIKE '%"+t1+"%' || Email LIKE '%"+t1+"' ";
		s12.executeQuery (sql12);
		rs12 = s12.getResultSet();
		while (rs12.next ())
			{
				ad11s=rs12.getString("Memberid");
				ad12s=rs12.getString("Firstname");
				ad12s1=rs12.getString("Lastname");
				ad13s=rs12.getString("Email");
				ad14s=rs12.getString("Password");
				ad16s=rs12.getString("Gender");
				ad15s=rs12.getString("imagename");
				//System.out.println(ad15s);
				
if(ad11s.equals(memberid))
{
	
}
else{
				%>
<!----searching output start>-->

<div style="width:350px;height:auto;float:left; margin-bottom:10px;margin-left:60px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<div style="width:80px;height:auto;float:left; margin-left:10px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>



<% if(ad15s.equals("balaji"))
{
	%>
	<a href="userhome.jsp?labels=preventinfo&friendid=<%=ad11s %>" title="Click Here to View Your Friends Information"><img src="images/human.png" style=width:70px;height:70px;" ></img></a>
	<%
}
else{
%>
<a href="userhome.jsp?labels=preventinfo&friendid=<%=ad11s %>" title="Click Here to View Your Friends Information"><img src=profileimage/<%=ad15s %> style=width:70px;height:70px;" ></img></a>
<%
}%>

</div>
<div style="width:200px;height:auto;float:right;font-size:18px;color:#004acc; margin-top:5px;padding-right:30px;padding-top:5px;padding-bottom:10px;border:0px solid #004acc";>
<%=ad12s %>&nbsp;&nbsp;<%=ad12s1 %>
<br/>
<div style="width:200px;height:auto;">
<font color="gray"><%=ad16s %></font>
</div>

<form name="fourth" class="snform" id="search-form" action="requestfriend" method="post">
<input type="hidden" style="display:none; width:1px;height:1px" name="frid" id="frid" value=<%=ad11s%> readonly><br />
<input type="hidden" style="display:none; width:1px;height:1px" name="memid" id="memid" value=<%=memberid%> readonly><br />
<div style="padding-left:0px;align:left";>
<button class="request_btn">Send Request</button>
</div>
</form>

</div>

</div>
<!----searching output end>-->
<%			
}//else close
}
}
catch(Exception ex1){
ex1.printStackTrace();
}
%>
<%} %>


<!----request from friends start>-->

<%

if(labels.equals("requestedfriends") ){ %>

<%
String sekey=request.getParameter("sekey");

if(sekey.equals("send"))
{%>
	<div style="width:430px;height:40px;float:left;padding-left:20px;padding-top:10px;margin-left:20px;border:0px solid rgb(233,204,46);background:#DFF2BF;color:green;font-size:18px;">
&nbsp;Activated.</div>	
<%}%>
<%
if(sekey.equals("failed"))
{%>
	<div style="width:430px;height:40px;float:left;padding-left:20px;padding-top:10px;margin-left:20px;border:0px solid rgb(233,204,46);background:#DFF2BF;color:red;font-size:18px;">
&nbsp;Process Failed</div>	
<%}%>

<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-left:20px;margin-bottom:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#ffffff" size="5px">View Request</font><br/>





</div>

<%



ResultSet rs12;
ResultSet rs12s;
String ad12s=new String("");
String ad12s1=new String("");
String ad11s=new String("");
String ad13s=new String("");
String ad14s=new String("");
String ad15s=new String("");
String ad16s=new String("");
String ad11req=new String("");
try {
	 Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection conn12=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
		Statement s12 = conn12.createStatement();
		String sql12ss = "select * from requestfriend where requestid='"+memberid+"' && status='inactive'";
		s12.executeQuery (sql12ss);
		rs12s = s12.getResultSet();
		while (rs12s.next ())
			{
			
			ad11req=rs12s.getString("memberid");
		
			
			try {
				 Class.forName("com.mysql.jdbc.Driver");
				java.sql.Connection connu=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
				Statement s12u = connu.createStatement();
			String sql12 = "select * from register where Memberid='"+ad11req+"'";
			s12u.executeQuery (sql12);
			rs12 = s12u.getResultSet();
			while (rs12.next ())
			{
				ad11s=rs12.getString("Memberid");
				ad12s=rs12.getString("Firstname");
				ad12s1=rs12.getString("Lastname");
				ad13s=rs12.getString("Email");
				ad14s=rs12.getString("Password");
				ad16s=rs12.getString("Gender");
				ad15s=rs12.getString("imagename");
				//System.out.println(ad15s);
	%>
<!----searching output start>-->
<div style="width:440px;height:auto;float:left; margin-left:20px;margin-top:10px;margin-bottom:10px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<div style="width:80px;height:auto;float:left; margin-left:10px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>



<% if(ad15s.equals("balaji"))
{
	%>
	<a href="userhome.jsp?labels=preventinfo&friendid=<%=ad11s %>" title="Click Here to View Your Friends Information"><img src="images/human.png" style=width:70px;height:70px;" ></img></a>
	<%
}
else{
%>
<a href="userhome.jsp?labels=preventinfo&friendid=<%=ad11s %>" title="Click Here to View Your Friends Information"><img src=profileimage/<%=ad15s %> style=width:70px;height:70px;" ></img></a>
<%
}%>

</div>
<div style="width:280px;height:auto;float:right;font-size:18px;color:#004acc; margin-top:5px;padding-right:30px;padding-top:5px;padding-bottom:10px;border:0px solid #004acc";>
<%=ad12s %>&nbsp;&nbsp;<%=ad12s1 %>
<br/>
<div style="width:200px;height:auto;">
<font color="gray"><%=ad16s %></font>
</div>

			<div style="width:400px;height:auto;float:left; margin-left:20px;margin-bottom:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:0px solid #004acc";>
			<form name="fourth" style="width:150px;float:left;" class="snform" id="search-form" action="updatefriend" method="post">
			<input type="hidden" style="display:none; width:1px;height:1px" name="frid" id="frid" value=<%=memberid%> readonly><br />
			<input type="hidden" style="display:none; width:1px;height:1px" name="memid" id="memid" value=<%=ad11s%> readonly><br />
			
			<div style="padding-left:0px;align:left";>
			<button class="request_btn">Accept</button>&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			</form>
			
			<form name="fourth" style="width:150px;float:left;" class="snform" id="search-form" action="removefriend" method="post">
			<input type="hidden" style="display:none; width:1px;height:1px" name="frid" id="frid" value=<%=memberid%> readonly><br />
			<input type="hidden" style="display:none; width:1px;height:1px" name="memid" id="memid" value=<%=ad11s%> readonly><br />
			<div style="padding-left:0px;align:left";>
			<button class="request_btn">Remove</button>&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			</form>
			</div>

</div>

</div>
<!----searching output end>-->
<%			
			}
			
			
			
			
			}
		catch(Exception ex1){
		ex1.printStackTrace();
		}
			
			}
}
catch(Exception ex1){
ex1.printStackTrace();
}

//********
	
%>
<%} %>
<!----request from friends end>



<!----request from friends start>-->

<%

if(labels.equals("friendslist") ){ %>
<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-left:20px;margin-bottom:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#ffffff" size="5px">View Friends</font><br/>
</div>
<%
ResultSet rs12;
ResultSet rs12s;
String ad12s=new String("");
String ad12s1=new String("");
String ad11s=new String("");
String ad13s=new String("");
String ad14s=new String("");
String ad15s=new String("");
String ad16s=new String("");
String ad11req=new String("");
try {
	 Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection conn12=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
		Statement s12 = conn12.createStatement();
		String sql12ss = "SELECT * FROM responsefriend where requestid='"+memberid+"' && status='active' UNION ALL (select * from requestfriend where (requestid='"+memberid+"') && status='active')";
		s12.executeQuery (sql12ss);
		rs12s = s12.getResultSet();
		while (rs12s.next ())
			{
			
			ad11req=rs12s.getString("memberid");
			//System.out.println("request&response:"+ad11req);
			
			try {
				 Class.forName("com.mysql.jdbc.Driver");
				java.sql.Connection connu=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
				Statement s12u = connu.createStatement();
			String sql12 = "select * from register where Memberid='"+ad11req+"'";
			s12u.executeQuery (sql12);
			rs12 = s12u.getResultSet();
			while (rs12.next ())
			{
				ad11s=rs12.getString("Memberid");
				ad12s=rs12.getString("Firstname");
				ad12s1=rs12.getString("Lastname");
				ad13s=rs12.getString("Email");
				ad14s=rs12.getString("Password");
				ad16s=rs12.getString("Gender");
				ad15s=rs12.getString("imagename");
			//	System.out.println(ad15s);
	%>
<!----searching output start>-->
<div style="width:440px;height:auto;float:left; margin-left:20px;margin-top:10px;margin-bottom:10px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<div style="width:80px;height:auto;float:left; margin-left:10px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>



<% if(ad15s.equals("balaji"))
{
	%>
	<a href="userhome.jsp?labels=otherview&friendid=<%=ad11s %>" title="Click Here to View Your Friends Information"><img src="images/human.png" style=width:70px;height:70px;" ></img></a>
	<%
}
else{
%>
<a href="userhome.jsp?labels=otherview&friendid=<%=ad11s %>" title="Click Here to View Your Friends Information"><img src=profileimage/<%=ad15s %> style=width:70px;height:70px;" ></img></a>
<%
}%>

</div>
<div style="width:280px;height:auto;float:right;font-size:18px;color:#004acc; margin-top:5px;padding-right:30px;padding-top:5px;padding-bottom:10px;border:0px solid #004acc";>
<%=ad12s %>&nbsp;&nbsp;<%=ad12s1 %>
<br/>
<div style="width:200px;height:auto;">
<font color="gray"><%=ad16s %></font>
</div>


</div>

</div>
<!----searching output end>-->
<%			
			}
			}
		catch(Exception ex1){
		ex1.printStackTrace();
		}
			
			}
}
catch(Exception ex1){
ex1.printStackTrace();
}
%>
<%} %>
<!----request from friends end>


<% if(labels.equals("update")){ 
	ResultSet rs12up;
	String ad11sup=new String("");
	String ad12sup=new String("");
	String ad12s1up=new String("");
	String ad13sup=new String("");
	String ad14sup=new String("");
	String ad14sup1=new String("");
	String ad14sup2=new String("");
	String ad14sup3=new String("");
	
	String ad15sup=new String("");

try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection connup=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
			Statement s12up = connup.createStatement();
			String sql12up = "select * from register where Memberid='"+memberid+"'";
			s12up.executeQuery (sql12up);
			rs12up = s12up.getResultSet();
			while (rs12up.next ())
			{
				ad11sup=rs12up.getString("Memberid");
				ad12sup=rs12up.getString("Firstname");
				ad12s1up=rs12up.getString("Lastname");
				ad13sup=rs12up.getString("Email");
				ad14sup=rs12up.getString("Dob");
				ad14sup1=rs12up.getString("City");
				ad14sup2=rs12up.getString("Iam");
				ad14sup3=rs12up.getString("Working");
				ad15sup=rs12up.getString("Gender");
			//	System.out.println(ad15sup);
	%>
<!----Your Profile start>-->
<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#ffffff" size="5px">Update Your Profile</font><br/>
</div>
<div style="width:440px;height:auto;float:left; margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<form name="second" class="snform" id="create-form" action="update" method="post">
<input type="hidden" class="stext" id="mmid" name="mmid" value=<%=ad11sup %> readonly placeholder = "Eg:Balaji"/><br />
<label class="req label">First Name</label><br />
<input type="text" class="stext" id="fname" name="fname" value="<%=ad12sup %>" placeholder = "Eg:Balaji"/><br />
<label class="req label">Last Name</label><br />
<input type="text" class="stext" id="lname" name="lname" value="<%=ad12s1up %>" placeholder = "Eg:Rajendiran"/><br />
<label class="req label">Email Id</label><br />
<input type="text" class="stext" id="email" name="email" value="<%=ad13sup %>" placeholder = "Eg:balaji@gmail.com"/><br />
<label class="req label">Date Of Birth</label><br />
<input type="text" class="stext" id="dob" name="dob" value="<%=ad14sup %>" placeholder = "Eg:05-02-1986"/><br />

<label class="req label">Location</label><br />
<input type="text" class="stext" id="city" name="city" value="<%=ad14sup1 %>" placeholder = "Eg:Chennai"/><br />

<label class="req label">I am </label><br />
<input type="text" class="stext" id="iam" name="iam" value="<%=ad14sup2 %>" placeholder = "Eg:Student or designation"/><br />

<label class="req label">Name Of School/College or Company </label><br />
<input type="text" class="stext" id="working" name="working" value="<%=ad14sup3 %>" placeholder = "Eg:Mary's or Wipro"/><br />


<label class="req label">Gender</label>&nbsp;&nbsp;&nbsp;

<% if(ad15sup.equals("Male")) { %>

 <label>
      <input type="radio" name="gender" value="Male" id="gender" checked/>
      <font color="black">Male&nbsp;&nbsp;&nbsp;</font></label>
   
    <label>
      <input type="radio" name="gender" value="Female" id="gender" />
      <font color="black">Female</font></label><br />
 <% }
else
{%>
<label>
      <input type="radio" name="gender" value="male" id="gender" />
      <font color="black">Male&nbsp;&nbsp;&nbsp;</font></label>
   
    <label>
      <input type="radio" name="gender" value="female" id="gender" checked/>
      <font color="black">Female</font></label><br />

<% }
%>
 <br/><div align="left">
  <label>
<input type="checkbox" checked="checked"  id="agree" name="agree" value="agree"/>
I Agree to the All Terms of Service and Privacy Policy.</label>

</div><br />
<div align="left">
<button class="search_btn">Update</button>
</div>

</form>
</div>
<%}
}
		catch(Exception ex1){
		ex1.printStackTrace();
		}%>
<!----Your Profile end>-->
<%} %>

<% if(labels.equals("view")){
	
	
	ResultSet rs12;
	String ad12s=new String("");
	String ad12s1=new String("");
	String ad11s=new String("");
	String ad13s=new String("");
	String ad14s=new String("");
	String ad15s=new String("");
	String ad15s1=new String("");
	String ad15s2=new String("");
	String ad15s3=new String("");
	
	String ad16s=new String("");
	String ad17s=new String("");
	String t1=request.getParameter("sfriends");
	try {
		 Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection conn12=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
			Statement s12 = conn12.createStatement();
			String sql12 = "select * from register where Memberid='"+memberid+"' ";
			s12.executeQuery (sql12);
			rs12 = s12.getResultSet();
			while (rs12.next ())
				{
					ad11s=rs12.getString("Memberid");
					ad12s=rs12.getString("Firstname");
					ad12s1=rs12.getString("Lastname");
					ad13s=rs12.getString("Email");
					ad14s=rs12.getString("Password");
					ad16s=rs12.getString("Dob");
					ad17s=rs12.getString("Gender");
					ad15s=rs12.getString("imagename");
					ad15s1=rs12.getString("City");
					ad15s2=rs12.getString("Iam");
					ad15s3=rs12.getString("Working");
					//System.out.println(ad15s);
	
	%>
<!----View Your Profile start>-->
<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-bottom:20px;margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#ffffff" size="5px">View Profile</font><br/>
</div>
<%
if(ad15s.equals("balaji"))
{
	%>
	<div style="width:160px;height:auto;float:left; margin-left:150px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:0px solid #004acc";>
	<a href="profileimage.jsp?mid=<%=memberid %>"><img src="images/human.png" style=width:170px;padding:5px;height:170px;" ></img></a>
	</div>
	<%
}
else{
%>
<div style="width:160px;height:auto;float:left; margin-left:150px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:0px solid #004acc";>
<a href="profileimage.jsp?mid=<%=memberid %>"><img src=profileimage/<%=ad15s %> style=width:170px;padding:5px;height:170px;" ></img></a>
</div>
<%
}%>

<div style="width:440px;height:auto;float:left; margin-left:20px;margin-bottom:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<label style="font-size:30px;color:#004acc;"><i>First Name:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad12s %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>Last Name:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad12s1 %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>Email ID:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad13s %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>Date-Of-Birth:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad16s %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>Lives in:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad15s1 %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>I am a:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad15s2 %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>Studied/Working at:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad15s3 %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>Gender:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad17s %></i></label><br/>
</div>


<!----View Your Profile end>-->

<%}
	}
	catch(Exception ex1){
	ex1.printStackTrace();
	}
}
%>

<% if(labels.equals("preventinfo")){
	
	
	ResultSet rs12;
	String ad12s=new String("");
	String ad12s1=new String("");
	String ad11s=new String("");
	String ad13s=new String("");
	String ad14s=new String("");
	String ad15s=new String("");
	String ad16s=new String("");
	String ad17s=new String("");
	String ad15s1=new String("");
	String ad15s2=new String("");
	String ad15s3=new String("");
	String t1=request.getParameter("friendid");
	try {
		 Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection conn12=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
			Statement s12 = conn12.createStatement();
			String sql12 = "select * from register where Memberid='"+t1+"' ";
			s12.executeQuery (sql12);
			rs12 = s12.getResultSet();
			while (rs12.next ())
				{
					ad11s=rs12.getString("Memberid");
					ad12s=rs12.getString("Firstname");
					ad12s1=rs12.getString("Lastname");
					ad13s=rs12.getString("Email");
					ad14s=rs12.getString("Password");
					ad16s=rs12.getString("Dob");
					ad17s=rs12.getString("Gender");
					ad15s=rs12.getString("imagename");
					ad15s1=rs12.getString("City");
					ad15s2=rs12.getString("Iam");
					ad15s3=rs12.getString("Working");
					//System.out.println(ad15s);
					
					ad13s = ad13s.replaceFirst("@", "**@");
	
	%>
<!----View Your Profile start>-->
<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-bottom:20px;margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#ffffff" size="5px">View Profile</font><br/>
</div>
<%
if(ad15s.equals("balaji"))
{
	%>
	<div style="width:160px;height:auto;float:left; margin-left:150px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:0px solid #004acc";>
	<a href="#"><img src="images/human.png" style=width:170px;padding:5px;height:170px;" ></img></a>
	</div>
	<%
}
else{
%>
<div style="width:160px;height:auto;float:left; margin-left:150px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:0px solid #004acc";>
<a href="#"><img src=profileimage/<%=ad15s %> style=width:170px;padding:5px;height:170px;" ></img></a>
</div>
<%
}%>

<div style="width:440px;height:auto;float:left; margin-left:20px;margin-bottom:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<label style="font-size:30px;color:#004acc;"><i>First Name:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad12s %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>Last Name:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad12s1 %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>Email ID:</i></label><label style="font-size:20px;color:#00005e;"><i><%=ad13s %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>Date-Of-Birth:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad16s %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>Lives in:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad15s1 %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>I am a:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad15s2 %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>Studied/Working at:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad15s3 %></i></label><br/>

<label style="font-size:30px;color:#004acc;"><i>Gender:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad17s %></i></label><br/>

<div style="width:400px;height:auto;float:left; margin-left:20px;margin-bottom:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:0px solid #004acc";>
			<form name="fourth" class="snform" style="width:150px;float:left;" id="search-form" action="requestfriend" method="post">
<input type="hidden" style="display:none; width:1px;height:1px" name="frid" id="frid" value=<%=ad11s%> readonly><br />
<input type="hidden" style="display:none; width:1px;height:1px" name="memid" id="memid" value=<%=memberid%> readonly><br />
<div style="padding-left:0px;align:left";>
<button class="request_btn">Accept</button>
</div>
</form>
			
			<form name="fourth" style="width:150px;float:left;" class="snform" id="search-form" action="removefriend" method="post">
			<input type="hidden" style="display:none; width:1px;height:1px" name="frid" id="frid" value=<%=memberid%> readonly><br />
			<input type="hidden" style="display:none; width:1px;height:1px" name="memid" id="memid" value=<%=ad11s%> readonly><br />
			<div style="padding-left:0px;align:left";>
			<button class="request_btn">back</button>&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			</form>
			</div>


</div>
<!----View Your Profile end>-->


<%}%>
		
	<%}
	catch(Exception ex1){
	ex1.printStackTrace();
	}
}
%>

<% if(labels.equals("otherview")){
	
	
	ResultSet rs12;
	String ad12s=new String("");
	String ad12s1=new String("");
	String ad11s=new String("");
	String ad13s=new String("");
	String ad14s=new String("");
	String ad15s=new String("");
	String ad16s=new String("");
	String ad17s=new String("");
	String ad15s1=new String("");
	String ad15s2=new String("");
	String ad15s3=new String("");
	String t1=request.getParameter("friendid");
	try {
		 Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection conn12=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
			Statement s12 = conn12.createStatement();
			String sql12 = "select * from register where Memberid='"+t1+"' ";
			s12.executeQuery (sql12);
			rs12 = s12.getResultSet();
			while (rs12.next ())
				{
					ad11s=rs12.getString("Memberid");
					ad12s=rs12.getString("Firstname");
					ad12s1=rs12.getString("Lastname");
					ad13s=rs12.getString("Email");
					ad14s=rs12.getString("Password");
					ad16s=rs12.getString("Dob");
					ad17s=rs12.getString("Gender");
					ad15s=rs12.getString("imagename");
					ad15s1=rs12.getString("City");
					ad15s2=rs12.getString("Iam");
					ad15s3=rs12.getString("Working");
					//System.out.println(ad15s);
	
	%>
<!----View Your Profile start>-->
<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-bottom:20px;margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#ffffff" size="5px">View Profile</font><br/>
</div>
<%
if(ad15s.equals("balaji"))
{
	%>
	<div style="width:160px;height:auto;float:left; margin-left:150px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:0px solid #004acc";>
	<a href="#"><img src="images/human.png" style=width:170px;padding:5px;height:170px;" ></img></a>
	</div>
	<%
}
else{
%>
<div style="width:160px;height:auto;float:left; margin-left:150px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:0px solid #004acc";>
<a href="#"><img src=profileimage/<%=ad15s %> style=width:170px;padding:5px;height:170px;" ></img></a>
</div>
<%
}%>

<div style="width:440px;height:auto;float:left; margin-left:20px;margin-bottom:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<label style="font-size:30px;color:#004acc;"><i>First Name:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad12s %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>Last Name:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad12s1 %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>Email ID:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad13s %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>Date-Of-Birth:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad16s %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>Lives in:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad15s1 %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>I am a:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad15s2 %></i></label><br/>
<label style="font-size:30px;color:#004acc;"><i>Studied/Working at:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad15s3 %></i></label><br/>

<label style="font-size:30px;color:#004acc;"><i>Gender:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad17s %></i></label><br/>
<%
ResultSet rs12s;
	String ad12ss=new String("");
	String ad12s1s=new String("");
	
	
	try {
		 Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection conn12s=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
			Statement s12s = conn12s.createStatement();
			String sql12s = "select * from movieadd where memberid='"+t1+"' ";
			s12s.executeQuery (sql12s);
			rs12s = s12s.getResultSet();
			while (rs12s.next ())
				{
				ad12ss=rs12s.getString("moviename");
			
	%>
<!----View Your Profile start>-->




<label style="font-size:30px;color:#004acc;"><i>Favourite Movies:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad12ss %></i></label><br/>

<!----View Your Profile end>-->


<%}%>
		
	<%}
	catch(Exception ex1){
	ex1.printStackTrace();
	} 
	//********
%>
<%
ResultSet rs12sv;
	String ad12ssv=new String("");
	String ad12s1sv=new String("");
	
	
	try {
		 Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection conn12sv=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
			Statement s12sv = conn12sv.createStatement();
			String sql12sv = "select * from gameadd where memberid='"+t1+"' ";
			s12sv.executeQuery (sql12sv);
			rs12sv = s12sv.getResultSet();
			while (rs12sv.next ())
				{
				ad12ssv=rs12sv.getString("gamename");
			
	%>
<!----View Your Profile start>-->




<label style="font-size:30px;color:#004acc;"><i>Favourite Games:</i></label><label style="font-size:30px;color:#00005e;"><i><%=ad12ssv %></i></label><br/>

<!----View Your Profile end>-->


<%}%>
		
	<%}
	catch(Exception ex1){
	ex1.printStackTrace();
	} 
	//********
%>
</div>
<!----View Your Profile end>-->


<%}%>
		
	<%}
	catch(Exception ex1){
	ex1.printStackTrace();
	}
	
	//******
	
	
	
}
%>

<!---- groups and intrests starts>

<% if(labels.equals("games")){ %>
<!----New Post start>-->
<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#ffffff" size="5px">Games</font><br/>
</div>
<form name="second" class="snform" id="profileimage-form" action="postimg.jsp?meid=<%=memberid %>&mname=<%=membername %>" enctype="multipart/form-data" method="post">
<div style="width:440px;height:auto;float:left; margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<%
String staf=request.getParameter("stat");
if(staf.equals("success"))
{%>
	<div style="width:320px;height:40px;border:0px solid rgb(233,204,46);background:#DFF2BF;color:green;font-size:18px;padding-top:10px;padding-bottom:3px;padding-left:100px; auto;margin-right:0px;margin-top:0px;">
&nbsp;Successfully Added</div>	
<%}
if(staf.equals("failed"))
{%>
	<div style="width:320px;height:40px;border:0px solid rgb(233,204,46);background:#FFBABA;color:#D8000C;font-size:19px;padding-top:10px;padding-bottom:3px;padding-left:100px; auto;margin-right:0px;margin-top:0px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Already Added</div>	
<%}%>

<div class="testtablegenerator" style="margin-right:5px;"><font color="green" size="5px";>Add Favourite Game</font><br /><br />
                <table >
                    <tr>
                    
                     <td>
                           	Games ID
                        </td>
                        <td>
                           	Games Name
                        </td>
                       
                        <td >
                            Select
                        </td>
                       
                        
                    </tr>
                    
                    
                    <%
                    ResultSet rsga;
                	String g1=new String("");
                	String g2=new String("");
                	
                
                	try {
                		 Class.forName("com.mysql.jdbc.Driver");
                			java.sql.Connection conn12g=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
                			Statement s12g = conn12g.createStatement();
                			String sql12g = "select * from gameinfo ";
                			s12g.executeQuery (sql12g);
                			rsga = s12g.getResultSet();
                			while (rsga.next ())
                				{
                					g1=rsga.getString("gameid");
                					g2=rsga.getString("gamename");
                					
        					
        				%> 
                    
                    
                    <tr>
                        <td>
                          <%=g1%>
                        </td>
                        <td>
                          <%=g2%>
                        
                         <td>
                       <a href="addgame.jsp?id=<%=g1%>&gamename=<%=g2%>&mid=<%=memberid %>&memname=<%=membername %>" style="color:green;"><i>Add</i></a></td>
                        
                       <%}%>
		
	<%}
	catch(Exception ex1){
	ex1.printStackTrace();
	}%>
                    </tr>
                   
                   
                </table>
                </div>


</div></form>
<!----New Post End>-->
<%}%>

<% if(labels.equals("movies")){ %>

<!----New Post start>-->
<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#ffffff" size="5px">Movies</font><br/>
</div>
<form name="second" class="snform" id="profileimage-form" action="postimg.jsp?meid=<%=memberid %>&mname=<%=membername %>" enctype="multipart/form-data" method="post">
<div style="width:440px;height:auto;float:left; margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<%
String staf=request.getParameter("stat");
if(staf.equals("success"))
{%>
	<div style="width:320px;height:40px;border:0px solid rgb(233,204,46);background:#DFF2BF;color:green;font-size:18px;padding-top:10px;padding-bottom:3px;padding-left:100px; auto;margin-right:0px;margin-top:0px;">
&nbsp;Successfully Added</div>	
<%}
if(staf.equals("failed"))
{%>
	<div style="width:320px;height:40px;border:0px solid rgb(233,204,46);background:#FFBABA;color:#D8000C;font-size:19px;padding-top:10px;padding-bottom:3px;padding-left:100px; auto;margin-right:0px;margin-top:0px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Already Added</div>	
<%}%>

<div class="testtablegenerator" style="margin-right:5px;"><font color="green" size="5px";>Add Favourite Movies</font><br /><br />
                <table >
                    <tr>
                    
                     <td>
                           	Movie ID
                        </td>
                        <td>
                           	Movie Name
                        </td>
                       
                        <td >
                            Add
                        </td>
                       
                        
                    </tr>
                    
                    
                    <%
                    ResultSet rsga;
                	String g1=new String("");
                	String g2=new String("");
                	
                
                	try {
                		 Class.forName("com.mysql.jdbc.Driver");
                			java.sql.Connection conn12g=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
                			Statement s12g = conn12g.createStatement();
                			String sql12g = "select * from movieinfo ";
                			s12g.executeQuery (sql12g);
                			rsga = s12g.getResultSet();
                			while (rsga.next ())
                				{
                					g1=rsga.getString("movieid");
                					g2=rsga.getString("moviename");
                					
        					
        				%> 
                    
                    
                    <tr>
                        <td>
                          <%=g1%>
                        </td>
                        <td>
                          <%=g2%>
                        
                         <td>
                       <a href="addmovie.jsp?id=<%=g1%>&movname=<%=g2%>&mid=<%=memberid %>&memname=<%=membername %>" style="color:green;"><i>Add</i></a></td>
                        
                       <%}%>
		
	<%}
	catch(Exception ex1){
	ex1.printStackTrace();
	}%>
                    </tr>
                   
                   
                </table>
                </div>


</div></form>
<!----New Post End>-->
<%}%>
<% if(labels.equals("chpass")){ %>
<!----New Post start>-->
<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<%
String staf=request.getParameter("stat");
if(staf.equals("success"))
{%>
	<div style="width:320px;height:40px;border:0px solid rgb(233,204,46);background:#DFF2BF;color:green;font-size:18px;padding-top:10px;padding-bottom:3px;padding-left:100px; auto;margin-right:0px;margin-top:0px;">
&nbsp;Successfully Updated Your Password</div>	
<%}
if(staf.equals("failed"))
{%>
	<div style="width:320px;height:40px;border:0px solid rgb(233,204,46);background:#FFBABA;color:#D8000C;font-size:19px;padding-top:10px;padding-bottom:3px;padding-left:100px; auto;margin-right:0px;margin-top:0px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Give Correct Password</div>	
<%}%>

<font color="#ffffff" size="5px">Change Password</font><br/>
</div>
<form name="second" class="snform" id="profileimage-form" action="chpass.jsp?meid=<%=memberid %>&mname=<%=membername %>"  method="post">
<div style="width:440px;height:auto;float:left; margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>

<label class="req label">Current Password</label><br />
<input type="password" class="stext" id="cpass" name="cpass" value="" placeholder = "Eg:000000"/><br />
<label class="req label">New Password</label><br />
<input type="password" class="stext" id="npass" name="npass" value="" placeholder = "Eg:000000"/><br />


<br/>
<br/>
<div align="center">
<button class="search_btn">Update</button>
</div>
</div></form>
<!----New Post End>-->
<%}%>
<% if(labels.equals("pumessage")){
	
	String words=request.getParameter("words");
	String res=request.getParameter("res");
	%>
<!----New Post start>-->
<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>

<%
String staf=request.getParameter("stat");
if(staf.equals("success"))
{%>
	<div style="width:320px;height:40px;border:0px solid rgb(233,204,46);background:#DFF2BF;color:green;font-size:18px;padding-top:10px;padding-bottom:3px;padding-left:100px; auto;margin-right:0px;margin-top:0px;">
&nbsp;Message sent</div>	
<%}
if(staf.equals("failed"))
{%>
	<div style="width:400px;height:auto;border:0px solid rgb(233,204,46);background:#2EECD1;color:#D8000C;font-size:19px;padding-top:10px;padding-bottom:3px;padding-left:20px; auto;margin-right:0px;margin-top:0px;">


<% if(words.equals("ava"))
	{
	String gsnor2="";
	String gsnor1="";
	String gsnor3="";
	String gsnor4="";
	String gsnor5="";
	String gsnor6="";
	String gsnor7="";
	String gsnor8="";
	String gsnor9="";
	int gsno5=0;
	try
	{
	 Class.forName("com.mysql.jdbc.Driver");
		Connection con7 = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
Statement st7=con7.createStatement();

	//ResultSet rs7=st7.executeQuery("select Top 1 * from classification where imageid='"+ad11re+"' and memberid='"+memberids+"' order by reportid1 desc");
	ResultSet rs7=st7.executeQuery("select * from classification where memberid='"+memberids+"' ");
	while(rs7.next())
	  {
		 gsno5=rs7.getInt(1);//reportid
		  gsnor1=rs7.getString(2);//reportid1
		  gsnor2=rs7.getString(3);//imageid
		  gsnor3=rs7.getString(4);//memberid
		  gsnor4=rs7.getString(5);//message
		  gsnor5=rs7.getString(6);//Violence
		  gsnor6=rs7.getString(7);//Vulgar
		  gsnor7=rs7.getString(8);//Offensive
		  gsnor8=rs7.getString(9);//Hate
	  }
	}
	catch(Exception ex)
	{
		
	}
	
	%>
<form name="fourth" class="snform" id="search-form" action="postcomments" style="margin-right:20px;" method="post">

<label style="font-size:14px;color:#004acc;">Your Comments Can't be posted because it was Affective Text !</label><br />
<label style="font-size:14px;color:#000000;">Your Message : </label><label style="font-size:14px;color:#dc4614;"><i><%=gsnor4 %></i></label><br />
<label style="font-size:14px;color:#000000;">Violence &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=</label><label style="font-size:14px;color:maroon;"><i><%=gsnor5 %></i></label><br />
<label style="font-size:14px;color:#000000;">Vulgar   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=</label><label style="font-size:14px;color:maroon;"><i><%=gsnor6 %></i></label><br />
<label style="font-size:14px;color:#000000;">Offensive&nbsp;&nbsp;&nbsp;&nbsp;=</label><label style="font-size:14px;color:maroon;"><i><%=gsnor7 %></i></label><br />
<label style="font-size:14px;color:#000000;">Hate     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=</label><label style="font-size:14px;color:maroon;"><i><%=gsnor8 %></i></label><br />



</form>
<% } %>



</div>	
<%}%>


<font color="#ffffff" size="5px">Send Public Message</font><br/>
</div>
<form name="second" class="snform" id="profileimage-form" action="publicmsg.jsp?meid=<%=memberid %>&mname=<%=memberemail %>"  method="post">
<div style="width:440px;height:auto;float:left; margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<label style="font-size:20px;color:#004acc;">Type Your Message</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="publicmsg" id="publicmsg"></textarea>
<br/>
<br/>
<div align="center">
<button class="search_btn">Send</button>
</div>
</div></form>






<!----New Post End>-->
<br />
<!----New Post start>-->
<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#ffffff" size="5px">Receive Public Message</font><br/>
</div>

<%
ResultSet rs12;
ResultSet rs12s;
String ad12s=new String("");
String ad12s1=new String("");
String ad11s=new String("");
String ad13s=new String("");
String ad14s=new String("");
String ad15s=new String("");
String ad16s=new String("");
String ad11req1=new String("");
String ad11req2=new String("");
String ad11req3=new String("");
String ad11req4=new String("");
try {
	 Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection conn12=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
		Statement s12 = conn12.createStatement();
		String sql12ss = "SELECT * FROM publicmsg where receiverid='"+memberid+"' ";
		s12.executeQuery (sql12ss);
		rs12s = s12.getResultSet();
		while (rs12s.next ())
			{
			
			ad11req1=rs12s.getString("memberid");
			ad11req2=rs12s.getString("receiverid");
			ad11req3=rs12s.getString("message");
			ad11req4=rs12s.getString("reqdate");
			
			//System.out.println("request&response:"+ad11req);
			
			try {
				 Class.forName("com.mysql.jdbc.Driver");
				java.sql.Connection connu=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
				Statement s12u = connu.createStatement();
			String sql12 = "select * from register where Memberid='"+ad11req1+"'";
			s12u.executeQuery (sql12);
			rs12 = s12u.getResultSet();
			while (rs12.next ())
			{
				ad11s=rs12.getString("Memberid");
				ad12s=rs12.getString("Firstname");
				ad12s1=rs12.getString("Lastname");
				ad13s=rs12.getString("Email");
				ad14s=rs12.getString("Password");
				ad16s=rs12.getString("Gender");
				ad15s=rs12.getString("imagename");
			//	System.out.println(ad15s);
	%>
<!----searching output start>-->
<div style="width:440px;height:auto;float:left; margin-left:20px;margin-top:10px;margin-bottom:10px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<div style="width:80px;height:auto;float:left; margin-left:10px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>



<% if(ad15s.equals("balaji"))
{
	%>
	<a href="userhome.jsp?labels=otherview&friendid=<%=ad11s %>" title="Click Here to View Your Friends Information"><img src="images/human.png" style=width:70px;height:70px;" ></img></a>
	<%
}
else{
%>
<a href="userhome.jsp?labels=otherview&friendid=<%=ad11s %>" title="Click Here to View Your Friends Information"><img src=profileimage/<%=ad15s %> style=width:70px;height:70px;" ></img></a>
<%
}%>

</div>
<div style="width:280px;height:auto;float:right;font-size:18px;color:#004acc; margin-top:5px;padding-right:30px;padding-top:5px;padding-bottom:10px;border:0px solid #004acc";>
<%=ad12s %>&nbsp;&nbsp;<%=ad12s1 %>
<br/>
<div style="width:200px;height:auto;">
<font color="gray"><%=ad16s %></font>
</div>
<div style="width:200px;height:auto;">
<font color="gray"><%=ad11req4 %></font>
</div>
<div style="width:200px;height:auto;">
<font color="gray"><%=ad11req3 %></font>
</div>
<%System.out.println("ok1"); %>

</div>
<br />
<form name="second" class="snform" id="profileimage-form" action="privatemsg.jsp?meid=<%=memberid %>&receiver=<%=ad11req1 %>"  method="post">
<div style="width:400px;height:auto;float:left; margin-left:10px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<label style="font-size:20px;color:#004acc;">Type Your Message</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="privatemsg" id="privatemsg"></textarea>
<br/>
<br/>
<div align="center">
<button class="search_btn">Reply</button>
</div>
</div></form>
</div>
<!----searching output end>-->
<%			
			}
			}
		catch(Exception ex1){
		ex1.printStackTrace();
		}
			
			}
}
catch(Exception ex1){
ex1.printStackTrace();
}
%>




<!----New Post End>-->

<%}%>
<!----groups and interest end>

<% if(labels.equals("prmessage")){ %>
<!----New Post start>-->
<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>

<%
String staf=request.getParameter("stat");
if(staf.equals("success"))
{%>
	<div style="width:320px;height:40px;border:0px solid rgb(233,204,46);background:#DFF2BF;color:green;font-size:18px;padding-top:10px;padding-bottom:3px;padding-left:100px; auto;margin-right:0px;margin-top:0px;">
&nbsp;Message sent</div>	
<%}
if(staf.equals("failed"))
{%>
	<div style="width:320px;height:40px;border:0px solid rgb(233,204,46);background:#FFBABA;color:#D8000C;font-size:19px;padding-top:10px;padding-bottom:3px;padding-left:100px; auto;margin-right:0px;margin-top:0px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Already Added</div>	
<%}%>


</div>
<!----New Post start>-->
<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#ffffff" size="5px">Received Private Message</font><br/>
</div>

<%
ResultSet rs12;
ResultSet rs12s;
String ad12s=new String("");
String ad12s1=new String("");
String ad11s=new String("");
String ad13s=new String("");
String ad14s=new String("");
String ad15s=new String("");
String ad16s=new String("");
String ad11req1=new String("");
String ad11req2=new String("");
String ad11req3=new String("");
String ad11req4=new String("");
try {
	 Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection conn12=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
		Statement s12 = conn12.createStatement();
		String sql12ss = "SELECT * FROM privatemsg where receiverid='"+memberid+"' ";
		s12.executeQuery (sql12ss);
		rs12s = s12.getResultSet();
		while (rs12s.next ())
			{
			
			ad11req1=rs12s.getString("memberid");
			ad11req2=rs12s.getString("receiverid");
			ad11req3=rs12s.getString("message");
			ad11req4=rs12s.getString("reqdate");
			
			//System.out.println("request&response:"+ad11req);
			
			try {
				 Class.forName("com.mysql.jdbc.Driver");
				java.sql.Connection connu=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
				Statement s12u = connu.createStatement();
			String sql12 = "select * from register where Memberid='"+ad11req1+"'";
			s12u.executeQuery (sql12);
			rs12 = s12u.getResultSet();
			while (rs12.next ())
			{
				ad11s=rs12.getString("Memberid");
				ad12s=rs12.getString("Firstname");
				ad12s1=rs12.getString("Lastname");
				ad13s=rs12.getString("Email");
				ad14s=rs12.getString("Password");
				ad16s=rs12.getString("Gender");
				ad15s=rs12.getString("imagename");
			//	System.out.println(ad15s);
	%>
<!----searching output start>-->
<div style="width:440px;height:auto;float:left; margin-left:20px;margin-top:10px;margin-bottom:10px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<div style="width:80px;height:auto;float:left; margin-left:10px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>



<% if(ad15s.equals("balaji"))
{
	%>
	<a href="userhome.jsp?labels=otherview&friendid=<%=ad11s %>" title="Click Here to View Your Friends Information"><img src="images/human.png" style=width:70px;height:70px;" ></img></a>
	<%
}
else{
%>
<a href="userhome.jsp?labels=otherview&friendid=<%=ad11s %>" title="Click Here to View Your Friends Information"><img src=profileimage/<%=ad15s %> style=width:70px;height:70px;" ></img></a>
<%
}%>

</div>
<div style="width:280px;height:auto;float:right;font-size:18px;color:#004acc; margin-top:5px;padding-right:30px;padding-top:5px;padding-bottom:10px;border:0px solid #004acc";>
<%=ad12s %>&nbsp;&nbsp;<%=ad12s1 %>
<br/>
<div style="width:200px;height:auto;">
<font color="gray"><%=ad16s %></font>
</div>
<div style="width:200px;height:auto;">
<font color="gray"><%=ad11req4 %></font>
</div>
<div style="width:200px;height:auto;">
<font color="gray"><%=ad11req3 %></font>
</div>


</div>
<br />
<form name="second" class="snform" id="profileimage-form" action="publicmsg.jsp?meid=<%=memberid %>&mname=<%=membername %>"  method="post">
<div style="width:400px;height:auto;float:left; margin-left:10px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<label style="font-size:20px;color:#004acc;">Type Your Message</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="publicmsg" id="publicmsg"></textarea>
<br/>
<br/>
<div align="center">
<button class="search_btn">Reply</button>
</div>
</div></form>
</div>
<!----searching output end>-->
<%			
			}
			}
		catch(Exception ex1){
		ex1.printStackTrace();
		}
			
			}
}
catch(Exception ex1){
ex1.printStackTrace();
}
%>




<!----New Post End>-->

<%}%>
<!---->


<% if(labels.equals("newpost")){ %>
<!----New Post start>-->
<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#ffffff" size="5px">New Post</font><br/>
</div>
<form name="second" class="snform" id="profileimage-form" action="postimg.jsp?meid=<%=memberid %>&mname=<%=membername %>" enctype="multipart/form-data" method="post">
<div style="width:440px;height:auto;float:left; margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<label style="font-size:20px;color:#004acc;">Browse image files</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" name="profileimage" id="profileimage"></input>
<br/>
<br/>
<div align="center">
<button class="search_btn">Upload</button>
</div>
</div></form>
<!----New Post End>-->
<%}%>

<!----Enter Label start>-->
<% if(labels.equals("setlabel")){ 
	String pt1=request.getParameter("pmid");
	String pt2=request.getParameter("postid");
	String pt3=request.getParameter("poname");
%>
<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#ffffff" size="5px">New Post</font><br/>
</div>

<div style="width:160px;height:auto;float:left; margin-left:150px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:0px solid #004acc";>
<a href="userhome.jsp?labels=newpost" title="Click Here to Change Your Image"><img src="postimage/<%=pt2%>.png" style="width:150px;height:150px;"></img></a>
</div>

<form name="second" class="snform" id="postimage-form" action="postimage"  method="post">


<div style="width:440px;height:auto;float:left; margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<input type="hidden" style="display:none; width:1px;height:1px" name="pomemid" id="pomemid" value=<%=pt1%> readonly><br />
<input type="hidden" style="display:none; width:1px;height:1px" name="poid" id="poid" value=<%=pt2%> readonly><br />
<input type="hidden" style="display:none; width:1px;height:1px" name="poname" id="poname" value=<%=pt3%> readonly><br />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label style="font-size:20px;color:#004acc;">Select Your Image Post Type</label> &nbsp;
<select class="select combopad" name="posttype">
<option class="combopad" value="">Select</option>
<option  class="combopad" value="Sensitive">Private / Sensitive</option>
<option  class="combopad" value="Non-Sensitive">Public / Non-Sensitive</option>
</select>
<br/>
<br/>
<div align="center">
<button class="search_btn">Post Image</button>
</div>
</div>
</form>

<!----enter Label  End>-->
<%}%>


<!----secure chatting>
<% if(labels.equals("securechating")){ %>
<!----New Post start>-->
<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>
<font color="#ffffff" size="5px">Secure Chating</font><br/>
</div>

<%
String staf=request.getParameter("stat");
if(staf.equals("success"))
{%>
	<div style="width:320px;height:40px;border:0px solid rgb(233,204,46);background:#DFF2BF;color:green;font-size:18px;padding-top:10px;padding-bottom:3px;padding-left:100px; auto;margin-right:0px;margin-top:0px;">
&nbsp;Successfully Added</div>	
<%}
if(staf.equals("failed"))
{%>
	<div style="width:320px;height:40px;border:0px solid rgb(233,204,46);background:#FFBABA;color:#D8000C;font-size:19px;padding-top:10px;padding-bottom:3px;padding-left:100px; auto;margin-right:0px;margin-top:0px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Already Added</div>	
<%}%>
<form name="second" class="snform" id="profileimage-form" action="postimg.jsp?meid=<%=memberid %>&mname=<%=membername %>" enctype="multipart/form-data" method="post">
<div style="width:440px;height:auto;float:left; margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>


<div class="testtablegenerator" style="margin-right:5px;"><br />
                <table >
                    <tr>
                    
                     <td>
                           	Name
                        </td>
                        <td>
                           Email
                        </td>
                       
                        <td >
                            Select
                        </td>
                       
                        
                    </tr>
                    
                    
                    <%
                    ResultSet rsga;
                    ResultSet rsgaw;
                    ResultSet rsgawh;
                	String g1=new String("");
                	String g2=new String("");
                	
                	String g1a=new String("");
                	String g2a=new String("");
                	String g3a=new String("");
                	String g4a=new String("");
                	
                	String skeyvalue=new String("");
                
                	try {
                		 	Class.forName("com.mysql.jdbc.Driver");
                			java.sql.Connection conn12g=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
                			Statement s12g = conn12g.createStatement();
                		//	String sql12g = "select * from responsefriend where requestid='"+memberids+"' and status='active' ";
                		
                			String sql12g = "SELECT * FROM responsefriend where requestid='"+memberid+"' && status='active' UNION ALL (select * from requestfriend where (requestid='"+memberid+"') && status='active')";
                		
                			s12g.executeQuery (sql12g);
                			rsga = s12g.getResultSet();
                			while (rsga.next ())
                				{
                					g1=rsga.getString("memberid");
                					
                					
                					
                					Class.forName("com.mysql.jdbc.Driver");
                        			java.sql.Connection conn12gv=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
                        			Statement s12gv = conn12gv.createStatement();
                					String sql12gw = "select * from chatingmember where memberid='"+g1+"' and status='online' ";
                        			s12gv.executeQuery (sql12gw);
                        			rsgaw = s12gv.getResultSet();
                        			while (rsgaw.next ())
                        				{
                        					g4a=rsgaw.getString("memberid");
                        					g1a=rsgaw.getString("name");
                        					g2a=rsgaw.getString("email");
                        					g3a=rsgaw.getString("status");
                        					
                        					Class.forName("com.mysql.jdbc.Driver");
                                			java.sql.Connection conn12gvh=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
                                			Statement s12gvh = conn12gvh.createStatement();
                        					String sql12gwh = "select * from chatingkey where memberid='"+memberid+"' and requestid='"+g4a+"' || memberid='"+g4a+"' and requestid='"+memberid+"' ";
                                			s12gvh.executeQuery (sql12gwh);
                                			rsgawh = s12gvh.getResultSet();
                                			while (rsgawh.next ())
                                				{
                                				skeyvalue=rsgawh.getString("key");
                                					
                                				}
                        				
                					
        					
        				%> 
                    
                    
                    <tr>
                        <td>
                          <%=g1a%>
                        </td>
                        <td>
                          <%=g2a%>
                        
                         <td>
                       <a href="userhome.jsp?labels=startchat&stat=noth&securkey=<%=skeyvalue%>&cmid=<%=g4a%>&cmname=<%=g1a%>&cmemail=<%=g2a %>&memid=<%=memberid %>&memname=<%=membername %>&mememail=<%=memberemails %>" style="color:green;"><i>Chat</i></a></td>
                        
                        <%}%>
                       <%}%>
		
	<%}
	catch(Exception ex1){
	ex1.printStackTrace();
	}%>
                    </tr>
                   
                   
                </table>
                </div>


</div></form>
<!----New Post End>-->
<%}%>

<% if(labels.equals("startchat")){ 

	
%>
<!----find friends start>-->



<div style="width:440px;height:auto;float:left; background-color:#004acc;margin-left:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:0px solid #004acc";>
<font color="#ffffff" size="5px">Start Chat</font> <font color=white><i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=newDate %></i></font><br/>
</div>




<!----find friends end>-->
<%
ResultSet rs12;
String ad12s=new String("");
String ad12s1=new String("");
String ad11s=new String("");
String ad13s=new String("");
String ad14s=new String("");
String ad15s=new String("");
String ad16s=new String("");
String ta1=request.getParameter("cmid");//receiver memberid
String ta2=request.getParameter("cmname");//receiver name
String ta3=request.getParameter("cmemail");//receiver email
String ta4=request.getParameter("memid");//sender memberid
String ta5=request.getParameter("memname");//sender membername
String ta6=request.getParameter("mememail");//sender memberemail
String ta7=request.getParameter("securkey");//sender membername
%>
<div style="width:438px;height:auto;float:left; margin-left:20px;margin-bottom:20px;padding-left:10px;padding-top:10px;padding-bottom:10px;border:1px solid #004acc";>

<%
String staf=request.getParameter("stat");
if(staf.equals("noth"))
{%>
	<div style="width:320px;height:40px;border:0px solid rgb(233,204,46);background:#DFF2BF;color:green;font-size:18px;padding-top:10px;padding-bottom:3px;padding-left:100px; auto;margin-right:0px;margin-top:0px;">
&nbsp;Chat Your Friends</div>	
<%}
if(staf.equals("decrypt"))
{

	


%>
	<div style="width:320px;height:40px;border:0px solid rgb(233,204,46);background:#DFF2BF;color:green;font-size:19px;padding-top:10px;padding-bottom:3px;padding-left:100px; auto;margin-right:0px;margin-top:0px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Read Decrypted Message</div>	
<%}%>

<div class="testtablegenerator textcl" ><br />
                <table >
                
<%
try {
	 ResultSet rs6;
	 String g1xa=new String("");
	 String g1x=new String("");
	 String g2x=new String("");
	 String g3x=new String("");
	 String rg1x=new String("");
	 String g1xsid=new String("");
	 String g1xrid=new String("");
 	 Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection co12=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
	Statement s15 = co12.createStatement();
	String sqlg = "SELECT * FROM chatting where smemberid='"+ta1+"' and rmemberid='"+ta4+"' or smemberid='"+ta4+"' and rmemberid='"+ta1+"' ";
	
	//String sqlg="SELECT * FROM sender where memberid='"+memberid+"'   UNION ALL (select * from receiver where memberid='"+memberid+"' ) order by senddate desc ";

	s15.executeQuery (sqlg);
	rs6 = s15.getResultSet();
	String me="me";
	while (rs6.next ())
		{
			g1xa=rs6.getString("type");
			g1xsid=rs6.getString("smemberid");
			g1x=rs6.getString("sname");
			g1xrid=rs6.getString("rmemberid");
			rg1x=rs6.getString("rname");
			g2x=rs6.getString("demessage");
			g3x=rs6.getString("senddate");
			
			
%>
<form name="fourth" class="snform" id="postimage-form" action="userhome.jsp?labels=startchat&stat=decrypt&securkey=<%=ta7 %>&cmid=<%=ta1 %>&cmname=<%=ta2 %>&cmemail=<%=ta3 %>&memid=<%=ta4 %>&memname=<%=ta5 %>&mememail=<%=ta6 %>" method="post">
 <tr>
 
 <%
 if(g1x.equals(membername))
			{%>
			
			 <td>
			 <img src="profileimage/<%=g1xrid %>.png" style=width:60px;height:60px;" ><br />
                          <%=rg1x %> : 
                        </td>
			<%	
			}
			else
			{%>
			 <td>
			  <img src="profileimage/<%=g1xrid %>.png" style=width:60px;height:60px;" ><br />
                          <%=me%> :
                          
                        </td>
				
			<%}%>
 
                       
                         <td>
                          <%=g2x%>
                            <input type="hidden" name="dchat" id="dchat" style="width:50px;" value=<%=g2x %>></input><br />
                             <br /><%=g3x%>
                        </td>
                        
                         
                     
               </tr>         
                 </form>     
<% } %>
<%}
	catch(Exception ex1){
	ex1.printStackTrace();
	}%>
	 
	 
                   
                   
                </table>
                </div>
<%

if(staf.equals("decrypt"))
{
	 String decryval=new String("");
	String key=request.getParameter("sekey");
	String keydecry=request.getParameter("decry");
	
	
	String encrypt=request.getParameter("dchat");
	String ta1x=request.getParameter("cmid");//receiver memberid
	String ta2x=request.getParameter("cmname");//receiver name
	String ta3x=request.getParameter("cmemail");//receiver email
	String ta4x=request.getParameter("memid");//sender memberid
	String ta5x=request.getParameter("memname");//sender membername
	String ta6x=request.getParameter("mememail");//sender memberemail
	String ta7x=request.getParameter("securkey");//sender membername
	ResultSet rsf;
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con15=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
	Statement s16 = con15.createStatement();
	String sqlv = "select * from chatting where skey='"+key+"' and  enmessage='"+encrypt+"'";
	s16.executeQuery (sqlv);
	rsf = s16.getResultSet();
	if (rsf.next ())
		{
		decryval=rsf.getString("demessage");
		%>
		<label style="font-size:20px;color:#004acc;">Decrypted Message</label>
<textarea style=width:400px;height:60px;padding-left:5px;margin-top:10px;margin-left:10px;" class="stext bgm" id="gchat" name="gchat" ><%=decryval %></textarea>
		
		<%
			
		}
	else
	{%>
	<div style="width:320px;height:40px;border:0px solid rgb(233,204,46);background:#DFF2BF;color:red;font-size:19px;padding-top:10px;padding-bottom:3px;padding-left:100px; auto;margin-right:0px;margin-top:0px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wrong Secret Key</div>	

		<%
	}

%>
	



	
	
	
	
	
	
<%}%>

<form name="fourth" class="snform" id="postimage-form" action="cryptography" method="post">

<label style="font-size:20px;color:#004acc;">Type Your Text</label>
<textarea style=width:400px;height:100px;padding-left:5px;margin-top:10px;margin-left:10px;" class="stext bgm" id="schat" name="schat" ></textarea>



<div style="padding-left:150px;align:left";>
<button class="search_btn">Send</button>
</div>
<input type="hidden" style="width:1px;height:1px" name="cmid" id="cmid" value=<%=ta1%> readonly><br />
<input type="hidden" style="width:1px;height:1px" name="cmname" id="cmname" value=<%=ta2%> readonly><br />
<input type="hidden" style="width:1px;height:1px" name="cmemail" id="cmemail" value=<%=ta3%> readonly><br />
<input type="hidden" style="width:1px;height:1px" name="memid" id="memid" value=<%=ta4%> readonly><br />
<input type="hidden" style="width:1px;height:1px" name="memname" id="memname" value=<%=ta5%> readonly><br />
<input type="hidden" style=" width:1px;height:1px" name="mememail" id="mememail" value=<%=ta6%> readonly><br />
<input type="hidden" style="width:1px;height:1px" name="securkey" id="securkey" value=<%=ta7%> readonly><br />
</form>
</div>

<%} %>



<!----find friends end>-->

</div>

<div style="width:250px;height:auto;float:right; margin-top:10px; margin-right:5px;margin-bottom:10px;border:1px solid #004acc";>

<div style="border-radius:0px;width:220px;height:30px;font-size:16px;color:#FFFFFF;background-color:#1a48ce;border-bottom:1px solid rgb(233,204,46);padding-left:30px;padding-top:10px;margin-bottom:5px;margin-top:0px;">
Applications Catalog
</div>
<div style="border-radius:0px;width:220px;height:auto;font-size:16px;color:#2a2a2a;background-color:#FFFFFF;border-bottom:1px solid rgb(233,204,46);padding-left:20px;padding-top:5px;padding-bottom:10px;margin-top:0px;">
<a href="userhome.jsp?labels=update">Edit Profile</a>
</div>
<div style="border-radius:0px;width:220px;height:auto;font-size:16px;color:#2a2a2a;background-color:#FFFFFF;border-bottom:1px solid rgb(233,204,46);padding-left:20px;padding-top:5px;padding-bottom:10px;margin-top:0px;">
<a href="userhome.jsp?labels=chpass&stat=noth">Change Password</a>
</div>

<div style="border-radius:0px;width:220px;height:auto;font-size:16px;color:#2a2a2a;background-color:#FFFFFF;border-bottom:1px solid rgb(233,204,46);padding-left:20px;padding-top:5px;padding-bottom:10px;margin-top:0px;">
<a href="userhome.jsp?labels=pumessage&stat=noth&words=occur&res=noth">Public Message</a>
</div>
<div style="border-radius:0px;width:220px;height:auto;font-size:16px;color:#2a2a2a;background-color:#FFFFFF;border-bottom:1px solid rgb(233,204,46);padding-left:20px;padding-top:5px;padding-bottom:10px;margin-top:0px;">
<a href="userhome.jsp?labels=prmessage&stat=noth">Private Message</a>
</div>

<div style="border-radius:0px;width:220px;height:auto;font-size:16px;color:#2a2a2a;background-color:#FFFFFF;border-bottom:1px solid rgb(233,204,46);padding-left:20px;padding-top:5px;padding-bottom:10px;margin-top:0px;">
<a href="userhome.jsp?labels=newpost">New Post</a>
</div>
<div style="border-radius:0px;width:220px;height:auto;font-size:16px;color:#2a2a2a;background-color:#FFFFFF;border-bottom:1px solid rgb(233,204,46);padding-left:20px;padding-top:5px;padding-bottom:10px;margin-top:0px;">
<a href="userhome.jsp?labels=yourpost">Your Post</a>
</div>

<div style="border-radius:0px;width:150px;height:auto;font-size:16px;color:#2a2a2a;background-color:#FFFFFF;border-bottom:0px solid rgb(233,204,46);padding-left:20px;padding-top:5px;padding-bottom:10px;margin-top:0px;">
<a href="userhome.jsp?labels=securechating&stat=noth">Chatting</a>
</div>

</div>








</div>

<div style="width:960px;height:100px;float:left; border:0px solid #000000;";>
<div class="footer1_rev_3x1"><div style="font-size:12px;padding-left:380px;">Copyright &#169; 2019  All rights reserved.</div></div>
</div>



</div>
</div>
</body>
</html>