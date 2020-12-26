<%@ page language="java"  pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加班组...</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link href="Css/stylerjhinsert.css" rel="stylesheet">

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
<script language="javascript">
function Mycheck()
{
if (form1.banzu.value=="")
{ 
alert("请输入班组名称！");
form1.banzu.focus();
return;
}
form1.submit();
}
</script>
        <%        
         request.setCharacterEncoding("gb2312");
          
          String chej="";
          
          if ((request.getParameter("cj") != null)) {
          if (request.getParameter("cj").equals("zz")) chej ="41"; 
          if (request.getParameter("cj").equals("ys")) chej ="42"; 
          if (request.getParameter("cj").equals("ly")) chej ="43"; 
          if (request.getParameter("cj").equals("zl")) chej ="44"; 
          }
         %>

<table align="center" width="557" height="260" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/tjbzxx.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="cjgl/inbzdetl.jsp" METHOD="POST" name="form1">
      <table width="559" height="86"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr>  
            <td  height="30" class="style1" align="center">车&nbsp;&nbsp;&nbsp;&nbsp;间:</td>
            <td>
            <% if (chej.equals("")) { %>
              <select name="cj" class="Sytle_select">
                  <option value="41" <%if (chej.equals("41"))  out.print("selected");%>>郑州检修车间&nbsp;</option>
                  <option value="42" <%if (chej.equals("42"))  out.print("selected");%>>月山检修车间&nbsp;</option>
                  <option value="43" <%if (chej.equals("43"))  out.print("selected");%>>洛阳检修车间&nbsp;</option>
                  <option value="44" <%if (chej.equals("44"))  out.print("selected");%>>郑州轮轴车间&nbsp;</option>
                </select>&nbsp;*
              <% } else { %>
                <input name="cj" type="hidden" value=<%=chej%>>
               <%  if (chej.equals("41")) { %> 郑州检修车间 <% } %>
               <%  if (chej.equals("42")) { %> 月山检修车间 <% } %>
               <%  if (chej.equals("43")) { %> 洛阳检修车间 <% } %>
               <%  if (chej.equals("44")) { %> 郑州轮轴车间 <% } %>
              <% } %>
           </td>
          </tr>
          <tr>  
            <td  height="30" class="style1" align="center">班组名称:</td>
            <td  ><input name="banzu" type="text" class="Sytle_text" size="15">&nbsp;*</td>
          </tr>
          <tr>
            <td colspan="2" height="30"  align="center" valign="middle"> 
            <input name="cj" type="hidden" value="<%=chej%>" >
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
  <div><font color="#D43939">当前正在添加班组信息.</font> <font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr>
</table>

  </body>
</html>

