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
    
    <title>addrsglxx</title>
    
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
	     
	      Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
          Statement Smts; 
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
          
          lzwUpload.setPageContext(pageContext);
          
          String sql="";
          String tabname=lzwUpload.getParameter("tabname");
          String cj=lzwUpload.getParameter("cj");
          String name=new String(lzwUpload.getParameter("name").getBytes("iso-8859-1")); 
          String id=lzwUpload.getParameter("id");
          String sex=new String(lzwUpload.getParameter("sex").getBytes("iso-8859-1")); 
          String mm=new String(lzwUpload.getParameter("mm").getBytes("iso-8859-1")); 
          String birthday=lzwUpload.getParameter("birthday");
          String workday=lzwUpload.getParameter("workday");
          String workcard=lzwUpload.getParameter("workcard");
          String yibao=lzwUpload.getParameter("yibao");
          String jg=new String(lzwUpload.getParameter("jg").getBytes("iso-8859-1")); 
          String zz=new String(lzwUpload.getParameter("zz").getBytes("iso-8859-1")); 
          String xl=new String(lzwUpload.getParameter("xl").getBytes("iso-8859-1")); 
          String xx=new String(lzwUpload.getParameter("xx").getBytes("iso-8859-1")); 
          String zw=new String(lzwUpload.getParameter("zw").getBytes("iso-8859-1")); 
          String bz=lzwUpload.getParameter("bz");
          String gz=new String(lzwUpload.getParameter("gz").getBytes("iso-8859-1")); 
          String zg=new String(lzwUpload.getParameter("zg").getBytes("iso-8859-1")); 
          String zc=new String(lzwUpload.getParameter("zc").getBytes("iso-8859-1")); 
          String jl=new String(lzwUpload.getParameter("jl").getBytes("iso-8859-1"));
          String zaig=lzwUpload.getParameter("zaig");
          String pic=lzwUpload.getParameter("pic");
          
          String saveFile="";
          String filepath="E:\\Apache Tomcat 5.5\\webapps\\fzgl\\dtxxpic";
          if ((pic!=null)&&(!pic.equals("")))
          {  saveFile = new String((new File(lzwUpload.getParameter("pic_filename")).getName()).getBytes("iso-8859-1"));}
          
          if ((workday.equals("")) || (birthday.equals("")))  sql = "Insert into  "+tabname+" (id,name,sex,mm,workcard,yibao,jg,zz,xl,xx,zw,bz,gz,zg,zc,jl,picpath) values ('"+id+"','"+name+"','"+sex+"','"+mm+"','"+workcard+"','"+yibao+"','"+jg+"','"+zz+"','"+xl+"','"+xx+"','"+zw+"','"+bz+"','"+gz+"','"+zg+"','"+zc+"','"+jl+"','"+zaig+"','"+saveFile+"')";  	  
          else sql = "Insert into  "+tabname+" (id,name,sex,mm,birthday,workday,workcard,yibao,jg,zz,xl,xx,zw,bz,gz,zg,zc,jl,zaig,picpath) values ('"+id+"','"+name+"','"+sex+"','"+mm+"','"+birthday+"','"+workday+"','"+workcard+"','"+yibao+"','"+jg+"','"+zz+"','"+xl+"','"+xx+"','"+zw+"','"+bz+"','"+gz+"','"+zg+"','"+zc+"','"+jl+"','"+zaig+"','"+saveFile+"')";  	  
        
      if (Con!= null)
      {
          try
          { 
        int rtn=Smts.executeUpdate(sql);
       if(rtn==0){%>
              <script language="javascript">
              alert("数据库记录保存失败");
              window.close();
              </script>
       <%}else{ 
       lzwUpload.setPageContext(pageContext);
    if (lzwUpload.getParameter("Submit") != null) {
	if ((pic!=null)&&(!pic.equals(""))) lzwUpload.uploadToFile("pic",saveFile,filepath);
	   out.println("<script>alert('人事信息上传完毕');</script>"); 
	} else { out.println("<script>alert('照片上传未能完成');</script>"); }
 %>
             <script language="javascript">
             window.close();
             window.opener.location.reload();
              </script>
 <%   response.sendRedirect("inszg.jsp?cj="+cj); %>
       <%} }
          catch (SQLException e)
            		{    
            		     out.println(sql);
            		     out.println("有错误,请重新上传!");
            		}
            		finally
            		{
            		     Con.close();
            		}
     } %>				

  </body>
</html>
