package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import model.CommonModel;

public class create extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException, ServletException
	{
		res.setContentType("text/html");
        int state;

		PrintWriter out=res.getWriter();
		//System.out.println("inside");



		String t1=req.getParameter("fname");
		String t2=req.getParameter("lname");
		String t3=req.getParameter("email");
		String t4=req.getParameter("pass");
		String t5=req.getParameter("dob");
		String t6=req.getParameter("gender");
		String t7=req.getParameter("agree");
		String t8=req.getParameter("city");
		String t9=req.getParameter("iam");
		String t10=req.getParameter("working");
		//String pass=req.getParameter("pass");

		CommonModel v=new CommonModel();
        state=v.create(t1,t2,t3,t4,t5,t6,t7,t8,t9,t10);

        if(state==0)
        {
        	 res.sendRedirect("register.jsp?createstaf=fail");
        	
 	      }
 	else
 	{
 		
 		res.sendRedirect("register.jsp?createstas=success");
 		//res.sendRedirect("mailsend.jsp?emailid="+t3+"&usern="+t1);
 	//	res.sendRedirect("index.jsp?createstas=success");
  }
       

}
		}


