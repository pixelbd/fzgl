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
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/wtk","root","123"); 
          Statement Smts; 
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
          
          request.setCharacterEncoding("gb2312");
          
          String tabname="";
         
          if ((request.getParameter("ID1") != null)) 
          {
           tabname = request.getParameter("ID1"); 
          }
          
          String tcrq=request.getParameter("tcrq");
          String jjrq=request.getParameter("jjrq");
          
          String wt=request.getParameter("wt");
          String fzr=request.getParameter("fzr");
          String cs=request.getParameter("cs");
          String wtlb=request.getParameter("wtlb"); 
          String bz=request.getParameter("bz");
          
          String sql = "Select max(num) as num From "+ tabname+" where tcrq='"+tcrq+"'";
          
  
      if (Con!= null)
      {
          try
          {
		  ResultSet rs = Smts.executeQuery(sql);
		  
		 
		 if (rs.next())
			maxId = rs.getString(1);
		if (maxId == null)
			maxId = tcrq.replace("-", "") + "01";
		else {
			maxId = maxId.trim();
			ID = Integer.parseInt(maxId.substring(maxId.length() - 5));
			maxId = maxId.substring(0, maxId.length() - 5)
			+ String.format("%05d", ID + 1);
		     }
		  if ((jjrq.equals(""))||(jjrq==null))
		  {sql = "Insert into  "+ tabname+" (num,wt,wtlb,cs,fzr,tcrq,jjrq,bz) values ('"+maxId+"','"+wt+"','"+wtlb+"','"+cs+"','"+fzr+"','"+tcrq+"',"+null+",'"+bz+"')";  	  
		  } else{
		  sql = "Insert into  "+ tabname+" (num,wt,wtlb,cs,fzr,tcrq,jjrq,bz) values ('"+maxId+"','"+wt+"','"+wtlb+"','"+cs+"','"+fzr+"','"+tcrq+"','"+jjrq+"','"+bz+"')";  	  
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
          <jsp:forward page="inswtk.jsp">
          <jsp:param name="ID1" value="<%=tabname %>" />
          </jsp:forward>             
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
