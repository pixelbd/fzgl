<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>记录设备修复时间...</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link href="Css/stylerjhinsert.css" rel="stylesheet">
<script language="javascript">
   function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
   if(rtn!=null) field.value=rtn;
   return;
   }
function Mycheck()
{
if (form1.xfsj.value=="")
{ alert("请输入设备修复时间！");form1.xfsj.focus();return;}

form1.submit();}
</script>
<style type="text/css">
<!--
   body {
	margin-left: 0px; 
	margin-top: 0px;
      }
   .style1 { color: #334094 }
   .style2 { color: #669999 }
-->
</style>
</head>

<body background="Images/bg2.gif">
       <%        
          Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
          Statement Smts; 
          ResultSet Rs;
          if (Con != null)
          {
            	
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
           
          if (request.getParameter("id") != null) {
          String id = request.getParameter("id");
          String sql = "select * from sbwx  where id='" +id + "'";
          Rs = Smts.executeQuery(sql);
          Rs.first(); 
       %>

<table align="center" width="557" height="160" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/sbxfsj.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
     <form ACTION="sbgl/inssbxftj.jsp" METHOD="POST" name="form1">
      <table width="559" height="60"  border="0" align="center" cellpadding="-2" cellspacing="0">
      <input name="id" type="hidden" value="<%=id%>">
          <tr align="left">
            <td  height="30" align="center" class="style1">设备修复时间: </td>
             <td  class="style1"   >
             <input type="text" name="xfsj" class="Sytle_text"  onDBLClick="loadCalendar(this)">&nbsp;*</td>
                <td ><font color="#15600B">[输入格式："年-月-日 时间" 如：2008-10-01 17:10]</font></td>
             <td   class="style1"  > </td>
	  	  </tr>
	  	  <tr>
	  	      <td height="30" colspan="3" ><div align="center">
                <input name="Button" type="button" class="Style_button" value="提&nbsp;&nbsp;交" onClick="Mycheck()">
                <input name="myclose" type="button" class="Style_button" id="myclose" value="关&nbsp;&nbsp;闭"
				 onClick="javascrip:window.close()">
                </div></td>
          </tr>
        </table>
        </form>
      </td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">当前正在编号[ <%=Rs.getString("code")%>]设备故障修复情况...</font></div>
  
  </td>
  </tr>
</table>
<%}}  %>
  </body>
</html>

