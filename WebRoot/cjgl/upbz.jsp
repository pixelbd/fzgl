<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改班组信息...</title>
    
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
function Mycheck()
{
if (form1.bz.value=="")
{ 
alert("请输入班组名称！");
form1.bz.focus();
return;
}

form1.submit();
}
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
          String   code="";
          if (Con != null)
          {
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
           
          if ((request.getParameter("code") != null)) {
           code = request.getParameter("code"); }
          
          String sql = "select * from banzu where code='" + code + "'";
          Rs = Smts.executeQuery(sql);
          Rs.first(); 
                
          request.setCharacterEncoding("gb2312");
          
          
         %>
<table align="center" width="557" height="260" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/tjbz.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="cjgl/upbzdetl.jsp" METHOD="POST" name="form1">
      <input name="code" type="hidden"  value="<%=code%>">
      <table width="559" height="86"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr>  
            <td  height="30" class="style1" align="center">车&nbsp;&nbsp;&nbsp;&nbsp;间:</td>
            <td>
               <select name="cj" class="Sytle_select">
                  <option value="41" <%if (Rs.getString("cj").equals("41"))  out.print("selected");%>>郑州检修车间&nbsp;</option>
                  <option value="42" <%if (Rs.getString("cj").equals("42"))  out.print("selected");%>>月山检修车间&nbsp;</option>
                  <option value="43" <%if (Rs.getString("cj").equals("43"))  out.print("selected");%>>洛阳检修车间&nbsp;</option>
                  <option value="44" <%if (Rs.getString("cj").equals("44"))  out.print("selected");%>>郑州轮轴车间&nbsp;</option>
                </select>
            </td>
          </tr>
          <tr>  
            <td  height="30" class="style1" align="center">班组名称:</td>
            <td  ><input name="bz" type="text" class="Sytle_text" size="15" value="<%=Rs.getString("bz")%>"> </td>
          </tr>
          <tr>
            <td colspan="2" height="30"  align="center" valign="middle"> 
                <input name="Button" type="button" class="Style_button" value="保&nbsp;&nbsp;存" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="Style_button" value="重&nbsp;&nbsp;置 ">                
                <input name="myclose" type="button" class="Style_button"  value="关&nbsp;&nbsp;闭"
				 onClick="javascrip:window.close()">
                 </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">当前正在修改班组信息.</font> <font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr>
</table>
<%  }   %>
  </body>
</html>

