<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>记录删除...</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <style type="text/css">
    <!--
      INPUT.Style_button {
	  BORDER-RIGHT: #334094 1px solid; BORDER-TOP: #334094 1px solid; FONT-SIZE: 9pt; BACKGROUND: #93A1F4; BORDER-LEFT: #334094 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #334094 1px solid;HEIGHT: 20px;width: 60px
       }
    -->  
    </style>	

  </head>
  
  <body >
  <% 
          Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/dtxx","root","123"); 
          Statement Smts; 
          
          String tabname="tongzhi";
          String code="";
          if (Con != null)
          {
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
          
          if ((request.getParameter("code") != null)) {  code = request.getParameter("code"); }
          
          String delsql = "delete from "+tabname+" where id='" + code + "'";
          
          int iCount = Smts.executeUpdate(delsql);
          if (iCount>0){
           %>  <table border="0" width="519" height="155" background="Images/notice.gif" >
                <tr><td height="40"></td></tr>
   				<tr>
   				<td  valign="center" align="left" >&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ffffff">执行的操作:删除记录.</font>
   				</td>
   				</tr>
   				<tr>
                <TD height="30" valign="center" align="center"><font face="黑体" color="#ffffff">删&nbsp;除&nbsp;操&nbsp;作&nbsp;成&nbsp;功&nbsp;!</font></TD>
                </tr>
                <tr>
                <td valign="top"><div align="center">
                <input name="myclose" class="Style_button" type="button" class="Style_button" id="myclose" value=" 关 闭 "
				 onClick="javascrip:window.close()">
                </div></td></TR>
                </table>
                <script language="javascript">
                 window.opener.location.reload();  //刷新父窗口中的网页
                 window.close;
                </script>
            <% 
          System.out.println("操作成功，已删除记录数为" + String.valueOf(iCount));
             }           
           else  { %> <%=delsql%> 操作不成功,未进行删除操作! <%  }
             } 
 %>
  </body>
</html>
