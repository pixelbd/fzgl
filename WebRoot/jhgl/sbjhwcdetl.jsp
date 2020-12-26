<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'sbjhwcdetl.jsp' starting page</title>
    
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
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/jhgl","root","123"); 
          Statement Smts; 
          ResultSet rs;
  
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
          request.setCharacterEncoding("gb2312");
          
          
          String tabname=request.getParameter("tabname");
         
          String rq=request.getParameter("rq");
          String cxgtc=request.getParameter("cxgtc");
          String cxgtn=request.getParameter("cxgtn");
          String cxgtnx=request.getParameter("cxgtnx");
          String cxgtx=request.getParameter("cxgtx");
          String cxgtg=request.getParameter("cxgtg"); 
          String cxgtk=request.getParameter("cxgtk");
          String cxgtt=request.getParameter("cxgtt");
          String cxgtp=request.getParameter("cxgtp");
          String cxgtpb=request.getParameter("cxgtpb");
          String cxgt70c=request.getParameter("cxgt70c"); 
          String cxgt70nx=request.getParameter("cxgt70nx");
          String cxgt70p=request.getParameter("cxgt70p");
          String cxgt70k=request.getParameter("cxgt70k");
          String cxgtd=request.getParameter("cxgtd");
          String cxgtdl1=request.getParameter("cxgtdl1");
          String cxgtx2kh=request.getParameter("cxgtx2kh");
          String cxgtx6k=request.getParameter("cxgtx6k");
          String cxgtgk2=request.getParameter("cxgtgk2");
          String cxgtgt=request.getParameter("cxgtgt");
          String cxgtg120=request.getParameter("cxgtg120");
          String cxgtgzha=request.getParameter("cxgtgzha");
          String cxzbg=request.getParameter("cxzbg");
          String cxzbk=request.getParameter("cxzbk");
          String cxzbgk2=request.getParameter("cxzbgk2");
          String cxzbgt=request.getParameter("cxzbgt");
          String cxzbg120=request.getParameter("cxzbg120");
          String cxzbgzha=request.getParameter("cxzbgzha");
          
          String dxgtc=request.getParameter("dxgtc");
          String dxgtn=request.getParameter("dxgtn");
          String dxgtnx=request.getParameter("dxgtnx");
          String dxgtx=request.getParameter("dxgtx");
          String dxgtg=request.getParameter("dxgtg"); 
          String dxgtk=request.getParameter("dxgtk");
          String dxgtt=request.getParameter("dxgtt");
          String dxgtp=request.getParameter("dxgtp");
          String dxgtpb=request.getParameter("dxgtpb");
          String dxgt70c=request.getParameter("dxgt70c"); 
          String dxgt70nx=request.getParameter("dxgt70nx");
          String dxgt70p=request.getParameter("dxgt70p");
          String dxgt70k=request.getParameter("dxgt70k");
          String dxgtd=request.getParameter("dxgtd");
          String dxgtdl1=request.getParameter("dxgtdl1");
          String dxgtx2kh=request.getParameter("dxgtx2kh");
          String dxgtx6k=request.getParameter("dxgtx6k");
          String dxgtgk2=request.getParameter("dxgtgk2");
          String dxgtgt=request.getParameter("dxgtgt");
          String dxgtg120=request.getParameter("dxgtg120");
          String dxgtgzha=request.getParameter("dxgtgzha");
          String dxzbg=request.getParameter("dxzbg");
          String dxzbk=request.getParameter("dxzbk");
          String dxzbgk2=request.getParameter("dxzbgk2");
          String dxzbgt=request.getParameter("dxzbgt");
          String dxzbg120=request.getParameter("dxzbg120");
          String dxzbgzha=request.getParameter("dxzbgzha");
          
          String sql="Insert into "+tabname+" (rq,cxgtc,cxgtn,cxgtnx,cxgtx,cxgtg,cxgtk,cxgtt,cxgtp,cxgtpb,cxgt70c,cxgt70nx,cxgt70p,cxgt70k,cxgtd,cxgtdl1,cxgtx2kh,cxgtx6k,cxgtgk2,cxgtgt,cxgtg120,cxgtgzha,cxzbg,cxzbk,cxzbgk2,cxzbgt,cxzbg120,cxzbgzha,dxgtc,dxgtn,dxgtnx,dxgtx,dxgtg,dxgtk,dxgtt,dxgtp,dxgtpb,dxgt70c,dxgt70nx,dxgt70p,dxgt70k,dxgtd,dxgtdl1,dxgtx2kh,dxgtx6k,dxgtgk2,dxgtgt,dxgtg120,dxgtgzha,dxzbg,dxzbk,dxzbgk2,dxzbgt,dxzbg120,dxzbgzha) values('"+rq+"','"+cxgtc+"','"+cxgtn+"','"+cxgtnx+"','"+cxgtx+"','"+cxgtg+"','"+cxgtk+"','"+cxgtt+"','"+cxgtp+"','"+cxgtpb+"','"+cxgt70c+"','"+cxgt70nx+"','"+cxgt70p+"','"+cxgt70k+"','"+cxgtd+"','"+cxgtdl1+"','"+cxgtx2kh+"','"+cxgtx6k+"','"+cxgtgk2+"','"+cxgtgt+"','"+cxgtg120+"','"+cxgtgzha+"','"+cxzbg+"','"+cxzbk+"','"+cxzbgk2+"','"+cxzbgt+"','"+cxzbg120+"','"+cxzbgzha+"','"+dxgtc+"','"+dxgtn+"','"+dxgtnx+"','"+dxgtx+"','"+dxgtg+"','"+dxgtk+"','"+dxgtt+"','"+dxgtp+"','"+dxgtpb+"','"+dxgt70c+"','"+dxgt70nx+"','"+dxgt70p+"','"+dxgt70k+"','"+dxgtd+"','"+dxgtdl1+"','"+dxgtx2kh+"','"+dxgtx6k+"','"+dxgtgk2+"','"+dxgtgt+"','"+dxgtg120+"','"+dxgtgzha+"','"+dxzbg+"','"+dxzbk+"','"+dxzbgk2+"','"+dxzbgt+"','"+dxzbg120+"','"+dxzbgzha+"')";
          int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
              <%   response.sendRedirect("scrw.jsp?page=4&subpg=1"); %>
          <%}else{%>
              <script language="javascript">
              alert("记录保存成功！");
              window.opener.location.reload();  //刷新父窗口中的网页
              </script>
           <%   response.sendRedirect("scrw.jsp?page=4&subpg=1"); %>
           <%} %>
  </body>
</html>
