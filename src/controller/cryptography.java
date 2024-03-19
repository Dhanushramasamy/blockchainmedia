package controller;

import java.io.*;
import java.util.Date;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.*;
import javax.servlet.http.*;

import java.security.InvalidKeyException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import java.io.*;
import java.util.*;
import java.text.*;
import model.CommonModel;

public class cryptography extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException, ServletException
	{
		Connection con1=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		res.setContentType("text/html");
        int state,stquery,stquery1;
        
        Date datex = new Date();
  	  	//String currentdate=datex.toString();
        Format formatter= new SimpleDateFormat("dd.MM.yyyy.HH.mm.ss");
        Date date = new Date();
        String newDate = formatter.format(date);

		PrintWriter out=res.getWriter();
		//System.out.println("inside");
		KeyPairGenerator keygenerator = null;
		try {
			keygenerator = KeyPairGenerator.getInstance("RSA");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SecureRandom random = null;
		try {
			random = SecureRandom.getInstance("SHA1PRNG", "SUN");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchProviderException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		keygenerator.initialize(1024, random);

		KeyPair keypair = keygenerator.generateKeyPair();
		PrivateKey privateKey = keypair.getPrivate();
		PublicKey publicKey = keypair.getPublic();
		Cipher cipher = null;
		try {
			cipher = Cipher.getInstance("RSA");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			cipher.init(Cipher.ENCRYPT_MODE, publicKey);
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String st= req.getParameter("schat");
		
		String st1= req.getParameter("cmid");
		String st2= req.getParameter("cmname");
		String st3= req.getParameter("cmemail");
		String st4= req.getParameter("memid");
		String st5= req.getParameter("memname");
		String st6= req.getParameter("mememail");
		String st7= req.getParameter("securkey");
		
		
		
		
		byte[] cleartext = null;
		cleartext = st.getBytes();
		byte[] ciphertext = null;
		try {
			ciphertext = cipher.doFinal(cleartext);
		} catch (IllegalBlockSizeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (BadPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String encryptedmessage=ciphertext.toString();
		
		//System.out.println("the encrypted text is: " + encryptedmessage);
		
		//String encvalue=String.valueOf(encryptedmessage);
		//int eva=Integer.parseInt(encryptedmessage);
		
		try {
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		byte[] cleartext1 = null;
		try {
			cleartext1 = cipher.doFinal(ciphertext);
		} catch (IllegalBlockSizeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (BadPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String decryptedmessage=new String(cleartext1);
		//System.out.println("the decrypted cleartext is: " + decryptedmessage);
		
		
		
		
		int SNO=0,gsno=0,member=0;
		try
		{
        Statement st1a=con1.createStatement();
		ResultSet rs1=st1a.executeQuery("select max(chatid) from chatting");
		if(rs1.next())
		  {
		  gsno=rs1.getInt(1);
		  gsno++;
		 // System.out.println("registration failed"+gsno);
		  }
		  else
		  {
		  gsno=1;
		   }
        rs1.close();
       
        System.out.println(st1);//rmemid
		System.out.println(st2);//rmemname
		System.out.println(st3);//rmememail
		System.out.println(st4);//smemid
		System.out.println(st5);//smemname
		System.out.println(st6);//smememail
		System.out.println(st7);//skey
		int chno=gsno+1;
			 //System.out.println("registration failed else"+gsno);
			Statement st21=con1.createStatement();
		//	stquery=st21.executeUpdate("insert into sender values('"+gsno+"','Sent','"+st4+"','"+st5+"','"+st6+"','"+st7+"','"+encryptedmessage+"','"+decryptedmessage+"','"+currentdate+"') ");
		//	stquery1=st21.executeUpdate("insert into receiver values('"+gsno+"','Received','"+st1+"','"+st2+"','"+st3+"','"+st7+"','"+encryptedmessage+"','"+decryptedmessage+"','"+currentdate+"') ");
			stquery=st21.executeUpdate("insert into chatting values('"+gsno+"','Sent','"+st1+"','"+st2+"','"+st3+"','"+st4+"','"+st5+"','"+st6+"','"+st7+"','"+encryptedmessage+"','"+decryptedmessage+"','"+newDate+"') ");
			//stquery1=st21.executeUpdate("insert into chatting values('"+chno+"','Received','"+st4+"','"+st5+"','"+st6+"','"+st1+"','"+st2+"','"+st3+"','"+st7+"','"+encryptedmessage+"','"+decryptedmessage+"','"+currentdate+"') ");
			
		
        
	
		}


	 	 catch(Exception e)
	 			{
	 				System.out.println("ERROR"+e);
	 			}
	 	 res.sendRedirect("userhome.jsp?labels=startchat&stat=noth&securkey="+st7+"&cmid="+st1+"&cmname="+st2+"&cmemail="+st3+"&memid="+st4+"&memname="+st5+"&mememail="+st6+" ");

}
		}


