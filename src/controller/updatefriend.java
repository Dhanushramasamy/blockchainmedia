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

public class updatefriend extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException, ServletException
	{
		res.setContentType("text/html");
        int state2,grate=0;
		PrintWriter out=res.getWriter();

		Connection con1=null;
		String t1=req.getParameter("memid");
		String t2=req.getParameter("frid");
		String e1=new String("");
		String e2=new String("");
		String n1=new String("");
		String n2=new String("");
		int skey=(int) (Math.random() * 9999); 
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
			Statement st1=con1.createStatement();
			ResultSet rs1=st1.executeQuery("select * from register where Memberid='"+t2+"' ");
		if(rs1.next())
		  {
			n1=rs1.getString(2);
		    e1=rs1.getString(4);
		  }
        rs1.close();
		}
	 catch(Exception e)
			{
				System.out.println("ERROR"+e);
			}
	 
	 try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
			Statement st1=con1.createStatement();
		ResultSet rs1=st1.executeQuery("select * from register where Memberid='"+t1+"' ");
		if(rs1.next())
		  {
			 n2=rs1.getString(2);
		     e2=rs1.getString(4);
		 
		  }
     rs1.close();
		}
	 catch(Exception e)
			{
				System.out.println("ERROR"+e);
			}

		CommonModel v=new CommonModel();
		state2=v.requestupd(t1,t2,n1,e1,n2,e2,skey);


        if(state2==1)
	          {
        	//res.sendRedirect("userhome.jsp?labels=requestedfriends");
        	//res.sendRedirect("keysend.jsp?emailid="+e1+"&usern="+n1+"&skey="+skey+"&emailid1="+e2+"&usern1="+n2+"&skey1="+skey);
        	res.sendRedirect("userhome.jsp?labels=requestedfriends&sekey=send");
        	
        	//res.sendRedirect("userhome.jsp?labels=requestedfriends");
	   	      }
	   	else
	   	{
	   		res.sendRedirect("userhome.jsp?labels=requestedfriends&sekey=failed");
	    }

}
}