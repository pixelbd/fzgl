<%@ page language="java"  pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��Ӱ���...</title>
    
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
alert("������������ƣ�");
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
            <td  height="30" class="style1" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;��:</td>
            <td>
            <% if (chej.equals("")) { %>
              <select name="cj" class="Sytle_select">
                  <option value="41" <%if (chej.equals("41"))  out.print("selected");%>>֣�ݼ��޳���&nbsp;</option>
                  <option value="42" <%if (chej.equals("42"))  out.print("selected");%>>��ɽ���޳���&nbsp;</option>
                  <option value="43" <%if (chej.equals("43"))  out.print("selected");%>>�������޳���&nbsp;</option>
                  <option value="44" <%if (chej.equals("44"))  out.print("selected");%>>֣�����ᳵ��&nbsp;</option>
                </select>&nbsp;*
              <% } else { %>
                <input name="cj" type="hidden" value=<%=chej%>>
               <%  if (chej.equals("41")) { %> ֣�ݼ��޳��� <% } %>
               <%  if (chej.equals("42")) { %> ��ɽ���޳��� <% } %>
               <%  if (chej.equals("43")) { %> �������޳��� <% } %>
               <%  if (chej.equals("44")) { %> ֣�����ᳵ�� <% } %>
              <% } %>
           </td>
          </tr>
          <tr>  
            <td  height="30" class="style1" align="center">��������:</td>
            <td  ><input name="banzu" type="text" class="Sytle_text" size="15">&nbsp;*</td>
          </tr>
          <tr>
            <td colspan="2" height="30"  align="center" valign="middle"> 
            <input name="cj" type="hidden" value="<%=chej%>" >
                <input name="Button" type="button" class="Style_button" value="��&nbsp;&nbsp;��" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="Style_button" value="��&nbsp;&nbsp;�� ">                
                <input name="myclose" type="button" class="Style_button"  value="��&nbsp;&nbsp;��"
				 onClick="javascrip:window.close()">
                 </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">��ǰ������Ӱ�����Ϣ.</font> <font color="#15600B">ע����<font color="#ff0080">&nbsp;*</font>&nbsp;�ŵ���ĿΪ���������ʡ�ԡ�</font></div>
  </td>
  </tr>
</table>

  </body>
</html>

