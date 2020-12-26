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
    
    <title>My JSP 'addwdtj.jsp' starting page</title>
    
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
	      int ID=0;
	      Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/wjdb","root","123"); 
          Statement Smts; 
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
          
          lzwUpload.setPageContext(pageContext);
          String tabname="";
          String filepath="";
          if ((lzwUpload.getParameter("wdlb") != null)) 
          {
           if (lzwUpload.getParameter("wdlb").equals("1")) {  tabname="jswd"; filepath="E:\\jswd\\"; }
           if (lzwUpload.getParameter("wdlb").equals("2")) {  tabname="aqwd"; filepath="E:\\aqwd\\"; }
           if (lzwUpload.getParameter("wdlb").equals("3")) {  tabname="qtwd"; filepath="E:\\qtwd\\"; }
          }
          
          String rq=lzwUpload.getParameter("rq");
          String bw=lzwUpload.getParameter("bw");
          String tdb=new String(lzwUpload.getParameter("tdb").getBytes("iso-8859-1")); 
          String tdbnian=lzwUpload.getParameter("tdbnian");
          String tdbhao=lzwUpload.getParameter("tdbhao");
          String tlj=new String(lzwUpload.getParameter("tlj").getBytes("iso-8859-1")); 
          String tljnian=lzwUpload.getParameter("tljnian");
          String tljhao=lzwUpload.getParameter("tljhao");
          String bt=new String(lzwUpload.getParameter("bt").getBytes("iso-8859-1")); 
          String zy=new String(lzwUpload.getParameter("zy").getBytes("iso-8859-1")); 
          String file=lzwUpload.getParameter("file");
          
          String saveFile = new String((new File(lzwUpload.getParameter("file_filename")).getName()).getBytes("iso-8859-1"));
          
          String sql = "Select max(id) as num From "+ tabname;
          
      if (Con!= null)
      {
          try
          {
		  ResultSet rs = Smts.executeQuery(sql);
		  
		  String wd="";
		  
		  if (tabname.equals("jswd"))
		  {  wd =  "JS"; 	}
          if (tabname.equals("aqwd"))
		  {  wd =  "AQ"; 	}
          if (tabname.equals("qtwd")) 
		  {  wd =  "QT"; 	}
          
		 
		 if (rs.next())
			maxId = rs.getString(1);
		if (maxId == null)
			maxId = wd+ tdbnian + "0001";
		else {
			maxId = maxId.trim();
			ID = Integer.parseInt(maxId.substring(maxId.length() - 5));
			maxId = maxId.substring(0, maxId.length() - 5)
			+ String.format("%05d", ID + 1);
		}
	sql = "Insert into  "+ tabname+" (id,rq,bw,tdb,tdbnian,tdbhao,tlj,tljnian,tljhao,bt,zy,filename) values ('"+maxId+"','"+rq+"','"+bw+"','"+tdb+"','"+tdbnian+"','"+tdbhao+"','"+tlj+"','"+tljnian+"','"+tljhao+"','"+bt+"','"+zy+"','"+saveFile+"')";  	  

       int rtn=Smts.executeUpdate(sql);
   
       if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
<%}else{ 
    lzwUpload.setPageContext(pageContext);
    if (lzwUpload.getParameter("Submit") != null) {
	lzwUpload.uploadToFile("file","",filepath);
	out.println("<script >alert('上传完毕');</script>");  
} else { out.println("<script >alert('上传未能完成');</script>");   }
 %>
             <script language="javascript">
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
