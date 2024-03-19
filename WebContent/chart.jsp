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
String query="SELECT totalcount,Violence,Vulgar,Offensive,Hate from finalreport where memberid='"+sessionids+"'";
JDBCCategoryDataset dataset=new JDBCCategoryDataset("jdbc:mysql://localhost:3306/wordfilter",
"com.mysql.jdbc.Driver","root","root");

dataset.executeQuery( query);
//JFreeChart chart = ChartFactory .createBarChart3D(
		JFreeChart chart = ChartFactory.createBarChart(
"Histogram of the Average Most Affective Text", 
"Category",
"count", 
dataset, 
PlotOrientation.VERTICAL,true, true, false);
		String webRootPath = application.getRealPath("/").replace('\\', '/');
		String saveFile = webRootPath;
		String finalimage=sessionids+".png";
		    if (saveFile.contains("/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/")){
		    	saveFile=saveFile.replace("/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/", "/");
		    	 saveFile=saveFile+"WebContent/chart/"+finalimage;
		    }
		    else
		    {
		    	 saveFile=saveFile+"WebContent/chart/"+finalimage;
		    }

try
{
ChartUtilities.saveChartAsJPEG(new File(saveFile), chart, 400, 300);

response.sendRedirect("admin.jsp?label=filterperform&sta=display&sid="+sessionids);
}
catch (IOException e)
{
System.out.println("Problem in creating chart.");
}
%>