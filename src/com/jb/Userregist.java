package com.jb;
import java.sql.*;
import java.io.*;
import java.util.*;
import java.sql.Connection;
import com.mysql.jdbc.Driver;


public class Userregist {
	private Userinfo userinfo;
	private Connection con;

	public Userregist()
	{
		String CLASSFORNAME="org.gjt.mm.mysql.Driver";
		String SERVANDDB="jdbc:mysql://localhost/user";
		String USER="root";
		String PSW="123";
		
		try
		{
			Class.forName(CLASSFORNAME);
			con=DriverManager.getConnection(SERVANDDB,USER,PSW);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void setuserinfo(Userinfo userinfo)
	{	
		this.userinfo=userinfo;
	}
	
	public void regist()throws Exception
	{
		String reg="insert into guest values(?,?,?,?,?,?)";
		
		PreparedStatement pstmt=con.prepareStatement(reg);
		
		try 
		{
		pstmt.setString(1,userinfo.getuserid());
		pstmt.setString(2,userinfo.getname());
		pstmt.setString(3,userinfo.getpassword());
		pstmt.setString(4,userinfo.gettruename());
		pstmt.setString(5,userinfo.getdept());
		pstmt.setString(6,userinfo.getzw());
		pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			throw e;
		}
	
	}
}
