package Loader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Load
{
	public Connection conn1()
	{
		Connection con1=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
		}

		catch(SQLException se)		{System.out.println("ERROR"+se);}

		catch(Exception e)		{System.out.println("ERROR"+e);}

		return con1;
	}

	public Connection conn2()
	{
		Connection con2=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
		}

		catch(SQLException se)		{System.out.println("ERROR"+se);}

		catch(Exception e)		{System.out.println("ERROR"+e);}

		return con2;
	}

	public Connection conndb()
	{
		Connection condb=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			condb=DriverManager.getConnection("jdbc:mysql://localhost:3306/wordfilter","root","root");
		}

		catch(SQLException se)		{System.out.println("ERROR"+se);}

		catch(Exception e)		{System.out.println("ERROR"+e);}

		return condb;
	}

}