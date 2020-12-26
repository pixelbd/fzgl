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
    
    <title>My JSP 'insdxgztj.jsp' starting page</title>
    
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
<%        lzwUpload.setPageContext(pageContext);
	      
          String maxId = null;
	      int ID=0;
	      
	      Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
          Statement Smts; 
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
          
          lzwUpload.setPageContext(pageContext);
          
          String rq=lzwUpload.getParameter("rq");
          String cx=lzwUpload.getParameter("cx");
          String ch=lzwUpload.getParameter("ch");
          String bz=lzwUpload.getParameter("bz");
          String cj=lzwUpload.getParameter("cj");
          String fxrid=lzwUpload.getParameter("fxrid");
          String fxr=new String(lzwUpload.getParameter("fxrname").getBytes("iso-8859-1")); 
          String bzcode=lzwUpload.getParameter("bzcode");
          String bw1=new String(lzwUpload.getParameter("bw1").getBytes("iso-8859-1")); 
          String bw2=new String(lzwUpload.getParameter("bw2").getBytes("iso-8859-1")); 
          String gzms=new String(lzwUpload.getParameter("gzms").getBytes("iso-8859-1"));
          String tpjs1=new String(lzwUpload.getParameter("tpjs1").getBytes("iso-8859-1"));
          String tpjs2=new String(lzwUpload.getParameter("tpjs2").getBytes("iso-8859-1"));
          String pic1=lzwUpload.getParameter("pic1");
          String pic2=lzwUpload.getParameter("pic2");
          
          
          String saveFile1="";
          String saveFile2="";
          String filepath="E:\\Apache Tomcat 5.5\\webapps\\fzgl\\dxgzpic\\";
           
          
          if ((pic1!=null)&&(!pic1.equals("")))  saveFile1 = new String((new File(lzwUpload.getParameter("pic1_filename")).getName()).getBytes("iso-8859-1"));
          if ((pic2!=null)&&(!pic2.equals("")))  saveFile2 = new String((new File(lzwUpload.getParameter("pic2_filename")).getName()).getBytes("iso-8859-1"));
          
          
          String sql = "Select max(id) as num From dxgz";
          
          
      if (Con!= null)
      {
          try
          {
		  ResultSet rs = Smts.executeQuery(sql);
		
		if (rs.next())
			maxId = rs.getString(1);
		if (maxId == null)
			maxId =  rq.replace("-", "") + "001";
		else {
			maxId = maxId.trim();
			ID = Integer.parseInt(maxId.substring(maxId.length() - 5));
			maxId = maxId.substring(0, maxId.length() - 5)
			+ String.format("%05d", ID + 1);
		}
        
        if (saveFile1!="") saveFile1=maxId+saveFile1;
        if (saveFile2!="") saveFile2=maxId+saveFile2;
       if (!bz.equals("")&&(bz!=null))  sql = "Insert into  dxgz (id,rq,fxr,fxrid,cj,bw1,bw2,bz,gzms,cx,ch,tpjs1,tpjs2,pic1,pic2) values ('"+maxId+"','"+rq+"','"+fxr+"','"+fxrid+"','"+cj+"','"+bw1+"','"+bw2+"','"+bz+"','"+gzms+"','"+cx+"','"+ch+"','"+tpjs1+"','"+tpjs2+"','"+saveFile1+"','"+saveFile2+"')";  	  
       else if (!bzcode.equals("")&&(bzcode!=null))  sql = "Insert into  dxgz (id,rq,fxr,fxrid,cj,bw1,bw2,bz,gzms,cx,ch,tpjs1,tpjs2,pic1,pic2) values ('"+maxId+"','"+rq+"','"+fxr+"','"+fxrid+"','"+cj+"','"+bw1+"','"+bw2+"','"+bzcode+"','"+gzms+"','"+cx+"','"+ch+"','"+tpjs1+"','"+tpjs2+"','"+saveFile1+"','"+saveFile2+"')";  	  

       
       int rtn=Smts.executeUpdate(sql);
       if(rtn==0){%>
              <script language="javascript">
              alert("数据库记录保存失败");
              window.close();
              </script>
       <%}else{ 
       lzwUpload.setPageContext(pageContext);
    if (lzwUpload.getParameter("Submit") != null) {
	if ((pic1!=null)&&(!pic1.equals(""))) lzwUpload.uploadToFile("pic1",saveFile1,filepath);
	if ((pic2!=null)&&(!pic2.equals(""))) lzwUpload.uploadToFile("pic2",saveFile2,filepath);
	out.println("<script >alert('典型故障信息上传完毕');</script>"); 
	
	} else { out.println("<script >alert('图片上传未能完成');</script>");   }
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
