<%@ page language="java"  import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加质检发现故障记录...</title>
    
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
if (formup.rq.value=="")
{ alert("请输入日期！");formup.rq.focus();return;}
if (formup.bzcode.value=="")
{ alert("请输入责任班组！");formup.bzcode.focus();return;}
if (formup.zrr.value=="")
{ alert("请选择责任人！");formup.zrr.focus();return;}

if (formup.flms.value=="")
{ alert("请选择故障类别！");formup.flms.focus();return;}
if (formup.ch.value=="")
{ alert("请输入车号或配件编号！");formup.ch.focus();return;}
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
   function change2()
   { form2.submit();}
   function changebz()
   { formbz.submit();}
   function changezg()
   { formzg.submit();}
   </script>
<% 
//参数:zjid质检员身份证号,chej车间代号,code班组代号,gzcode故障编码,fl故障分类,ms故障描述等
  Class.forName("org.gjt.mm.mysql.Driver").newInstance();
  Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123");  
  Statement Smts; 
  ResultSet Rs;
  Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);     
  request.setCharacterEncoding("gb2312"); 
  String zjname="";
  String zjid="";
  String chej="";
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
    if(islog) {
      if ((((String)session.getAttribute("deptment")).equals("41")
           || ((String)session.getAttribute("deptment")).equals("42")
           || ((String)session.getAttribute("deptment")).equals("43")
           || ((String)session.getAttribute("deptment")).equals("44"))
           &&((String)session.getAttribute("zw")).equals("9")) { 
           zjname=(String)session.getAttribute("usertrue");//质检员姓名,登录时确定
           zjid=(String)session.getAttribute("userid");//质检员身份号,登录时确定
           chej=(String)session.getAttribute("deptment");
    //此行调试时使用,由管理员代录故障时使用   if (((String)session.getAttribute("deptment")).equals("admin"))     zjname="";
  
    int CountR = 0;
    
    //查故障分类
    String sqlfl="select distinct fl from cpzlbz order by fl";
    //查故障分类描述
    String fl="";
    if (request.getParameter("fl")!=null)  fl=new String(request.getParameter("fl"));
    String flms="";
    if (request.getParameter("flms")!=null)  flms=new String(request.getParameter("flms"));
    
    String sqlflms="select * from cpzlbz where fl='"+fl+"' order by bz";
    //查人事信息中班组职工和班组代码
    String bz="";
    if (request.getParameter("bz")!=null)  bz=new String(request.getParameter("bz"));
    String zrr="";
    if (request.getParameter("zrr")!=null)  zrr=new String(request.getParameter("zrr"));
    String rstab="";
    if (chej.equals("41")) rstab="zhigongzz";
    if (chej.equals("42")) rstab="zhigongys";
    if (chej.equals("43")) rstab="zhigongly";
    if (chej.equals("44")) rstab="zhigongzl";
    String sqlbz="select bz,code from banzu where cj='"+chej+"'  order by bz";
    String bzcode="";
    if (request.getParameter("bzcode")!=null)  bzcode=new String(request.getParameter("bzcode"));
    String sqlzrr="select name,id from "+rstab+" where bz='"+bzcode+"' and bz<>'' order by name";
%>

<table align="center" width="557" height="260" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
    <td width="557"   valign="top">
<table align="center" width="557" height="90"  bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2"  >
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0" cellpadding="-2" cellspacing="-2" background="Images/tjzjjl.gif">
    <tr><td></td></tr>  
    </table> 
    </td>
   </tr>
  <tr>
    <td width="557" height="30" valign="top"><%if (!zjname.equals("")) { %>质检员：<font color="#ff0080"><%=zjname%></font>发现故障情况编辑 <% } %>
    </td>
  </tr>
</table>
<table align="center" width="557"   border="0" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
  <td>
  <div>     
    <table width="559" height="50"  border="0" align="center" cellpadding="-2" cellspacing="0">
    <tr><td colspan="2" height="25"  class="style1">故障情况:</td></tr>
    <tr><td>
    <div>
    <form ACTION="gzgl/inszjgz.jsp" name=form1 METHOD="POST">
    <input type="hidden" name="bzcode" value="<%=bzcode%>">
    <input type="hidden" name="zzr" value="<%=zrr%>">
    <select name="fl"   class="Sytle_select" onchange="change1()">
    
    <option value=""><font color="#ff0000">请选择故障所属部位&nbsp;</font></option>
    <%
       
       if (Con!= null)
       {
           try
           {
           
           Rs = Smts.executeQuery(sqlfl);
           Rs.last();
           int i = 0;
           CountR = Rs.getRow();
           Rs.first();
           if (CountR>0)
           {
               while (!Rs.isAfterLast())
               {      
               %>
               <option  <%if (fl.equals(Rs.getString("fl"))) out.print("selected"); %> value="<%=Rs.getString("fl")%>"><%=Rs.getString("fl")%>&nbsp;</option>
               <% 
				Rs.next();
				i++;
			    } 
			}
	%>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;</form>
    </div>
    </td>
    <td><div>
    <form ACTION="gzgl/inszjgz.jsp" name=form2 METHOD="POST">
    <input type="hidden" name="fl" value="<%=fl%>">
    <input type="hidden" name="bzcode" value="<%=bzcode%>">
    <input type="hidden" name="zzr" value="<%=zrr%>">
    <select name="flms" class="Sytle_select" onchange="change2()">
    <option value=""><font color="#ff0000">请选择故障描述&nbsp;</font></option>
    <%      Rs = Smts.executeQuery(sqlflms);
            Rs.last();
            i = 0;
            CountR = Rs.getRow();
            Rs.first();
            if (CountR>0)
            {
            	while (!Rs.isAfterLast())
            	{      
     %><option <%if (flms.equals(Rs.getString("code"))) out.print("selected"); %> value="<%=Rs.getString("code") %>" >[<%=Rs.getString("xz")%>][-<%=Rs.getString("kf")%>]<%=Rs.getString("bz") %></option>
     <% 
				Rs.next();
				i++;
				} 
			}
		%>  
   </select>&nbsp;&nbsp;&nbsp;&nbsp;
   </form></div>
  </td>
  </tr>
  </table>
  </div>
  </td>
  </tr>
  <tr>
  <td>
  <div>     
    <table width="559" height="50"  border="0" align="center" cellpadding="-2" cellspacing="-2">
    <tr><td colspan="2" height="25"  class="style1">责任认定情况:</td></tr>
    <tr><td>
    <div>
    <form ACTION="gzgl/inszjgz.jsp" name=formbz METHOD="POST">
    <input type="hidden" name="fl" value="<%=fl%>">
    <input type="hidden" name="flms" value="<%=flms%>">
    <select name="bzcode"   class="Sytle_select" onchange="changebz()">
    <option value=""><font color="#ff0000">请选择责任班组及责任人&nbsp;</font></option>
    <%
           Rs = Smts.executeQuery(sqlbz);
           Rs.last();
           i = 0;
           CountR = Rs.getRow();
           Rs.first();
           if (CountR>0)
           {
               while (!Rs.isAfterLast())
               {      
               %>
               <option  <%if (bzcode.equals(Rs.getString("code"))) out.print("selected"); %> value="<%=Rs.getString("code")%>"><%=Rs.getString("bz")%>&nbsp;</option>
               <% 
				Rs.next();
				i++;
			    } 
			}
	%>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;</form>
    </div>
    </td>
    
    <td><div>
    <form ACTION="gzgl/inszjgz.jsp" name=formzg METHOD="POST">
    <input type="hidden" name="bzcode" value="<%=bzcode%>">
    <input type="hidden" name="fl" value="<%=fl%>">
    <input type="hidden" name="flms" value="<%=flms%>">
    <select name="zrr" class="Sytle_select" onchange="changezg()">
    <option value=""><font color="#ff0000">请选择责任人&nbsp;</font></option>
    <%      Rs = Smts.executeQuery(sqlzrr);
            Rs.last();
            i = 0;
            CountR = Rs.getRow();
            Rs.first();
            if (CountR>0)
            {
            	while (!Rs.isAfterLast())
            	{      
     %><option <%if (zrr.equals(Rs.getString("id"))) out.print("selected"); %> value="<%=Rs.getString("id") %>" ><%=Rs.getString("name")%></option>
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
        }%>  
   </select>&nbsp;&nbsp;&nbsp;&nbsp;
   
   </form></div>
   
  </td>
  </tr>
  </table>
  </div>
  </td>
  </tr>
  <form ACTION="gzgl/inszjgzdetl.jsp" METHOD="POST" name="formup">
  <input type="hidden" name="bzcode" value="<%=bzcode%>"> <!-- bzcode班组编码 -->
    <input type="hidden" name="zjid" value="<%=zjid%>">     <!-- 质检员身份证号码 -->
    <input type="hidden" name="flms" value="<%=flms%>">     <!-- fl故障编码 -->
    <input type="hidden" name="zrr" value="<%=zrr%>">     <!-- 责任人身份证号码 -->
    <input type="hidden" name="cj" value="<%=chej%>">
         <!-- 车间代码 --> 
          <tr align="left">
            <td>
            <table>
             <tr>
                <td  height="40" align="left" class="style1" >日&nbsp;&nbsp;&nbsp;&nbsp;期 </td>
                <td class="style1" >
                <input type="text" name="rq" class="Sytle_text" id="rq" onDBLClick="loadCalendar(this)">&nbsp;*</td>
                <td  class="style1" >考核金额<input type="text" name="money" size="6" class="Sytle_text" value="0.00">元</td>
             </tr>
            </table>
            </td>
	  	  </tr>
	  	  <tr>
          <td>
            <table><tr>
            <td height="40" ><span class="style1">车&nbsp;&nbsp;&nbsp;&nbsp;型</span></td>
            <td ><input width="10" name="cx" type="text" class="Sytle_text" id="cx" size="10">&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="style1">车号/配件编号</td>
            <td ><input width="20" name="ch" type="text" class="Sytle_text" id="ch" size="20">&nbsp;*</td>
            </tr>
            </table>
            </td>
          </tr>
          <tr>
          <td>
            <table><tr>
          <td height="40"  align="left"><span class="style1">故障描述</span></td>
          <td align="left" colspan="6"><input name="gzms" type="text" class="Style_text" id="gzms" size="60">&nbsp;*</td>
          </tr></table>
          </td>
          </tr>
          <tr>
            <td colspan="7" ><div align="center">
            <input size="40" name="chejian" type="hidden" class="Style_text" value="<%=chej%>">
                <input name="Button" type="button" class="Style_button" value="提&nbsp;&nbsp;交" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="Style_button" value="重&nbsp;&nbsp;置 ">                
                <input name="myclose" type="button" class="Style_button" id="myclose" value="关&nbsp;&nbsp;闭" onClick="javascrip:window.close()">
                </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="60">
  <div><font color="#D43939">当前正在输入质检发现：
   <%if (chej.equals("41")) { %>郑州检修车间<%} 
   else {if (chej.equals("42")) { %>月山检修车间<%} 
   else {if (chej.equals("43")) { %>洛阳检修车间<%} 
   else {if (chej.equals("44")) { %>郑州轮轴车间<%}} }}%>故障情况...</font></div>
  <div><font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr>
</table>
</td>
</tr>
</table>
<% 
} else {%> <script language="javascript">
              alert("您不是质检员，不能执行此操作！");
              window.close();
            </script>
        <% } } else {%> <script language="javascript">
              alert("未登录,请重新登录！");
              window.close();
            </script>
        <% }%>
  </body>
</html>
