package com.database;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBCon 
{
	static Connection con=null;
	public static Connection getConnection()
	{
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dna_impl","root","root");
		
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
		
	}

}
