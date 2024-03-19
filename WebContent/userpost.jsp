<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.*" %>
<%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>

<%



String sessionids=request.getParameter("sid");




try
{


response.sendRedirect("admin.jsp?label=mostposted&sta=display&sid="+sessionids);
}
catch (IOException e)
{
System.out.println("Problem in creating chart.");
}
%>