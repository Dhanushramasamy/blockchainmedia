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
String t2=request.getParameter("meid");
String t4=request.getParameter("mname");
String t3=request.getParameter("publicmsg");
Date datex = new Date();
String currentdate=datex.toString();
String receiver=new String("");
int state,st,loginok;
int i=0;


int gsno=0;
int gsno1=0;
int gsno5=0;

String myString1 = t3;
String[] sentencex1Array = myString1.split(" ");
String checks="";
String catagory="";
String wid="";

String gsnor2="";
String gsnor1="";
String gsnor3="";
String gsnor4="";
String gsnor5="";
String gsnor6="";


try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
Statement st13=con3.createStatement();
ResultSet rs13=st13.executeQuery("select max(reportid1) from report");
if(rs13.next())
  {
  gsno1=rs13.getInt(1);
  gsno1++;
  
  }
  else
  {
  gsno1=1;
   }
rs13.close();
}


	 catch(Exception e)
			{
				System.out.println("ERROR"+e);
			}


for(i=0;i<sentencex1Array.length;i++)
{
	try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
    Statement s12q = con.createStatement();
    ResultSet rs12q;
    String sql12q = "select * from addword where word='"+sentencex1Array[i]+"' " ;
	s12q.executeQuery (sql12q);
	rs12q = s12q.getResultSet();
	if (rs12q.next ())
	{
	System.out.println("Yes");	
	checks="Yes";
	
	wid=rs12q.getString("wordid");
	catagory=rs12q.getString("category");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
    Statement st1=con1.createStatement();
	ResultSet rs1=st1.executeQuery("select max(reportid) from report");
	if(rs1.next())
	  {
	  gsno=rs1.getInt(1);
	  gsno++;
	  System.out.println("registration failed"+gsno);
	  }
	  else
	  {
	  gsno=1;
	   }
    rs1.close();
    
    Class.forName("com.mysql.jdbc.Driver");
	Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
    Statement st2=con2.createStatement();
   
	int stgh=st2.executeUpdate("insert into report values('"+gsno+"','"+gsno1+"','"+t1+"','"+t2+"','"+t3+"','"+catagory+"','"+wid+"','offline')");
	
	
	
	//int st5=st2.executeUpdate("insert into classification values('"+gsno+"','"+gsno1+"','"+t1+"','"+t2+"','"+t3+"','"+catagory+"','"+wid+"','offline')");
	
	
	
	}


 	 catch(Exception e)
 			{
 				System.out.println("ERROR"+e);
 			}
	
	}
	else
	{
		System.out.println("No");
	}
	}
	catch(Exception ex)
	{
		
	}
}


if(checks.equals("Yes"))
{
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con8 = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
	Statement st8=con8.createStatement();
	int stgt=st8.executeUpdate("insert into classification values('"+gsno+"','"+gsno1+"','"+t1+"','"+t2+"','"+t3+"','0','0','0','0','0','offline')");
	
	
Class.forName("com.mysql.jdbc.Driver");
Connection con7 = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
Statement st7=con7.createStatement();

ResultSet rs7=st7.executeQuery("select * from report where reportid1='"+gsno1+"'");
while(rs7.next())
{
gsno5=rs7.getInt(1);//reportid
gsnor1=rs7.getString(2);//reportid1
gsnor2=rs7.getString(3);//imageid
gsnor3=rs7.getString(4);//memberid
gsnor4=rs7.getString(5);//message
gsnor5=rs7.getString(6);//category
gsnor6=rs7.getString(7);//wordid

System.out.println(gsno5);
System.out.println(gsnor1);
System.out.println(gsnor2);
System.out.println(gsnor3);
System.out.println(gsnor4);
System.out.println(gsnor5);
System.out.println(gsnor6);
Class.forName("com.mysql.jdbc.Driver");
Connection con9 = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
Statement st9=con9.createStatement();

if(gsnor5.equals("Violence"))
{
	 int stfd=st9.executeUpdate("update classification set Violence=Violence + 1,totalcount=Violence + Vulgar + Offensive + Hate where reportid1='"+gsno1+"'");
	 int stfd1=st9.executeUpdate("update finalreport set Violence=Violence + 1,totalcount=Violence + Vulgar + Offensive + Hate where Memberid='"+gsnor3+"'");
}
if(gsnor5.equals("Vulgar"))
{
	 int stfd=st9.executeUpdate("update classification set Vulgar=Vulgar + 1,totalcount=Violence + Vulgar + Offensive + Hate  where reportid1='"+gsno1+"'");
	 int stfd1=st9.executeUpdate("update finalreport set Vulgar=Vulgar + 1,totalcount=Violence + Vulgar + Offensive + Hate  where Memberid='"+gsnor3+"'");
}
if(gsnor5.equals("Offensive"))
{
	 int stfd=st9.executeUpdate("update classification set Offensive=Offensive + 1,totalcount=Violence + Vulgar + Offensive + Hate where reportid1='"+gsno1+"'");
	 int stfd1=st9.executeUpdate("update finalreport set Offensive=Offensive + 1,totalcount=Violence + Vulgar + Offensive + Hate where Memberid='"+gsnor3+"'");
}
if(gsnor5.equals("Hate"))
{
	 int stfd=st9.executeUpdate("update classification set Hate=Hate + 1,totalcount=Violence + Vulgar + Offensive + Hate where reportid1='"+gsno1+"'");
	 int stfd1=st9.executeUpdate("update finalreport set Hate=Hate + 1,totalcount=Violence + Vulgar + Offensive + Hate where Memberid='"+gsnor3+"'");
}




}

rs7.close();
}
catch(Exception ex)
{
	
}
response.sendRedirect("userhome.jsp?labels=pumessage&stat=failed&words=ava&res="+t1);
}
else
{



Connection con=null;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
Statement st1z=con.createStatement();
ResultSet rs1z=st1z.executeQuery("select * from responsefriend where requestid='"+t1+"' and status='active'");
while(rs1z.next())
  {
	receiver=rs1z.getString("memberid");
	Statement st2=con.createStatement();
	st=st2.executeUpdate("insert into publicmsg values('"+t1+"','"+receiver+"','"+t3+"','"+currentdate+"') ");
	System.out.println("registration success");
	
  }
response.sendRedirect("userhome.jsp?labels=pumessage&stat=success&words=Posted&res=noth");
//response.sendRedirect("userhome.jsp?labels=pumessage&stat=success");


//most posted msg checks start
Connection con23=null;
boolean pr=false;
String repmesg=null,msgtype="Public",msgtype1=null;
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

	System.out.println("updation success"+count);
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

// table for user most posted
//most posted msg checks start
Connection con232=null;
boolean pr2=false;
String repmesg2=null,msgtype2="Public",msgtype12=null;
Class.forName("com.mysql.jdbc.Driver");
con232=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
Statement st1z232=con232.createStatement();
ResultSet rs1z232=st1z232.executeQuery("select * from mostposteduser ");
while(rs1z232.next())
  {
	repmesg2=rs1z232.getString(1);
 
	st=0;
	int count2=0;
	if(t3.equalsIgnoreCase(repmesg2)){
		msgtype12=rs1z232.getString(2);
		if(	t4.equalsIgnoreCase(msgtype12)){
		count2=rs1z232.getInt(3);
		count2++;
		
	
	Statement st2222=con232.createStatement();
	pr2=true;
	st=st2222.executeUpdate("update mostposteduser set reqdate='"+count2+"' where message='"+t3+"' AND user='"+t4+"'");

	System.out.println("updation success in user det"+count2+t4);
	}}
  }
//most posted message insert Start 
if(pr2==false){
st=0;
	int count2=1;
Connection con223=null;
Class.forName("com.mysql.jdbc.Driver");

con223=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
Statement st1z223=con223.createStatement();
int rs1z223=st1z223.executeUpdate("insert into mostposteduser values('"+t3+"','"+t4+"','"+count2+"') ");
System.out.println("insertion success user det"+t4);
}
//most posted message insert end
}
%>
</body>
</html>