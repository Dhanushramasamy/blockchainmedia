package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import model.CommonModel;

public class update extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException, ServletException
	{
		res.setContentType("text/html");
        int state2,grate=0;
		PrintWriter out=res.getWriter();

		String m1=req.getParameter("mmid");
		String t1=req.getParameter("fname");
		String t2=req.getParameter("lname");
		String t3=req.getParameter("email");
		String t4=req.getParameter("dob");
		String t5=req.getParameter("gender");
		String t6=req.getParameter("agree");
		String t8=req.getParameter("city");
		String t9=req.getParameter("iam");
		String t10=req.getParameter("working");
		
		

		CommonModel v=new CommonModel();
		state2=v.upduser(m1,t1,t2,t3,t4,t5,t6,t8,t9,t10);


        if(state2==1)
	          {
        	res.sendRedirect("userhome.jsp?labels=view");
	   	      }
	   	else
	   	{
	   		res.sendRedirect("userhome.jsp?labels=view");
	    }

}
}