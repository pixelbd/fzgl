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
    
    <title>My JSP 'addxxtj.jsp' starting page</title>
    
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
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/dtxx","root","123"); 
          Statement Smts; 
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
          
          lzwUpload.setPageContext(pageContext);
          
          String rq=lzwUpload.getParameter("rq");
          String fbbm=lzwUpload.getParameter("fbbm");
          String fbr=new String(lzwUpload.getParameter("fbr").getBytes("iso-8859-1")); 
          String bt=new String(lzwUpload.getParameter("bt").getBytes("iso-8859-1")); 
          String nr=new String(lzwUpload.getParameter("nr").getBytes("iso-8859-1")); 
          String tpjs1=new String(lzwUpload.getParameter("tpjs1").getBytes("iso-8859-1"));
          String tpjs2=new String(lzwUpload.getParameter("tpjs2").getBytes("iso-8859-1"));
          String tpjs3=new String(lzwUpload.getParameter("tpjs3").getBytes("iso-8859-1"));
          String tpjs4=new String(lzwUpload.getParameter("tpjs4").getBytes("iso-8859-1"));
          String tpjs5=new String(lzwUpload.getParameter("tpjs5").getBytes("iso-8859-1")); 
          String pic1=lzwUpload.getParameter("pic1");
          String pic2=lzwUpload.getParameter("pic2");
          String pic3=lzwUpload.getParameter("pic3");
          String pic4=lzwUpload.getParameter("pic4");
          String pic5=lzwUpload.getParameter("pic5");
          String saveFile1="";
          String saveFile2="";
          String saveFile3="";
          String saveFile4="";
          String saveFile5="";
          String filepath="E:\\Apache Tomcat 5.5\\webapps\\fzgl\\dtxxpic";
          
          if ((pic1!=null)&&(!pic1.equals("")))
          {  saveFile1 = new String((new File(lzwUpload.getParameter("pic1_filename")).getName()).getBytes("iso-8859-1"));}
          if ((pic2!=null)&&(!pic2.equals(""))) 
          {  saveFile2 = new String((new File(lzwUpload.getParameter("pic2_filename")).getName()).getBytes("iso-8859-1"));}
          if ((pic3!=null)&&(!pic3.equals("")))
          {  saveFile3 = new String((new File(lzwUpload.getParameter("pic3_filename")).getName()).getBytes("iso-8859-1"));}
          if ((pic4!=null)&&(!pic4.equals("")))
          {  saveFile4 = new String((new File(lzwUpload.getParameter("pic4_filename")).getName()).getBytes("iso-8859-1"));}
          if ((pic5!=null)&&(!pic5.equals("")))
          {  saveFile5 = new String((new File(lzwUpload.getParameter("pic5_filename")).getName()).getBytes("iso-8859-1"));}
    
          String sql = "Select max(id) as num From dtxx";
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
        
        if (saveFile1!="") saveFile1=maxId+"a"+saveFile1;
        if (saveFile2!="") saveFile2=maxId+"b"+saveFile2;
        if (saveFile3!="") saveFile3=maxId+"c"+saveFile3;
        if (saveFile4!="") saveFile4=maxId+"d"+saveFile4;
        if (saveFile5!="") saveFile5=maxId+"e"+saveFile5;

       sql = "Insert into  dtxx (id,rq,fbbm,fbr,bt,nr,tpjs1,tpjs2,tpjs3,tpjs4,tpjs5,pic1,pic2,pic3,pic4,pic5) values ('"+maxId+"','"+rq+"','"+fbbm+"','"+fbr+"','"+bt+"','"+nr+"','"+tpjs1+"','"+tpjs2+"','"+tpjs3+"','"+tpjs4+"','"+tpjs5+"','"+saveFile1+"','"+saveFile2+"','"+saveFile3+"','"+saveFile4+"','"+saveFile5+"')";  	  
       
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
	if ((pic3!=null)&&(!pic3.equals(""))) lzwUpload.uploadToFile("pic3",saveFile3,filepath);
	if ((pic4!=null)&&(!pic4.equals(""))) lzwUpload.uploadToFile("pic4",saveFile4,filepath);
	if ((pic5!=null)&&(!pic5.equals(""))) lzwUpload.uploadToFile("pic5",saveFile5,filepath);
	out.println("<script >alert('动态信息上传完毕');</script>"); 
	
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
