<%@ page language="java" import="java.sql.*,java.io.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="lzwUpload" class="lzwBean.LzwUploadBean" scope="page" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'uploaddyhtl.jsp' starting page</title>
    
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
          lzwUpload.setPageContext(pageContext);
	      
          String maxId = null;
	      int ID=0;
	      
	      Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/hygl","root","123"); 
          Statement Smts; 
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
          
          lzwUpload.setPageContext(pageContext);
          
          String rq=lzwUpload.getParameter("rq");
          String scr=new String(lzwUpload.getParameter("scr").getBytes("iso-8859-1")); 
          String bm=new String(lzwUpload.getParameter("bm").getBytes("iso-8859-1")); 
          String file1=lzwUpload.getParameter("file1");
          String nian=lzwUpload.getParameter("nian");
          String yue=lzwUpload.getParameter("yue");
          String title=nian+"年"+yue+"月段验会议纪要";
          String saveFile1="";
          String filepath="e:\\dyh\\";
          
          if ((file1!=null)&&(!file1.equals("")))
          {  saveFile1 = new String((new File(lzwUpload.getParameter("file1_filename")).getName()).getBytes("iso-8859-1"));}
         
        
          String sql = "Select max(id)  From dyh  where rq='"+rq+"'";;
         if (Con!= null)
         {
          try
          {
		  ResultSet rs = Smts.executeQuery(sql);
		
		  if (rs.next())
			maxId = rs.getString(1);
		  if (maxId == null)
			maxId =  "DY"+rq.replace("-", "") + "01";
		  else {
			maxId = maxId.trim();
			ID = Integer.parseInt(maxId.substring(maxId.length() - 5));
			maxId = maxId.substring(0, maxId.length() - 5)
			+ String.format("%05d", ID + 1);
		   }
        
          sql = "Insert into  dyh (id,rq,scr,bm,title,filename) values ('"+maxId+"','"+rq+"','"+scr+"','"+bm+"','"+title+"','"+saveFile1+"')";  	  
      
          int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("数据库记录保存失败");
              window.close();
              </script>
          <%}else{ 
       lzwUpload.setPageContext(pageContext);
       if (lzwUpload.getParameter("Submit") != null) {
	   if ((file1!=null)&&(!file1.equals(""))) lzwUpload.uploadToFile("file1","",filepath);
	   out.println("<script >alert('段验会议纪要上传完毕');</script>"); 
	
	} else { out.println("<script >alert('文件上传未能完成');</script>");   }
   %>
             <script language="javascript">
             window.close();
             window.opener.location.reload();
              </script>
   <%} }
      catch (SQLException e)
            		{    
            		     out.println("有错误,请重新上传!");
            		}
            		finally
            		{
            		     Con.close();
            		}
     } %>				
				
  </body>
</html>
