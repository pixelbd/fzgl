<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改验收发现故障记录...</title>
    
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
if (form1.rq.value=="")
{ alert("请输入日期！");form1.rq.focus();return;}
if (form1.ysy.value=="")
{ alert("请输入验收员！");form1.ysy.focus();return;}
if (form1.zrbz.value=="")
{ alert("请输入责任班组！");form1.zrbz.focus();return;}
if (form1.zrr.value=="")
{ alert("请输入责任人！");form1.zrr.focus();return;}
if (form1.gzms.value=="")
{ alert("请输入故障情况！");form1.gzms.focus();return;}
if (form1.bw.value=="")
{ alert("请输入故障部位！");form1.bw.focus();return;}
if (form1.lb.value=="")
{ alert("请输入故障类别！");form1.lb.focus();return;}
if (form1.ch.value=="")
{ alert("请输入车号或配件编号！");form1.ch.focus();return;}
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
           
          if ((request.getParameter("ID1") != null)&&(request.getParameter("ID2") != null)) {
          String v1 = request.getParameter("ID1");
          String chej = request.getParameter("ID2"); 
          
          String sql = "select * from ysgz"+chej+" where id='" + v1 + "'";
          Rs = Smts.executeQuery(sql);
          Rs.first(); 
       %>

<table align="center" width="557" height="400" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/xgysjl.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="gzgl/upysgztj.jsp" METHOD="POST" name="form1">
      <input name="cj" type="hidden" id="" value="<%=chej%>">
      <input name="id" type="hidden" id="" value="<%=v1%>">
      <table width="559" height="250"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr align="left">
            <td  height="40" align="left" class="style1">日&nbsp;&nbsp;期 </td>
             <td colspan="2" class="style1"   ><input type="text" name="rq" class="Sytle_text" id="rq" value="<%=Rs.getString("rq")%>">&nbsp;*</td>
             <td colspan="3" class="style1"  > </td>
	  	  </tr>
	  	  <tr>
	  	    <td  height="40" class="style1">验收员</td>
            <td align="left"><input type="text" name="ysy" class="Sytle_text" id="ysy" size="10" value="<%=Rs.getString("ysy")%>">&nbsp;*</td>
            <td   colspan="2" class="style1">责任班组</td>
            <td  valign="center"><input type="text" name="zrbz" class="Sytle_text" id="zrbz" size="10" value="<%=Rs.getString("zrbz")%>">&nbsp;*</td>
            <td  class="style1">责任人</td>
            <td  ><input name="zrr" type="text" class="Sytle_text" id="zrr" size="10" value="<%=Rs.getString("zrr")%>">&nbsp;*</td>
          </tr>
          <tr>
            <td height="40" ><span class="style1">车型</span></td>
            <td ><input width="10" name="cx" type="text" class="Sytle_text" id="cx" size="10" value="<%=Rs.getString("cx")%>">&nbsp;</td>
            <td colspan="2" class="style1">车号/配件编号</td>
            <td colspan="2"><input width="20" name="ch" type="text" class="Sytle_text" value="<%=Rs.getString("ch")%>" size="20">&nbsp;*</td>
          </tr>
          
          <tr>
          <td height="40"  align="left"><span class="style1">所属部位</span></td>
          <td align="left" colspan="6" ><select name="bw" class="Sytle_select">
                          <option value="轮轴" <%if (Rs.getString("bw").equals("轮轴")) out.print("selected");%>>轮轴</option>
                          <option value="转向架" <%if (Rs.getString("bw").equals("转向架")) out.print("selected");%>>转向架</option>
                          <option value="钩缓" <%if (Rs.getString("bw").equals("钩缓")) out.print("selected");%>>钩缓</option>
                          <option value="基础制动" <%if (Rs.getString("bw").equals("基础制动")) out.print("selected");%> >基础制动</option>
                          <option value="空气制动" <%if (Rs.getString("bw").equals("空气制动")) out.print("selected");%>>空气制动</option>
                          <option value="车体" <%if (Rs.getString("bw").equals("车体")) out.print("selected");%>>车体</option>
                          </select>&nbsp;*</td>
          </tr>
          <tr>
          <td height="40"  align="left"><span class="style1">故障类别</span></td>
          <td align="left" colspan="6" ><select name="lb" class="Sytle_select">
                          <option value="A" <%if (Rs.getString("lb").equals("A")) out.print("selected");%>>A类（典型故障）</option>
                          <option value="B" <%if (Rs.getString("lb").equals("B")) out.print("selected");%>>B类（主要故障）</option>
                          <option value="C" <%if (Rs.getString("lb").equals("C")) out.print("selected");%>>C类（一般故障）</option>
                          </select>&nbsp;*</td>
          </tr>
          <tr>
          <td height="40"  align="left"><span class="style1">故障描述</span></td>
          <td align="left" colspan="6"><input name="gzms" type="text" class="Style_text" value="<%=Rs.getString("gzms") %>" size="60">&nbsp;*</td>
          </tr>
         
          
         <tr>
            <td colspan="7" ><div align="center">
                <input name="Button" type="button" class="Style_button" value="提&nbsp;&nbsp;交" onClick="Mycheck()">
               <input name="myclose" type="button" class="Style_button" id="myclose" value="关&nbsp;&nbsp;闭"
				 onClick="javascrip:window.close()">
                </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="60">
  <div><font color="#D43939">当前正在修改验收签发：
   <%if (chej.equals("zz")) { %>郑州检修车间<%} 
   else {if (chej.equals("ys")) { %>月山检修车间<%} 
   else {if (chej.equals("ly")) { %>洛阳检修车间<%} 
   else {} }}%>车统-93故障情况...</font></div>
  <div><font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr>
</table>
<%}}  %>
  </body>
</html>

