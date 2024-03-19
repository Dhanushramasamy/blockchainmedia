package controller;

import java.io.*;
import java.io.*;  
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import model.CommonModel;

public class postcomments extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException, ServletException
	{
		res.setContentType("text/html");
        int state2;
		PrintWriter out=res.getWriter();
		int i=0;
		String t1=req.getParameter("poid");
		String t2=req.getParameter("memid");
		String t3=req.getParameter("msg");
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
		   
			int st=st2.executeUpdate("insert into report values('"+gsno+"','"+gsno1+"','"+t1+"','"+t2+"','"+t3+"','"+catagory+"','"+wid+"','offline')");
			
			
			
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
			int st=st8.executeUpdate("insert into classification values('"+gsno+"','"+gsno1+"','"+t1+"','"+t2+"','"+t3+"','0','0','0','0','0','offline')");
			
			
			
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
	 res.sendRedirect("userhome.jsp?labels=recentpost&words=ava&res="+t1);
 }
 else
 {
	 CommonModel v=new CommonModel();
		state2=v.postcomments(t1,t2,t3);


     if(state2==1)
	          {
     	res.sendRedirect("userhome.jsp?labels=recentpost&words=Posted&res=noth");
	   	      }
	   	else
	   	{
	   		res.sendRedirect("userhome.jsp?labels=recentpost&words=err&res=noth");
	    }
 }
}
}