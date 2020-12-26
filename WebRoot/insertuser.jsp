<%@ page language="java"  import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加用户信息...</title>
    
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
if (formup.name.value=="")
{ alert("请输入用户登录名！"); formup.name.focus(); return;}
if (formup.truename.value=="")
{ alert("请输入用户真实姓名！"); formup.truename.focus(); return;}
if (formup.id.value=="")
{ alert("请输入用户身份证号！"); formup.id.focus(); return;}
formup.submit();}
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
    <script language="javascript">
   function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
   }
   function change1()
   { form1.submit();}
   function changeup()
   { formup.submit();}
   </script>
<% 

  Class.forName("org.gjt.mm.mysql.Driver").newInstance();
  Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123");  
  Statement Smts; 
  ResultSet Rs;
  Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);     
  
  request.setCharacterEncoding("gb2312"); 
  
  boolean islog=false;
  
  
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
 %>
 <%
   String dep="";   
   dep=(String)session.getAttribute("deptment");
   String cjzw="";
   cjzw=(String)session.getAttribute("zw");
   if ((islog) && (dep.equals("admin")||cjzw.equals("cjadmin")))
   { 
    String dept="";
    if (request.getParameter("dept")!=null)  dept=new String(request.getParameter("dept"));
 %>

<table align="center" width="557" height="310" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
  <td width="557"    valign="top">
  <table align="center" width="557" height="90"  bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2"  >
  <tr>
    <td width="557" height="70" valign="top" colspan="2">
    <table  width="100%" height="70"  border="0" cellpadding="-2" cellspacing="-2" background="Images/tjyhxx.gif">
    <tr><td></td></tr>  
    </table> 
    </td>
   </tr>
  <tr>
 <td align="left" width="50%">
    <table width="100%" height="30"   align="center" cellpadding="-2" cellspacing="-2">
    <tr><td align="center">
    <div>
    <%if ((!dep.equals("41"))&&(!dep.equals("42"))&&(!dep.equals("43"))&&(!dep.equals("44"))) { %>
    <form ACTION="insertuser.jsp" name=form1 METHOD="POST"><font color="#334094" >用户所属部门：</font>
    <select name="dept"   class="Sytle_select" onchange="change1()">
     &nbsp;
     <option value="" >请选择所属部门</option>
     <option value="1" <%if (dept.equals("1")) out.print("selected"); %>>段领导</option>
     <option value="21" <%if (dept.equals("21")) out.print("selected"); %>>验收室</option>
     <option value="22" <%if (dept.equals("22")) out.print("selected"); %>>技术科</option>
     <option value="23" <%if (dept.equals("23")) out.print("selected"); %>>调度科</option>
     <option value="24" <%if (dept.equals("24")) out.print("selected"); %>> 材料科</option>
     <option value="25" <%if (dept.equals("25")) out.print("selected"); %>>质检科</option>
     <option value="41" <%if (dept.equals("41")) out.print("selected"); %>>郑州检修车间</option>
     <option value="42" <%if (dept.equals("42")) out.print("selected"); %>>月山检修车间</option>
     <option value="43" <%if (dept.equals("43")) out.print("selected"); %>>洛阳检修车间</option>
     <option value="44" <%if (dept.equals("44")) out.print("selected"); %>>郑州轮轴车间</option>
     </select>&nbsp;&nbsp;&nbsp;&nbsp;
     </form>
     <% } %>
    </div>
    </td>
    </tr>
    </table>
 </td>
 </tr>
 <tr>
 <td width="50%">
  <div>     
    <table  width="100%" height="30"    align="center" cellpadding="-2" cellspacing="-2">
    <tr><td align="center">
    <div>
    <form ACTION="insusertj.jsp" name=formup METHOD="POST" >
    <%if (!dep.equals("")) { 
    %>
   
    &nbsp;
     <% if (dep.equals("41") ||dep.equals("42") ||dep.equals("43") ||dep.equals("44")) {  %> <font color="#334094" >车间职务：</font>
     <select name="cjzw"   class="Sytle_select" >
     <option value="">请选择车间职务</option>
     <option value="1">车间领导</option>
     <option value="2">计工员</option>
     <option value="3">安全员</option>
     <option value="4">技教员</option>
     <option value="5">材料员</option>
     <option value="9">质检员</option>
     <option value="6">技术专职</option>
     <option value="10">备品库管理员</option>
     <option value="7">生产调度</option>
     <option value="8">班组工长</option>
     <option value="">车间职工</option>
     </select>&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="hidden" name="dept" value="<%=dep%>">
    <% } else { 
     if (dept.equals("41") ||dept.equals("42") ||dept.equals("43") ||dept.equals("44")) {  %><font color="#334094" >车间职务：</font>
     <select name="cjzw"   class="Sytle_select" >
     <option value="">车间职工</option>
     <option value="cjadmin">车间级系统管理员</option>
     </select>&nbsp;&nbsp;&nbsp;&nbsp; <% } }%>
    <input type="hidden" name="dept" value="<%=dept %>">
     <% } else { %><% } %>
    </div>
    </td>
     </tr>
     </table>
     </div>
     </td> </tr>

 <tr>
 <td  >
<table align="center" width="557"  bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>  
  <td>
            <table>
            <tr>
            <td width="10%" height="35" ><span class="style1">姓名</span></td>
            <td width="20%"><input width="10" name="truename" type="text" class="Sytle_text" id="cx" size="20">&nbsp;*</td>
            <td width="10%" height="35" ><span class="style1">登录用户名</span></td>
            <td width="20%"><input width="10" name="name" type="text" class="Sytle_text" id="cx" size="20">&nbsp;*</td>
            </tr>
            <tr>
            <td width="10%" class="style1">身份证号</td>
            <td width="30%"><input width="20" name="id" type="text" class="Sytle_text" id="ch" size="20">&nbsp;</td>
            <td width="10%" class="style1">登录密码</td>
            <td width="20%">
            <input width="20" name="psw" type="text" class="Sytle_text" value="111111" size="20">&nbsp;
            </td>
            </tr>
            </table>
            </td>
          </tr>
      
          <tr>
            <td  height="50" valign="bottom"   align="center">
            <input name="Button" type="button" class="Style_button" value="提&nbsp;&nbsp;交" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="Style_button" value="重&nbsp;&nbsp;置 ">                
                <input name="myclose" type="button" class="Style_button" id="myclose" value="关&nbsp;&nbsp;闭" onClick="javascrip:window.close()">
                 </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="60">
  <div><font color="#D43939">当前正在输入系统用户信息.</font></div>
  <div><font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr>
</table>
</td>
</tr>
</table>
<%   } 
else {%> <script language="javascript">
              alert("您无此操作权限！");
              window.close();
            </script>
     <% }%>
  </body>
</html>
