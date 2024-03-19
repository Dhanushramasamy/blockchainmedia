package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import model.CommonModel;

public class removefriend extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException, ServletException
	{
		res.setContentType("text/html");
        int state2,grate=0;
		PrintWriter out=res.getWriter();


		String t1=req.getParameter("memid");
		String t2=req.getParameter("frid");
		
		

		CommonModel v=new CommonModel();
		state2=v.requestdel(t1,t2);


        if(state2==1)
	          {
        	res.sendRedirect("userhome.jsp?labels=requestedfriends&sekey=noth");
	   	      }
	   	else
	   	{
	   		res.sendRedirect("userhome.jsp?labels=friendslist");
	    }

}
}