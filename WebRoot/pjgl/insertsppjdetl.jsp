<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>insert record</title>
    
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
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/pjgl","root","123"); 
          Statement Smts; 
         
  
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
          request.setCharacterEncoding("gb2312");
          
          String chej=request.getParameter("cj");
          String tabname="";
          if (chej.equals("zz")) { tabname="sppjzz"; } 
             else { if (chej.equals("ys")) { tabname="sppjys"; }  
                    else { if (chej.equals("ly")) { tabname="sppjly"; } }
                  }
                  
          String rq=request.getParameter("rq");
          String pjmc=request.getParameter("pjmc");
          String xinghao=request.getParameter("xinghao");
          String pjbh=request.getParameter("pjbh"); 
          String chexing=request.getParameter("chexing");
          String chehao=request.getParameter("chehao");
          String zzcdh=request.getParameter("zzcdh");
          String zzsj=request.getParameter("zzsj");
          String guzhang=request.getParameter("guzhang");
          String shuliang=request.getParameter("shuliang");
          String chuli=request.getParameter("chuli");
          String bw=request.getParameter("bw"); 
          String sql = "Select max(num) as num From "+ tabname+" where rq='"+rq+"'";
		  ResultSet rs = Smts.executeQuery(sql);
		if (rs.next())
			maxId = rs.getString(1);
		if (maxId == null)
			maxId =  rq.replace("-", "") + "0001";
		else {
			maxId = maxId.trim();
			ID = Integer.parseInt(maxId.substring(maxId.length() - 5));
			maxId = maxId.substring(0, maxId.length() - 5)
			+ String.format("%05d", ID + 1);
		}
		
        
          sql="Insert into "+tabname+" (num,rq,pjmc,xinghao,pjbh,chexing,chehao,zzcdh,zzsj,guzhang,shuliang,chuli,bw) values('"+maxId+"','"+rq+"','"+pjmc+"','"+xinghao+"','"+pjbh+"','"+chexing+"','"+chehao+"','"+zzcdh+"','"+zzsj+"','"+guzhang+"','"+shuliang+"','"+chuli+"','"+bw+"')";
          int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("��¼����ʧ��");
              window.close();
              </script>
              <%   response.sendRedirect("insertsppj.jsp"); %>
          <%}else{%>
              <script language="javascript">
              alert("��¼����ɹ���");
              window.opener.location.reload();  //ˢ�¸������е���ҳ
              
              </script>
           <%   response.sendRedirect("insertsppj.jsp"); %>
           <%} %>
  </body>
</html>
