<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
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
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/jhgl","root","123"); 
          Statement Smts; 
          ResultSet rs;
  
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
          request.setCharacterEncoding("gb2312");
          
          String chej=request.getParameter("cj");
          String tabname="";
          if (chej.equals("zz")) { tabname="jxjhzz"; } 
             else { if (chej.equals("ys")) { tabname="jxjhys"; }  
                    else { if (chej.equals("ly")) { tabname="jxjhly"; } }
                  }
                  
          String rq=request.getParameter("rq");
          String apm=request.getParameter("apm");
          String cx=request.getParameter("cx");
          String ch=request.getParameter("ch");
          String dao=request.getParameter("dao"); 
          String wei=request.getParameter("wei");
          String hao=request.getParameter("hao");
          String xz=request.getParameter("xz");
          String xc=request.getParameter("xc");
          String qccxrq=request.getParameter("qccxrq"); 
          String qccxdw=request.getParameter("qccxdw");
          String qcdxrq=request.getParameter("qcdxrq");
          String qcdxdw=request.getParameter("qcdxdw");
          String lz=request.getParameter("lz");
          String zxj=request.getParameter("zxj");
          String zdl=request.getParameter("zdl");
          String zdf=request.getParameter("zdf");
          String cg=request.getParameter("cg");
          String qz=request.getParameter("qz");
          String bzq=request.getParameter("bzq");
          String hmisrq=request.getParameter("hmisrq");
          String bz=request.getParameter("bz");
          String bl=request.getParameter("bl");
          
          String sql = "Select max(id)  From "+ tabname+" where rq='"+rq+"'";
		  rs = Smts.executeQuery(sql);
          if (rs.next())
			maxId = rs.getString(1);
		  if (maxId == null)
			maxId =  rq.replace("-", "") + "01";
          else {
			maxId = maxId.trim();
			ID = Integer.parseInt(maxId.substring(maxId.length() - 5));
			maxId = maxId.substring(0, maxId.length() - 5)
			+ String.format("%05d", ID + 1);
		    }
          
          if (hmisrq.equals("")) sql="Insert into "+tabname+" (id,rq,apm,cx,ch,xz,xc,dao,wei,hao,qccxrq,qccxdw,qcdxrq,qcdxdw,lz,zxj,zdl,zdf,cg,qz,bzq,bz,bl) values('"+maxId+"','"+rq+"','"+apm+"','"+cx+"','"+ch+"','"+xz+"','"+xc+"','"+dao+"','"+wei+"','"+hao+"','"+qccxrq+"','"+qccxdw+"','"+qcdxrq+"','"+qcdxdw+"','"+lz+"','"+zxj+"','"+zdl+"','"+zdf+"','"+cg+"','"+qz+"','"+bzq+"','"+bz+"','"+bl+"')";
          else   sql="Insert into "+tabname+" (id,rq,apm,cx,ch,xz,xc,dao,wei,hao,qccxrq,qccxdw,qcdxrq,qcdxdw,lz,zxj,zdl,zdf,cg,qz,bzq,hmisrq,bz,bl) values('"+maxId+"','"+rq+"','"+apm+"','"+cx+"','"+ch+"','"+xz+"','"+xc+"','"+dao+"','"+wei+"','"+hao+"','"+qccxrq+"','"+qccxdw+"','"+qcdxrq+"','"+qcdxdw+"','"+lz+"','"+zxj+"','"+zdl+"','"+zdf+"','"+cg+"','"+qz+"','"+bzq+"','"+hmisrq+"','"+bz+"','"+bl+"')";
          int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
              <%   response.sendRedirect("insertrjh.jsp"); %>
          <%}else{%>
              <script language="javascript">
              alert("记录保存成功！");
              window.opener.location.reload();  //刷新父窗口中的网页
               
              </script>
           <%   response.sendRedirect("insertrjh.jsp"); %>
           <%} %>
  </body>
</html>
