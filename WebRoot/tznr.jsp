<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>֪ͨ��ϸ����...</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
   <LINK href="Css/css1.css" type=text/css rel=stylesheet> 
  <body background="Images/bg2.gif">
  <% 
  String id="";
  String bumen="";
  int CountR=0;
  
  if (request.getParameter("id") != null)  	id = new String(request.getParameter("id"));
  String sql="select * from tongzhi where id='"+id+"'"; 
  
  Class.forName("org.gjt.mm.mysql.Driver").newInstance();
  Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/dtxx","root","123");
        
  Statement Smts; 
  ResultSet Rs;
  %>
  <table width="100%"  cellpadding="0" cellspacing="0">
  <%
  if (Con!= null)
  {
    try
    {
      Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
      Rs = Smts.executeQuery(sql);
            	
      Rs.last();
      CountR = Rs.getRow();
      Rs.first();
      if (CountR>0)
      {
  %>
      
      <tr><td height="40" valign="top" align="center"><img   height="40"  src="Images/tztitle.gif" border="0"> </td>
      </tr>
      <tr><td height="25" >��������:&nbsp;<%=Rs.getString("rq")%> </td>
      </tr>
      <tr>
         <td height="25">������λ:
          <%  if (Rs.getString("fbbm").equals("1"))  { bumen="���쵼";}
              if (Rs.getString("fbbm").equals("21")) { bumen="������";}
              if (Rs.getString("fbbm").equals("22")) { bumen="������";}
              if (Rs.getString("fbbm").equals("23")) { bumen="���ȿ�";}
              if (Rs.getString("fbbm").equals("24")) { bumen="���Ͽ�";}
              if (Rs.getString("fbbm").equals("25")) { bumen="�ʼ��";}
              if (Rs.getString("fbbm").equals("41")) { bumen="֣�ݼ��޳���";}
              if (Rs.getString("fbbm").equals("42")) { bumen="��ɽ���޳���";}
              if (Rs.getString("fbbm").equals("43")) { bumen="�������޳���";}
              if (Rs.getString("fbbm").equals("44")) { bumen="֣�����ᳵ��";}
          %><%=bumen%>
           
         </td>
      </tr>
      <tr>
         <td height="25">��&nbsp;��&nbsp;��:&nbsp;<%=Rs.getString("fbr")%></td>
      </tr>
      <tr>
         <td height="25">��&nbsp;׼&nbsp;��:&nbsp;<%=Rs.getString("pzr")%></td>
      </tr>
      <tr ><td height="25" >֪ͨ����:&nbsp;<%=Rs.getString("bt")%></td></tr>
      <tr><td  height="25" >֪ͨ����:&nbsp;</td></tr>
      <tr><td  ><textarea rows="12" cols="110"><%=Rs.getString("nr")%></textarea></td></tr>
     
      <% }
      }
      catch (SQLException e)
           {
            	out.println("!");
           }
           finally
           {
            	Con.close();
           }
        
        }%>
        
    <tr>
     <td height="25" align="center"><input name="Button" type="button" class="btn_grey" onClick="window.close();" value="�رմ���">&nbsp;&nbsp;
     </td>
    </tr>    
   </table>
  </body>
</html>
