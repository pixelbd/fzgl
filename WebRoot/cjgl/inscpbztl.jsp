<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'inscpbztl.jsp' starting page</title>
    
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
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
          Statement Smts; 
          ResultSet rs;
  
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
          request.setCharacterEncoding("gb2312");
          
          String tabname="cpzlbz";
          String str="CP";
          
          String bz=request.getParameter("bz");
          String kf=request.getParameter("kf");
          String fl=request.getParameter("fl");
          String xz=request.getParameter("xz");
          String gyx=request.getParameter("gyx");
          
          if (fl.equals("�ֳ����"))  str=str+"1";
          if (fl.equals("�ֳ��ƶ�"))  str=str+"2";
          if (fl.equals("��������"))  str=str+"3";
          if (fl.equals("����"))  str=str+"4";
          if (fl.equals("ת���"))  str=str+"5";
          if (fl.equals("��������"))  str=str+"6";
          if (fl.equals("�ƶ���"))  str=str+"7";
          if (fl.equals("�����ƶ����"))  str=str+"8";
          if (fl.equals("�ֶ�"))  str=str+"9";
          if (fl.equals("�������"))  str=str+"10";  
          if (fl.equals("HMIS��Ϣ¼��"))  str=str+"11";  
               
          
          String sql = "Select max(code)  From "+ tabname+" where fl='"+fl+"'";
		  rs = Smts.executeQuery(sql);
          if (rs.next())
			maxId = rs.getString(1);
		  if (maxId == null)
			maxId = str+"-" + "00001";
          else {
			maxId = maxId.trim();
			ID = Integer.parseInt(maxId.substring(maxId.length() - 5));
			maxId = maxId.substring(0, maxId.length() - 5)
			+ String.format("%05d", ID + 1);
		    }
          
          sql="Insert into "+tabname+" (code,bz,fl,kf,xz,gyx) values('"+maxId+"','"+bz+"','"+fl+"','"+kf+"','"+xz+"','"+gyx+"')";
          int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("��¼����ʧ��");
              window.close();
              </script>
              <%   response.sendRedirect("inscpbz.jsp"); %>
          <%}else{%>
              <script language="javascript">
              alert("��¼����ɹ���");
              window.opener.location.reload();  //ˢ�¸������е���ҳ
               
              </script>
           <%   response.sendRedirect("inscpbz.jsp"); %>
           <%} %>

  </body>
</html>
