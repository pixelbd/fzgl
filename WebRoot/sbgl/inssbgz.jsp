<%@ page language="java"  import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加设备故障、维修记录...</title>
    
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
   if(rtn!=null) field.value=rtn;
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
   function Mycheck()
{
if (formup.sb.value=="")
{ alert("请选择故障设备！");form1.sb.focus();return;}
if (formup.syr.value=="")
{ alert("请选择设备使用人！");formzg.syr.focus();return;}
if (formup.tingj.value=="")
{ alert("请输入停机日期及时间！");formup.tingj.focus();return;}
if (formup.gz.value=="")
{ alert("请输入设备故障情况！");formup.gz.focus();return;}
formup.submit();}
   </script>
<% 
//参数:gzid工长身份证号,chej车间代号,code班组代号,gzcode故障编码,fl故障分类,ms故障描述等
  Class.forName("org.gjt.mm.mysql.Driver").newInstance();
  Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
  Connection Con2 = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
  
  Statement Smts; 
  Statement Smts2; 
  
  ResultSet Rs;
  Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
  Smts2 = Con2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
  request.setCharacterEncoding("gb2312"); 
  String gzname="";
  String gzid="";
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
           &&((String)session.getAttribute("zw")).equals("8")) { 
           gzname=(String)session.getAttribute("usertrue");//工长姓名,登录时确定
           gzid=(String)session.getAttribute("userid");//工长身份号,登录时确定
           chej=(String)session.getAttribute("deptment");
    //此行调试时使用,由管理员代录故障时使用   if (((String)session.getAttribute("deptment")).equals("admin"))     gzname="";
  
    int CountR = 0;
    
   //查故障分类描述
    String fl="";
    if (request.getParameter("fl")!=null)  fl=new String(request.getParameter("fl"));
    String sb="";
    if (request.getParameter("sb")!=null)  sb=new String(request.getParameter("sb"));
    
    
    //查人事信息中班组职工和班组代码
    String bzcode="";
    String syr="";
    if (request.getParameter("syr")!=null)  syr=new String(request.getParameter("syr"));
    String zgtab="";
    if (chej.equals("41")) zgtab="zhigongzz";
    if (chej.equals("42")) zgtab="zhigongys";
    if (chej.equals("43")) zgtab="zhigongly";
    if (chej.equals("44")) zgtab="zhigongzl";
    String sqlbz="select a.code,a.bz from banzu as a,(select bz from "+zgtab+" where id='"+gzid+"') as b where b.bz=a.code ";
    
    String sqlsyr="select a.name,a.id,b.bz as bz from "+zgtab+" as a,(select bz from "+zgtab+" where id='"+gzid+"') as b where a.bz=b.bz order by name";
    
    if (Con!= null)
       {
           try
           {
            Rs = Smts.executeQuery(sqlbz);
            Rs.first();
            bzcode=Rs.getString("code");
            String sqlsb="select mc,code,xh from sbxx where bz='"+bzcode+"'";
%>
<table align="center" width="557" height="260" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
    <td width="557"   valign="top">
<table align="center" width="557" height="90"  bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2"  >
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0" cellpadding="-2" cellspacing="-2" background="Images/tjsbgzxx.gif">
    <tr><td></td></tr>  
    </table> 
    </td>
   </tr>
  <tr>
    <td width="557" height="30" valign="top"><%if (!gzname.equals("")) { %>工长：<font color="#ff0080"><%=gzname%></font>【班组设备故障情况编辑】 <% } %>
    </td>
  </tr>
</table>
<table align="center" width="557"   border="0" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
  <td>
  <div>     
    <table width="559" height="50"  border="0" align="left" cellpadding="-2" cellspacing="0">
    <tr><td colspan="2" height="25"  class="style1">发生故障设备信息:</td></tr>
    <tr>
    <td  colspan="2" class="style1"><div>
    <form ACTION="sbgl/inssbgz.jsp" name=form2 METHOD="POST">
    <input type="hidden" name="syr" value="<%=syr%>">
    <select name="sb" class="Sytle_select" onchange="change2()">
    <option value=""><font color="#ff0000">请选择设备名称&nbsp;</font></option>
    <%     
            Rs= Smts2.executeQuery(sqlsb);
            Rs.last();
            int i = 0;
            CountR = Rs.getRow();
            Rs.first();
            if (CountR>0)
            {
            	while (!Rs.isAfterLast())
            	{      
     %><option <%if (sb.equals(Rs.getString("code"))) out.print("selected"); %> value="<%=Rs.getString("code") %>" >[<%=Rs.getString("mc")%>][<%=Rs.getString("code")%>][<%=Rs.getString("xh")%>]</option>
     <% 
				Rs.next();
				i++;
				} 
			}
		%>  
   </select>&nbsp;*&nbsp;&nbsp;&nbsp;
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
    <table width="559" height="50"  border="0" align="left" cellpadding="-2" cellspacing="-2">
    <tr><td  height="25" width="50%" class="style1">
    <form ACTION="sbgl/inssbgz.jsp" name=formzg METHOD="POST">
    <input type="hidden" name="sb" value="<%=sb%>">设备使用人:
    <select name="syr" class="Sytle_select" onchange="changezg()">
    <option value=""><font color="#ff0000">请选择职工姓名&nbsp;</font></option>
    <%      
            Rs = Smts.executeQuery(sqlsyr);
            Rs.last();
            
            i = 0;
            CountR = Rs.getRow();
            Rs.first();
            if (CountR>0)
            {
            	while (!Rs.isAfterLast())
            	{      
     %><option <%if (syr.equals(Rs.getString("id"))) out.print("selected"); %> value="<%=Rs.getString("id") %>" ><%=Rs.getString("name")%></option>
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
   </select>&nbsp;*&nbsp;&nbsp;&nbsp;
  </form>
  
  </td>
                
  </tr>
  
  </table>
  </div>
  </td>
  </tr>
  <form ACTION="sbgl/inssbgztl.jsp" METHOD="POST" name="formup">
       <!-- 班组代码 -->
    <input type="hidden" name="sb" value="<%=sb%>">     <!-- 设备编码 -->
    <input type="hidden" name="syr" value="<%=syr%>">     <!-- 使用人身份证号码 -->
    <input type="hidden" name="cj" value="<%=chej%>">    <!-- 车间代码 --> 
          <tr align="left">
          <td align="left"><div>     
    <table  height="40"  border="0" align="left" cellpadding="-2" cellspacing="-2">
    <tr><td  height="25" align="left" class="style1" >设备维修人:
                <input type="text" name="wxr" class="Sytle_text">&nbsp;*</td>
    </tr>
    </table>
    </div>
    </td>
          </tr>
          <tr align="left">
            <td align="left">
            <table>
             <tr>
                <td  height="40" align="left" class="style1" >停机时间:&nbsp;&nbsp;</td>
                <td class="style1" >
                <input type="text" name="tingj" class="Sytle_text" id="tingj" onDBLClick="loadCalendar(this)">&nbsp;*</td>
                <td ><font color="#15600B">[输入格式："年-月-日 时间" 如：2008-10-01 17:10]</font></td>
             </tr>
            </table>
            </td>
	  	  </tr>
	  	  
	  	  <tr align="left">
            <td align="left">
            <table>
             <tr>
                <td  height="40" align="left" class="style1" >修复时间:&nbsp;&nbsp;</td>
                <td class="style1" >
                <input type="text" name="xiuf" class="Sytle_text" id="xiuf" onDBLClick="loadCalendar(this)">&nbsp;</td>
                <td ><font color="#15600B">[输入格式："年-月-日 时间" 如：2008-10-01 17:10]</font></td>
             </tr>
            </table>
            </td>
	  	  </tr>
	  	  <tr>
          <td>
            <table><tr>
          <td height="40"  align="left"><span class="style1">故&nbsp;&nbsp;&nbsp;&nbsp;障:&nbsp;&nbsp;</span></td>
          <td align="left" colspan="6"><input name="gz" type="text" class="Style_text" id="gz" size="60">&nbsp;*</td>
          </tr></table>
          </td>
          </tr>
          <tr>
            <td colspan="7" ><div align="center">
            
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
  <div><font color="#D43939">当前正在输入：
   <%if (chej.equals("41")) { %>郑州检修车间<%} 
   else {if (chej.equals("42")) { %>月山检修车间<%} 
   else {if (chej.equals("43")) { %>洛阳检修车间<%} 
   else {if (chej.equals("44")) { %>郑州轮轴车间<%}} }}%>班组设备维修信息...</font></div>
  <div><font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr>
</table>
</td>
</tr>
</table>
<% 
} else {%> <script language="javascript">
              alert("您不是工长，不能执行此操作！");
              window.close();
            </script>
        <% } } else {%> <script language="javascript">
              alert("未登录,请重新登录！");
              window.close();
            </script>
        <% }%>
  </body>
</html>
