<%@ page language="java" import="javax.naming.*,java.io.*,javax.mail.*,javax.mail.internet.*,com.sun.mail.smtp.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" import="java.security.SecureRandom.*,java.util.Random.*" %>
<%@page import="java.sql.*,java.util.*"%>

<%@ page import="javax.mail.Message.*,java.util.Properties.*,javax.mail.MessagingException.*,javax.mail.PasswordAuthentication.*,javax.mail.Session.*,javax.mail.Transport.*,javax.mail.internet.InternetAddress.*,javax.mail.internet.MimeMessage.*" %>
<html>
<head>

<title>Mail</title>


</head>
<body>
<%
String maild=request.getParameter("emailid");
String usern=request.getParameter("usern");
final String username = "sampledemoprojects@gmail.com";
final String password = "Pondy##000";
final String subj="Welcome To Join Online Social Network";
final String cont="Dear "+usern+"   : 	Get your PassWord : ";

Properties props = new Properties();
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.host", "smtp.gmail.com");
props.put("mail.smtp.port", "587");

String ch="ma";
String ch1="ni";
int pssw=(int) (Math.random() * 99999999); 
String pwd=ch+pssw+ch1;
//String pwd="balaji";
//System.out.println("Password:"+pwd);

Session session1 = Session.getInstance(props,
  new javax.mail.Authenticator() {
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(username, password);
	}
  });

try {

	Message message = new MimeMessage(session1);
	message.setFrom(new InternetAddress(username));
		  Address[] toAddr = new InternetAddress[] {
		  new InternetAddress(%><%request.getParameter("emailid")%><%)
		  };
		  message.setRecipients(javax.mail.Message.RecipientType.TO, toAddr );
		  message.setSubject(subj);
		  message.setSentDate(new java.util.Date());
		  message.setContent(cont+pwd, "text/plain");


	Transport.send(message);
	//  out.println("Thanks for sending mail!");
//	 response.sendRedirect("home.jsp");

// response.sendRedirect("index.jsp?createstas=success");


try{
        	Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
           Statement st=con.createStatement();
           int i=st.executeUpdate("update register set Password='"+pwd+"' where email='"+maild+"'");
           if (i==0)
           {
        	   response.sendRedirect("register.jsp?createstaf=fail");
           }
           else
           {
        	   response.sendRedirect("register.jsp?createstas=success");
        	  
           }
}
catch(Exception e){}
         

} catch (MessagingException e) {
	throw new RuntimeException(e);
}
%>
</body>
</html>