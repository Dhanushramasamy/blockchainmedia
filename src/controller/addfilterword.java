package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;
import model.CommonModel;

public class addfilterword extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException, ServletException
	{
		res.setContentType("text/html");
        int state;

		PrintWriter out=res.getWriter();
		System.out.println("inside");



		String t1=req.getParameter("keyword");
		String t2=req.getParameter("cat");
	
        
        //***
        try
		{
			Connection con=null;
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
        Statement st1=con.createStatement();
		ResultSet rs1=st1.executeQuery("select * from addword where word='"+t1+"'");
		if(rs1.next())
		  {
			 res.sendRedirect("admin.jsp?label=addfilter&sta=failed1");
			
		  }
		  else
		  {
			  CommonModel v=new CommonModel();
		        state=v.addfilter(t1,t2);

		        if(state==0)
		        {
		        	 res.sendRedirect("admin.jsp?label=addfilter&sta=failed");
		        	
		 	      }
		 	else
		 	{
		 		

		 		res.sendRedirect("admin.jsp?label=addfilter&sta=success");
		  }
		  
		   }
        rs1.close();
		}
	 	 catch(Exception e)
	 			{
	 			}
        //***
       

}
		}


