package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import model.CommonModel;

public class postimage extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException, ServletException
	{
		res.setContentType("text/html");
        int state2,grate=0;
		PrintWriter out=res.getWriter();


		String t1=req.getParameter("pomemid");
		String t2=req.getParameter("poid");
		String t3=req.getParameter("posttype");
		String t4=req.getParameter("poname");
		

		CommonModel v=new CommonModel();
		state2=v.postimageupd(t1,t2,t3,t4);


        if(state2==1)
	          {
        	res.sendRedirect("userhome.jsp?labels=recentpost&words=occur&res=noth");
	   	      }
	   	else
	   	{
	   		res.sendRedirect("userhome.jsp?labels=recentpost&words=occur&res=noth");
	    }

}
}