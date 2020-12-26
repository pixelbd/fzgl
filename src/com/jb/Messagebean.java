package com.jb;


import java.sql.Connection;
import java.sql.*;
import java.util.*;
import java.lang.*;

public class Messagebean 
{
    private Connection con;
    Messagevo msg;

    public Messagebean()
    {
    	String CLASSFORNAME="org.git.mm.mysql.Driver";
    	String SERVANDDB="jdbc:mysql://localhost/message?characterEncoding=gb2312";
    	String USER="root";
    	String PWD="123";
    	try{
    		Class.forName(CLASSFORNAME);
    		con=DriverManager.getConnection(SERVANDDB,USER,PWD);
    	}
    	catch(Exception e){
    		e.printStackTrace();
    	}
    }

    public void setMessage(Messagevo msg)
    {
    	this.msg=msg;
    }
    
    public void addMessage()throws Exception
    {
    	try
    	{
    		PreparedStatement stm=con.prepareStatement("insert into liuyan values(?,?,?,?)");
    		stm.setString(1,msg.getTitle());
    		stm.setString(4,msg.getName());
    		stm.setDate(3,new java.sql.Date(new java.util.Date().getTime()));
    		stm.setString(2,msg.getContent());
    		try 
    		{
    			stm.executeQuery();
    		}
    		catch(Exception e)
    		{
    			
    		}
    		con.close();
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		throw e;
    	}
    }
    
    public Collection getMessage() throws Exception
    {
    	Collection ret=new ArrayList();
    	try
    	{
    		Statement stm=con.createStatement();
    		ResultSet result=stm.executeQuery("select count(*) from liuyan");
    		int message_count=0;
    		if (result.next())
    		{
    			message_count=result.getInt(1);
    			result.close();
    		}
    		if (message_count>0)
    		{
    			result=stm.executeQuery("select * from liuyan order by time desc");
    			
    			while(result.next())
    			{
    				String title=result.getString("title");
    				String name=result.getString("name");
    				String content=result.getString("content");
    				java.sql.Date date=result.getDate("time");
    				Messagevo message=new Messagevo();
    				message.setName(name);
    				message.setTitle(title);
    				message.setContent(content);
    				message.setDate(date);
    				ret.add(message);
    			}
    			
    			result.close();
    			stm.close();
    		}
    		con.close();
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		throw e;
    	}
    	return ret;
    }
    
}
