package com.jb;


	import java.sql.Connection;
	import java.sql.DriverManager;

	public class mysqluser {
	    private Connection con;
	    private String classname="org.gjt.mm.mysql.Driver";
	    private String url="jdbc:mysql://localhost/user";
	
	    public mysqluser(){
	    	try{
	    		Class.forName(classname);
	    	}
	    	catch(ClassNotFoundException e){
	    		e.printStackTrace();
	    	}
	    }
	    public Connection getCon(){    	  
	    	  try{
	    	      con=DriverManager.getConnection(url,"root","123");
	    	  }
	    	  catch(Exception e){
	    		  e.printStackTrace(System.err);
	    		  con=null;
	    	  }
	    	  return con;
	    }
	    public void closed(){
	    	try{
	    		if(con!=null)con.close();
	    	}
	    	catch(Exception e){e.printStackTrace();}    	
	    }
	}


