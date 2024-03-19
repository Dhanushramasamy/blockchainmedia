package model;
import java.sql.Connection;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Loader.Load;
public class CommonModel {
	Load l=new Load();
	Connection con1=l.conn1();
	Connection con=l.conn1();
	  Date datex = new Date();
	  String currentdate=datex.toString();
	  
	 int state,st,loginok;
	
	public int create(String t1,String t2,String t3,String t4,String t5,String t6,String t7,String t8,String t9,String t10)
	{
		int SNO=0,gsno=0,member=0;
String gsnoz;
	
	try
		{
        Statement st1=con.createStatement();
		ResultSet rs1=st1.executeQuery("select max(Memberid) from register");
		if(rs1.next())
		  {
		  gsno=rs1.getInt(1);
		  gsno++;
		  System.out.println("registration failed"+gsno);
		  }
		  else
		  {
		  gsno=1;
		   }
        rs1.close();

        Statement st1z=con.createStatement();
		ResultSet rs1z=st1z.executeQuery("select * from register where Email='"+t3+"'");
		if(rs1z.next())
		  {
			
			System.out.println("registration failed");
		    
		  }
		else
		{
			 System.out.println("registration failed else"+gsno);
			Statement st2=con.createStatement();
		    st=st2.executeUpdate("insert into register values('"+gsno+"','"+t1+"','"+t2+"','"+t3+"','"+t3+"','"+t4+"','"+t5+"','"+t6+"','balaji','"+t7+"','"+currentdate+"','"+t8+"','"+t9+"','"+t10+"') ");
			st=st2.executeUpdate("insert into chatingmember values('"+gsno+"','"+gsno+"','"+t1+"','"+t3+"','offline')");
			st=st2.executeUpdate("insert into finalreport values('"+gsno+"','0','0','0','0','0')");
		    System.out.println("registration success");
		}
        
	
		}


	 	 catch(Exception e)
	 			{
	 				System.out.println("ERROR"+e);
	 			}

return st;
}
	
	//---------comments start
	
	public int postcomments(String t1,String t2,String t3)
	{
		int SNO=0,gsno=0;
String gsnoz;
	
	try
		{
        Statement st1=con.createStatement();
		ResultSet rs1=st1.executeQuery("select max(Commentid) from imgcomments");
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

			Statement st2=con.createStatement();
		    st=st2.executeUpdate("insert into imgcomments values('"+gsno+"','"+t1+"','"+t2+"','"+t3+"','"+currentdate+"') ");
		  //  System.out.println("registration success");
		
	
		}


	 	 catch(Exception e)
	 			{
	 				System.out.println("ERROR"+e);
	 			}

return st;
}
	//comments ends
	
	public int insertvalue(String t1,String t2,String t3,String t4,String t5,String t6,String t7)
	{
		int SNO=0,gsno=0;

	
	try
		{
        Statement st1=con.createStatement();
		ResultSet rs1=st1.executeQuery("select max(SNO) from indexing");
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


	Statement st2=con.createStatement();
    st=st2.executeUpdate("insert into indexing values('"+gsno+"','"+t1+"','"+t2+"','"+t3+"','"+t4+"','"+t5+"','"+t6+"','"+t7+"') ");
		}


	 	 catch(Exception e)
	 			{
	 				System.out.println("ERROR"+e);
	 			}

return st;
}
	
	public int addfilter(String t1,String t2)
	{
		int SNO=0,gsno=0;
String gsnoz;
	String ss="no image";
	try
		{
        Statement st1=con.createStatement();
		ResultSet rs1=st1.executeQuery("select max(wordid) from addword");
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

        Statement st2=con.createStatement();
	    st=st2.executeUpdate("insert into addword values('"+gsno+"','"+t1+"','"+t2+"','"+currentdate+"') ");
	    System.out.println("registration success");
        
	
		}


	 	 catch(Exception e)
	 			{
	 				System.out.println("ERROR"+e);
	 			}

return st;
}
	
	 public int requestupd(String t1,String t2,String n1,String e1,String n2,String e2,Integer skey)
	 	{
        int state11=0;
	 	try
	 		{
	         Statement st1=con.createStatement();
	 		 state11=st1.executeUpdate("update requestfriend set status='active' where memberid='"+t1+"' && requestid='"+t2+"'");
	 		 
	 	//	st=st1.executeUpdate("update anonymity set status='direct' where Memberid='"+t1+"' && activeid='"+t2+"' ");
	 		
	 		 
	 		int SNO=0,gsno=0;
	 		
			
			try
				{
		       
				ResultSet rs1=st1.executeQuery("select max(rid) from responsefriend");
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
			st=st1.executeUpdate("insert into responsefriend values('"+gsno+"','"+t2+"','"+t1+"','active','"+currentdate+"') ");
			st=st1.executeUpdate("insert into chatingkey values('"+gsno+"','"+t2+"','"+t1+"','active','"+skey+"','"+currentdate+"') ");
			
				}
	 		


	 	 catch(Exception e)
	 			{
	 				System.out.println("ERROR"+e);
	 			}
	 		 
	 		
		     }
	catch(Exception e)
	 	    {
	 	     System.out.println("ERROR"+e);
	 		}
	 		return state11;

         }
	//request friend-----
	 
	 //----------delet requested friends--
	 
	 public int requestdel(String t1,String t2)
	 	{
     int state11=0;
     
	 	try
	 		{
	         Statement st1=con.createStatement();
	 		 state11=st1.executeUpdate("update requestfriend set status='rejected' where memberid='"+t1+"' && requestid='"+t2+"'");
		     }
	catch(Exception e)
	 	    {
	 	     System.out.println("ERROR"+e);
	 		}
	 		return state11;

      }
	 
	 //delete requested friends-----
	 
	 
	 public int requestfriend(String t1,String t2)
		{
			int SNO=0,gsno=0;

		
		try
			{
	        Statement st1=con.createStatement();
			ResultSet rs1=st1.executeQuery("select max(rid) from requestfriend");
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


		Statement st2=con.createStatement();
	    st=st2.executeUpdate("insert into requestfriend values('"+gsno+"','"+t1+"','"+t2+"','inactive','"+currentdate+"') ");
			}


		 	 catch(Exception e)
		 			{
		 				System.out.println("ERROR"+e);
		 			}

	return st;
	}
	//---------userupdate
	 public int postimageupd(String t1,String t2,String t3,String t4)
	 	{
     int state11=0;
	 	try
	 		{
	         Statement st1=con.createStatement();
	 		 state11=st1.executeUpdate("update newpost set viewtype='"+t3+"' where Postid='"+t2+"' && Memberid='"+t1+"'");
	 		 
	 		 if(t3.equals("Sensitive"))
	 		 {
	 			 //System.out.println("Out1:"+t3);
	 		 }
	 		 else
	 		 {
	 			//System.out.println("Out2:"+t3);
	 			int SNO=0,gsno=0;
 				String ggg=null;
 				String ggga=null;
 				String ext=".png";
	 			try
				{
	 				
		        Statement st2=con.createStatement();
				ResultSet rs1=st2.executeQuery("select* from responsefriend where requestid='"+t1+"' && status='active' ");
		       //ResultSet rs1=st2.executeQuery("SELECT * FROM responsefriend where requestid='"+t1+"' && status='active' UNION ALL (select * from requestfriend where (requestid='"+t1+"') && status='active') ");
				while(rs1.next())
				  {
					ggg=rs1.getString(2);
				//	System.out.println("mainMember:"+ggg);
					try
					{
		 				
			        Statement st2a=con.createStatement();
					ResultSet rs1a=st2a.executeQuery("select* from responsefriend where requestid='"+ggg+"' && status='active' ");
					while(rs1a.next())
					  {
						ggga=rs1a.getString(2);
					//	System.out.println("linkMember:"+ggga);
					
						Statement st2a1=con.createStatement();
					    st=st2a1.executeUpdate("insert into viewpost values('"+t2+"','"+t1+"','"+ggga+"','"+t4+"','"+t2+ext+ "','"+currentdate+"','not set','0') ");	
						
					  }
					  
			        rs1a.close();
					}


				 	 catch(Exception e)
				 			{
				 				System.out.println("ERROR"+e);
				 			}
				  }
				  
		        rs1.close();


			
				}


			 	 catch(Exception e)
			 			{
			 				System.out.println("ERROR"+e);
			 			}
	 			//String queryString1 = "insert into viewpost values('"+t2+"','"+t1+"','"+ad11s+"','"+t3+"','"+finalimage+"','"+strDateNew+"','not set')"; 			
	 		 }
	 		 
	 		 state11=st1.executeUpdate("update viewpost set viewtype='"+t3+"' where Postid='"+t2+"' && Memberid='"+t1+"'");
		     }
	catch(Exception e)
	 	    {
	 	     System.out.println("ERROR"+e);
	 		}
	 		return state11;

      }
	//---------postimageupdate
	 public int upduser(String m1,String t1,String t2,String t3,String t4,String t5,String t6,String t8,String t9,String t10)
	 	{
     int state11=0;
     
	 	try
	 		{
	         Statement st1=con.createStatement();
	 		 state11=st1.executeUpdate("update register set Firstname='"+t1+"',Lastname='"+t2+"',Email='"+t3+"',Dob='"+t4+"',Gender='"+t5+"',Agree='"+t6+"',City='"+t8+"',Iam='"+t9+"',Working='"+t10+"' where memberid='"+m1+"'");
	 		state11=st1.executeUpdate("update enteruser set Email='"+t3+"' where memberid='"+m1+"'");
		     }
	catch(Exception e)
	 	    {
	 	     System.out.println("ERROR"+e);
	 		}
	 		return state11;

      }
}
