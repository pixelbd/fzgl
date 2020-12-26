<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>配件入出库处理,并对库存进行更新</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
<% request.setCharacterEncoding("gb2312");%> 

  <body>
<%
          Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/pjgl","root","123"); 
          Statement Smts; 
          ResultSet Rs1,Rs2;
          int CountR1,CountR2;
          
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
          
          request.setCharacterEncoding("gb2312");
          
          String kcsql="";
          String pjk="";
          if (request.getParameter("pjk")!=null) pjk=new String(request.getParameter("pjk"));
         
          String tab1="";
          String tab2="";
          String tab3="";
           
          //kc 识别操作是入库还是出库kc=1是入库kc=2是出库
          String kc=request.getParameter("kc");
          String rcks="";
          if  (kc.equals("1")) { rcks=request.getParameter("rks"); }               
          if  (kc.equals("2")) { rcks=request.getParameter("cks"); }
          
          String pjbh=request.getParameter("pjbh");
          
          // 确定库存信息查询条件
          if (pjk.equals("1")) { kcsql="select * from pjkczz where id='"+pjbh+"'"; tab1="rukuzz"; tab2="chukuzz"; tab3="pjkczz";}
          if (pjk.equals("2")) { kcsql="select * from pjkcys where id='"+pjbh+"'"; tab1="rukuys"; tab2="chukuys"; tab3="pjkcys";}
          if (pjk.equals("3")) { kcsql="select * from pjkcly where id='"+pjbh+"'"; tab1="rukuly"; tab2="chukuly"; tab3="pjkcly";}
          if (pjk.equals("4")) { kcsql="select * from pjkczl where id='"+pjbh+"'"; tab1="rukuzl"; tab2="chukuzl"; tab3="pjkczl";}
          if (pjk.equals("5")) { kcsql="select * from pjkcd where id='"+pjbh+"'"; tab1="rukud"; tab2="chukud"; tab3="pjkcd";}
          
          //其他需要的参数
          String pjname=request.getParameter("pjname");
          String rq=request.getParameter("rq");
          String dw=request.getParameter("dw"); 
          String dj=request.getParameter("dj");
          String czy=request.getParameter("czy");
        
          String sql="";
          
          //先执行入出库操作
          if  (kc.equals("1")) {sql="Insert into "+tab1+" (id,name,rq,rukus,czy) values ('"+pjbh+"','"+pjname+"','"+rq+"','"+rcks+"','"+czy+"')";}
          if  (kc.equals("2")) {sql="Insert into "+tab2+" (id,name,rq,chukus,czy) values ('"+pjbh+"','"+pjname+"','"+rq+"','"+rcks+"','"+czy+"')";}
     %>tab2<%=tab2 %>;kc<%=kc %>;sql<%=sql %><%
     
        int rtn1= Smts.executeUpdate(sql);

          //查询库存信息中是否有,如有则修改,如无则插入库存记录
        
         Rs1  = Smts.executeQuery(kcsql);
          Rs1.last();
          CountR1 = Rs1.getRow();
          if (CountR1>0) {
            if  (kc.equals("1")) {sql="Update "+ tab3+" SET  qcs=qcs,rks=rks+"+rcks+",jcs=jcs+"+rcks+ " where id='"+pjbh+"'";}
            if  (kc.equals("2")) {sql="Update  "+tab3+" SET  qcs=qcs,cks=cks+"+rcks+",jcs=jcs-"+rcks+ " where id='"+pjbh+"'";}
           } else {
           if  (kc.equals("1")) {sql="Insert into "+tab3+" (id,name,qcs,rks,cks,jcs) values('"+pjbh+"','"+pjname+"','0','"+rcks+"','0','"+rcks+"')";}
               
          }
            			  	  			
          int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
            <jsp:forward page="pjgl.jsp?page=1&kc=<%=kc%>"></jsp:forward>      
          <%}else{%>
              <script language="javascript">
              alert("记录保存成功！");

              window.openr.location.reload();
              </script>
            <jsp:forward page="pjgl.jsp?page=1&kc=<%=kc%>"></jsp:forward>   
           <%} %>
  </body>
</html>

