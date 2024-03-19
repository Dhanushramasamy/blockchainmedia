<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.*" %>
<%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>

<%




String query="SELECT totalcount,sum(Violence) as Violence,sum(Vulgar) as Vulgar,sum(Offensive) as Offensive,sum(Hate) as Hate from classification";
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
		String finalimage="overall"+".png";
		    if (saveFile.contains("/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/")){
		    	saveFile=saveFile.replace("/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/", "/");
		    	 saveFile=saveFile+"WebContent/overall/"+finalimage;
		    }
		    else
		    {
		    	 saveFile=saveFile+"WebContent/overall/"+finalimage;
		    }

try
{
ChartUtilities.saveChartAsJPEG(new File(saveFile), chart, 400, 300);

response.sendRedirect("admin.jsp?label=ofilterperform&sta=display");
}
catch (IOException e)
{
System.out.println("Problem in creating chart.");
}
%>