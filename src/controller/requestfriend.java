package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import model.CommonModel;

public class requestfriend extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException, ServletException
	{
		res.setContentType("text/html");
        int state;

		PrintWriter out=res.getWriter();
		//System.out.println("inside");



		
		String t1=req.getParameter("memid");
		String t2=req.getParameter("frid");
		

		CommonModel v=new CommonModel();
        state=v.requestfriend(t1,t2);

        if(state==0)
        {
        	 res.sendRedirect("index.jsp?createstaf=fail");
        	
 	      }
 	else
 	{
 		 res.sendRedirect("userhome.jsp?labels=findfriends");
 		
 		//res.sendRedirect("mailsend.jsp?emailid="+t3+"&usern="+t1);
  }
       

}
		}


