<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'inshytj.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
 <body> 
<% 
          String maxId = null;
	      int ID = 0;
	      
          Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/hygl","root","123"); 
          Statement Smts; 
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
          
          request.setCharacterEncoding("gb2312");
          
          String tabname="";
         
          if ((request.getParameter("ID1") != null)) 
          {
           tabname = request.getParameter("ID1"); 
          }
          
          String rq=request.getParameter("rq");
          String rt=request.getParameter("rt");
          String zcr=request.getParameter("zcr");
          String cjr=request.getParameter("cjr"); 
          String nr=request.getParameter("nr");
          
          String sql = "Select max(id) as num From "+ tabname+" where rq='"+rq+"'";
          
  
      if (Con!= null)
      {
          try
          {
		  ResultSet rs = Smts.executeQuery(sql);
		  
		  String meeting="";
		  
		  if ((tabname.equals("cjschzz")) || (tabname.equals("cjschys"))
		      || (tabname.equals("cjschly"))  || (tabname.equals("cjschzl")) 
		      ||(tabname.equals("dsch")))
		  {  meeting =  "SCH"; 	}
          if ((tabname.equals("cjlxhzz")) || (tabname.equals("cjlxhys"))
		      || (tabname.equals("cjlxhly"))  || (tabname.equals("cjlxhzl")) )
		  {  meeting =  "LXH"; 	}
          if ((tabname.equals("cjzlhzz")) || (tabname.equals("cjzlhys"))
		      || (tabname.equals("cjzlhly"))  || (tabname.equals("cjzlhzl")) )
		  {  meeting =  "ZLH"; 	}
          if ((tabname.equals("cjzthzz")) || (tabname.equals("cjzthys"))
		      || (tabname.equals("cjzthly"))  || (tabname.equals("cjzthzl")) )
		  {  meeting =  "ZTH"; 	}
          if (tabname.equals("dqth")) {  meeting =  "DQT"; 	}
		 
		 if (rs.next())
			maxId = rs.getString(1);
		if (maxId == null)
			maxId = meeting+ rq.replace("-", "") + "01";
		else {
			maxId = maxId.trim();
			ID = Integer.parseInt(maxId.substring(maxId.length() - 5));
			maxId = maxId.substring(0, maxId.length() - 5)
			+ String.format("%05d", ID + 1);
		}
		  
		  if ((tabname.equals("dqth"))||(tabname.equals("dsch")))  
	  	  {  String dd=request.getParameter("dd");  
             sql = "Insert into  "+ tabname+" (id,rq,rt,zcr,cjr,dd,nr) values ('"+maxId+"','"+rq+"','"+rt+"','"+zcr+"','"+cjr+"','"+dd+"','"+nr+"')";
	  	  }
	  	  else
	  	  {  sql = "Insert into  "+ tabname+" (id,rq,rt,zcr,cjr,nr) values ('"+maxId+"','"+rq+"','"+rt+"','"+zcr+"','"+cjr+"','"+nr+"')";  	  
	  	  }
        
          int rtn=Smts.executeUpdate(sql);
          
          if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
              
          <%}else{%>
              <script language="javascript">
              alert("记录保存成功！");
              window.close();
              window.opener.location.reload(); 
             </script>
          <%} 
          }
                   catch (SQLException e)
            		{    
            		     out.println("");
            		}
            		finally
            		{
            		     Con.close();
            		}
     } %>				
  </body>
</html>
