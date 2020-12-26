<%@ page language="java"  import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加设备基础信息...</title>
    
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
if (formup.made.value=="")
{ alert("请输入设备制造时间！"); formup.made.focus(); return;}
if (formup.mc.value=="")
{ alert("请输入设备名称！"); formup.mc.focus(); return;}
if (formup.code.value=="")
{ alert("请输入设备编号！"); formup.code.focus(); return;}
if (formup.fl.value=="")
{ alert("请选择设备类别！"); formup.fl.focus(); return;}
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
   function changebz()
   { formbz.submit();}
   </script>
<% 
//参数:zjid质检员身份证号,chej车间代号,code班组代号,gzcode故障编码,fl故障分类,ms故障描述等
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
     String bz="";
     if (request.getParameter("bz")!=null)  bz=new String(request.getParameter("bz"));
     String chejstr="";
     String chej="";
     if (request.getParameter("cj")!=null)  chej=new String(request.getParameter("cj"));
     if (chej.equals("41")) chejstr="郑州检修";
     if (chej.equals("42")) chejstr="月山检修";
     if (chej.equals("43")) chejstr="洛阳检修";
     if (chej.equals("44")) chejstr="郑州轮轴";
     
     String sqlbz="select bz,code from banzu where cj='"+chej+"' and code<>'' order by code";
     
     if(islog) {
      if (((String)session.getAttribute("deptment")).equals("41")) chejstr="郑州检修";
      if (((String)session.getAttribute("deptment")).equals("42")) chejstr="月山检修";
      if (((String)session.getAttribute("deptment")).equals("43")) chejstr="洛阳检修";
      if (((String)session.getAttribute("deptment")).equals("44")) chejstr="郑州轮轴"; 
      
      if (((String)session.getAttribute("deptment")).equals("admin")
           || ((String)session.getAttribute("deptment")).equals("22")
           || ((String)session.getAttribute("zw")).equals("3")
           || ((String)session.getAttribute("zw")).equals("cjadmin")) 
   { 
    //系统管理员、技术员、车间管理员、车间安全员有权修改设备信息（车间安全员只能修改本车间设备信息）
  
    int CountR = 0;
    
    //查人事信息中班组表中班组信息
     %>

<table align="center" width="557" height="260" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
  <td width="557"   valign="top">
  <table align="center" width="557" height="90"  bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2"  >
  <tr>
    <td width="557" height="70" valign="top" colspan="2">
    <table  width="100%" height="70"  border="0" cellpadding="-2" cellspacing="-2" background="Images/tjsbxx.gif">
    <tr><td></td></tr>  
    </table> 
    </td>
   </tr>
  <tr>
  <% if (((String)session.getAttribute("deptment")).equals("41") || ((String)session.getAttribute("deptment")).equals("42")
        || ((String)session.getAttribute("deptment")).equals("43") || ((String)session.getAttribute("deptment")).equals("44"))
    {  %>
    <td width="557" height="30" valign="top">设备使用车间：<font color="#ff0080"><%=chejstr%></font></td>
 <% } else {%>
 <td align="left" width="50%">
 <table  width="100%" height="30"   align="center" cellpadding="-2" cellspacing="-2">
    <tr>
    <td width="" height="30" valign="top"><span class="style1">设备使用车间</span></td>
    <td align="center">
    <div>
    <form ACTION="sbgl/inssbxx.jsp" name=form1 METHOD="POST">
    <select name="cj"   class="Sytle_select" onchange="change1()">
     &nbsp;<option value="">请选择设备所属车间</option>
     <option <%if (chej.equals("41")) out.print("selected"); %> value="41">郑州检修车间</option>
     <option <%if (chej.equals("42")) out.print("selected"); %> value="42">月山检修车间</option>
     <option <%if (chej.equals("43")) out.print("selected"); %> value="43">洛阳检修车间</option>
     <option <%if (chej.equals("44")) out.print("selected"); %> value="44">郑州轮轴车间</option>
     </select>&nbsp;&nbsp;&nbsp;&nbsp;</form>
    </div>
    </td>
    
  </tr>
  </table>

 </td>
 <% } %>

 <td width="50%">
  <div>     
    <table width="100%" height="30"    align="center" cellpadding="-2" cellspacing="-2">
    <tr><td align="left">
    <div>
    <form ACTION="sbgl/inssbxx.jsp" name=formbz METHOD="POST">
    <input type="hidden" name="cj" value="<%=chej%>">
    <select name="bz"   class="Sytle_select" onchange="changebz()">
    <option value=""><font color="#ff0000">请选择设备使用班组&nbsp;</font></option>
    <%
       if (Con!= null)
       {
           try
           {  
           Rs = Smts.executeQuery(sqlbz);
           Rs.last();
           int i = 0;
           CountR = Rs.getRow();
           Rs.first();
           if (CountR>0)
           {
               while (!Rs.isAfterLast())
               {      
               %>
               <option  <%if (bz.equals(Rs.getString("code"))) out.print("selected"); %> value="<%=Rs.getString("code")%>"><%=Rs.getString("bz")%>&nbsp;</option>
               <% 
				Rs.next();
				i++;
			    } 
			}
			}
        catch (SQLException e)
        {
            out.println("error!");
        }
        finally {  Con.close(); }
        }
	%>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;</form>
    </div>
    </td>
    
  </tr>
  </table>
  </div>
  </td>
 <tr>
</tr>
</table>
<table align="center" width="557"  bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>  <form ACTION="sbgl/inssbxxtj.jsp" METHOD="POST" name="formup">
  <input type="hidden" name="bz" value="<%=bz%>"> <!-- bz班组名称 -->
    <input type="hidden" name="cj" value="<%=chej%>">     <!-- 车间名称 --> 
          <td>
            <table><tr>
            <td width="10%" height="35" ><span class="style1">设备名称</span></td>
            <td width="20%"><input width="10" name="mc" type="text" class="Sytle_text" id="cx" size="20">&nbsp;*</td>
            <td width="10%" height="35" ><span class="style1">设备编号</span></td>
            <td width="20%"><input width="10" name="code" type="text" class="Sytle_text" id="cx" size="20">&nbsp;*</td>
            </tr>
            <tr>
            <td width="10%" class="style1">设备型号</td>
            <td width="30%"><input width="20" name="xh" type="text" class="Sytle_text" id="ch" size="20">&nbsp;</td>
            <td width="10%" class="style1">设备类别</td>
            <td width="20%">
            <select name="fl"   class="Sytle_select">
               <option value="">设备分类</option>
               <option value="A">A类设备</option>
               <option value="B">B类设备</option>
               <option value="C">C类设备</option>
            </select>&nbsp;*
            </td>
            </tr>
            </table>
            </td>
          </tr>
           <tr align="left"> <td>
            <table>
             <tr>
                <td  height="40" align="left" class="style1" >设备制造时间 </td>
                <td class="style1" >
                <input type="text" name="made" class="Sytle_text"   onDBLClick="loadCalendar(this)">&nbsp;*</td>
                <td  class="style1" ></td>
                <td  height="35" ><span class="style1">设备制造厂家</span></td>
            <td width="20%"><input width="10" name="work" type="text" class="Sytle_text" id="cx" size="20">&nbsp;</td>
            
             </tr>
            </table>
            </td> 
            </form></td>
            </tr>
          <tr>
            <td  height="50" valign="bottom"   align="center">
            <input name="Button" type="button" class="Style_button" value="提&nbsp;&nbsp;交" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="Style_button" value="重&nbsp;&nbsp;置 ">                
                <input name="myclose" type="button" class="Style_button" id="myclose" value="关&nbsp;&nbsp;闭" onClick="javascrip:window.close()">
                 </td>
          </tr>
        </table>
      
  </tr>
  <tr>
  <td  height="60">
  <div><font color="#D43939">当前正在输入设备基本信息.</font></div>
  <div><font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr>
</table>
</td>
</tr>
</table>
<% 
} else {%> <script language="javascript">
              alert("您无此操作权限！");
              window.close();
            </script>
        <% } } else {%> <script language="javascript">
              alert("未登录,请重新登录！");
              window.close();
            </script>
        <% }%>
  </body>
</html>
