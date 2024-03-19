<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.sql.*,java.util.*,java.text.*,java.text.SimpleDateFormat" %>
<html>

<%
int val =0;
String t2=request.getParameter("meid");
String t3=request.getParameter("mname");
RequestDispatcher rp;
int lent=0; FileInputStream fs=null; File fi=null;
String saveFile="";
String imagename="";
String fPath="";
int SNO=0,gsno=0;
String contentType = request.getContentType();



if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
java.sql.Connection con;
int len;
String query,query1;
PreparedStatement pstmt;
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while (totalBytesRead < formDataLength) {
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);

saveFile = file.substring(file.indexOf("filename=\"") + 10);

saveFile = saveFile.substring(0, saveFile.indexOf("\n"));

saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));

imagename=saveFile;
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;



int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

String filesToZip = imagename;
File f = new File(filesToZip);
String zipFileName="";
String store="";
int index = f.getName().lastIndexOf('.');
  if (index>0&& index <= f.getName().length() - 2 ) {
  zipFileName=f.getName().substring(0, index);
  String aaa=zipFileName;
  
  }
 
  try
	{
	 
	  Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection conk=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
  Statement st1=conk.createStatement();
	ResultSet rs1=st1.executeQuery("select max(Postid) from newpost");
	if(rs1.next())
	  {
	  gsno=rs1.getInt(1);
	  gsno++;
	  }
	  else
	  {
	  gsno=1;
	   }
  	rs1.close();
	}


	 catch(Exception e)
			{
				System.out.println("ERROR"+e);
			}
String finalimage=gsno+ ".png";
//saveFile="D:/uploading/"+t2+ ".png";
//System.out.println("finalimage:"+finalimage);


//ServletContext context = getServletContext();
//saveFile = context.getRealPath("postimage/"+finalimage);
//System.out.println("Path:"+saveFile);
/*
ServletContext context = getServletContext(); // Inherited from HttpServlet.
String path = context.getResource("/Picture/"+finalimage).getPath();
System.out.println("Path:"+path);*/

String webRootPath = application.getRealPath("/").replace('\\', '/');
saveFile = webRootPath;

   if (saveFile.contains("/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/")){
   	saveFile=saveFile.replace("/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/", "/");
   	 saveFile=saveFile+"WebContent/postimage/"+finalimage;
   }
   else
   {
   	 saveFile=saveFile+"WebContent/postimage/"+finalimage;
   }

File ff = new File(saveFile);
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
%>

<%

PreparedStatement pstatement = null;
String line = null;
String value=null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "wordfilter";
String driver = "com.mysql.jdbc.Driver";
String userName = "root"; 
String password = "root";
try{
StringBuilder contents = new StringBuilder();
BufferedReader input = new BufferedReader(new FileReader(saveFile));
while (( line = input.readLine()) != null){
contents.append(line);
}
value = contents.toString();
//System.out.println("ID:"+t2);
//System.out.println("Image:"+finalimage);

String servletPath = request.getServletPath();  

String realPath = request.getSession().getServletContext().getRealPath(servletPath);  



Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(url+dbName,userName,password);
java.util.Date now = new java.util.Date();
String DATE_FORMAT = "dd-MM-YYYY";
SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
String strDateNew = sdf.format(now) ;


ResultSet rs12;
String ad12s=new String("");
String ad12s1=new String("");
String ad11s=new String("");
String ad13s=new String("");
String ad14s=new String("");
String ad15s=new String("");
String t1=request.getParameter("sfriends");
try {
	 Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection conn12=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
		Statement s12 = conn12.createStatement();
		//String sql12 = "select * from responsefriend where requestid='"+t2+"' ";
		String sql12 = "SELECT DISTINCT * FROM responsefriend where requestid='"+t2+"' && status='active' UNION ALL (select DISTINCT  * from requestfriend where (requestid='"+t2+"') && status='active')";
		s12.executeQuery (sql12);
		rs12 = s12.getResultSet();
		while (rs12.next ())
			{
				ad11s=rs12.getString("memberid");
				
				String queryString1 = "insert into viewpost values('"+gsno+"','"+t2+"','"+ad11s+"','"+t3+"','"+finalimage+"','"+strDateNew+"','not set','0')";
				pstatement=con.prepareStatement(queryString1);
				val = pstatement.executeUpdate();
			}

}
catch(Exception ex1){
ex1.printStackTrace();
}


//out.println(queryString);



String queryString = "insert into newpost values('"+gsno+"','"+t2+"','0','"+t3+"','"+finalimage+"','"+strDateNew+"','not set','0')";

//out.println(queryString);

pstatement=con.prepareStatement(queryString);


val = pstatement.executeUpdate();

if(val>0)
{
	//String labels1="setlabel";
 response.sendRedirect("userhome.jsp?postid="+gsno+"&pmid="+t2+"&poname="+t3+"&labels=setlabel");
}
else
{
	response.sendRedirect("index.jsp");
}



}
catch(Exception e)
{}
}
%>
</html>