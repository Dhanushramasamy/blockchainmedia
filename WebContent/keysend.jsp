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
String skey=request.getParameter("skey");

String maild1=request.getParameter("emailid1");
String usern1=request.getParameter("usern1");
String skey1=request.getParameter("skey1");

final String username = "sampledemoprojects@gmail.com";
final String password = "pondyit2013";
final String subj="Welcome To Join Online Social Network";
final String cont="Dear "+usern+"   : 	Get your Key : ";
final String br=" ";
final String cont1="Your Partner Name : "+usern1+"   : 	Your Partner Email : "+maild1+" : ";

Properties props = new Properties();
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.host", "smtp.gmail.com");
props.put("mail.smtp.port", "587");


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
		  message.setContent(cont+skey+br+cont1, "text/plain");


	Transport.send(message);

         

} catch (MessagingException e) {
	throw new RuntimeException(e);
}
//response.sendRedirect("userhome.jsp?labels=requestedfriends");
response.sendRedirect("keysend1.jsp?emailid="+maild+"&usern="+usern+"&skey="+skey+"&emailid1="+maild1+"&usern1="+usern1+"&skey1="+skey1);
%>
</body>
</html>