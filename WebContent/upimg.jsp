<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.sql.*,java.util.*,java.text.*,java.text.SimpleDateFormat" %>
<html>
<%
int val =0;
String t2=request.getParameter("meid");
RequestDispatcher rp;
int lent=0; FileInputStream fs=null; File fi=null;
String saveFile="";
String imagename="";
String fPath="";
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
 

String finalimage=t2+ ".png";
//saveFile="D:/uploading/"+t2+ ".png";


//ServletContext context = getServletContext();
//saveFile = context.getRealPath("profileimage/"+finalimage);
//System.out.println("Path:"+saveFile);
/*
ServletContext context = getServletContext(); // Inherited from HttpServlet.
String path = context.getResource("/Picture/"+finalimage).getPath();
System.out.println("Path:"+path);*/



String webRootPath = application.getRealPath("/").replace('\\', '/');
 saveFile = webRootPath;

    if (saveFile.contains("/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/")){
    	saveFile=saveFile.replace("/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/", "/");
    	 saveFile=saveFile+"WebContent/profileimage/"+finalimage;
    }
    else
    {
    	 saveFile=saveFile+"WebContent/profileimage/"+finalimage;
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
String DATE_FORMAT = "yyyy-MM-dd hh:mm:ss";
SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
String strDateNew = sdf.format(now) ;

String queryString = "update register set imagename='"+finalimage+"' where Memberid='"+t2+"'";

//out.println(queryString);

pstatement=con.prepareStatement(queryString);


val = pstatement.executeUpdate();

if(val>0)
{
 response.sendRedirect("userhome.jsp?labels=recentpost&words=occur&res=noth");
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