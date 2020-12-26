<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改配件已索赔记录...</title>
    
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
{ alert("请输入日期！"); form1.rq.focus(); return; }
if (form1.pjmc.value=="")
{ alert("请输入配件名称！"); form1.pjmc.focus(); return; }
if (form1.zzcdh.value=="")
{ alert("请输入制造厂代号！"); form1.zzcdh.focus(); return;}
if (form1.zzsj.value=="")
{ alert("请输入制造时间！"); form1.zzsj.focus(); return; }
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
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/pjgl","root","123"); 
          Statement Smts; 
          ResultSet Rs;
          if (Con != null)
          {
            	
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
           
          if ((request.getParameter("ID1") != null)&&(request.getParameter("ID2") != null)) {
          String v1 = request.getParameter("ID1");
          String chej = request.getParameter("ID2"); 
          
          String sql = "select * from sppj"+chej+" where num='" + v1 + "'";
          Rs = Smts.executeQuery(sql);
          Rs.first(); 
 %>

<table align="center" width="560" height="500" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/xgpjspjl.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="pjgl/upsppjtj.jsp" METHOD="POST" name="form1">
        <table width="559" height="344"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr align="left">
            <td  height="27" align="left" class="style1">日&nbsp;&nbsp;期 </td>
             <td colspan="3" class="style1" ><input type="text" name="rq" class="Sytle_text" id="rq" value="<%=Rs.getString("rq")%>">&nbsp;*</td>
	  	  </tr>
	  	  <tr>
	  	    <td   class="style1">配件名称</td>
            <td align="left"><input type="text" name="pjmc" class="Sytle_text" id="pjmc" size="10" value="<%=Rs.getString("pjmc")%>">&nbsp;*</td>
            <td   colspan="2" class="style1">配件型号</td>
            <td  valign="center"><input type="text" name="xinghao" class="Sytle_text" id="xinghao" size="10" value="<%=Rs.getString("xinghao")%>"></td>
            <td  class="style1">配件编号</td>
            <td  ><input name="pjbh" type="text" class="Sytle_text" id="pjbh" size="10" value="<%=Rs.getString("pjbh")%>"></td>
          </tr>
          <tr>
            <td height="25" ><span class="style1">原装车型</span></td>
            <td ><input width="10" name="chexing" type="text" class="Sytle_text" id="chexing" size="10" value="<%=Rs.getString("chexing")%>">&nbsp;</td>
            <td colspan="2" class="style1">车&nbsp;&nbsp;号</td>
            <td colspan="2"><input width="20" name="chehao" type="text" class="Sytle_text" id="chehao" size="20" value="<%=Rs.getString("chehao")%>"></td>
          </tr>
          <tr>
            <td  class="style1">制造厂代号</td>
            <td colspan="2"><input width="20" name="zzcdh" type="text" class="Sytle_text" id="zzcdh" size="20" value="<%=Rs.getString("zzcdh")%>">&nbsp;*</td>
            <td colspan="1" class="style1">制造时间</td>
            <td colspan="3"><input width="20" name="zzsj" type="text" class="Sytle_text" id="zzsj" size="20" value="<%=Rs.getString("zzsj")%>">&nbsp;*</td>
          </tr>
          <tr>
          <td height="25"  align="left"><span class="style1">所属部位</span></td>
          <td align="left" colspan="6" ><select name="bw" class="Sytle_select">
                          <option value="轮轴" <%if (Rs.getString("bw").equals("轮轴")) out.print("selected"); %> >轮轴</option>
                          <option value="转向架" <%if (Rs.getString("bw").equals("转向架")) out.print("selected");%>>转向架</option>
                          <option value="钩缓" <%if (Rs.getString("bw").equals("钩缓")) out.print("selected");%>>钩缓</option>
                          <option value="基础制动" <%if (Rs.getString("bw").equals("基础制动")) out.print("selected");%>>基础制动</option>
                          <option value="空气制动" <%if (Rs.getString("bw").equals("空气制动")) out.print("selected");%>>空气制动</option>
                          <option value="车体" <%if (Rs.getString("bw").equals("车体")) out.print("selected");%>>车体</option>
                          </select>&nbsp;*</td>
          </tr>
          <tr >
          <td height="25"  align="left"><span class="style1">故障描述</span></td>
          <td align="left" colspan="6"><input name="guzhang" type="text" class="Style_text" id="guzhang" size="40"  value="<%=Rs.getString("guzhang")%>"></td>
          </tr>
          <tr>
          <td height="25"  align="left"  size="3"><span class="style1">数量</span></td>
          <td align="left" colspan="6"><input name="shuliang" type="text" class="Style_text" id="shuliang" value="<%=Rs.getString("shuliang")%>"></td>
          </tr>
          <tr>
          <td height="25"  align="left" size="10"><span class="style1">处理</span></td>
          <td align="left" colspan="6"><input name="chuli" type="text" class="Style_text" id="chuli" value="<%=Rs.getString("chuli")%>"></td>
          </tr>
          <tr>
            <td colspan="7" ><div align="center">
                <input name="ID2" type="hidden" class="Style_text" value="<%=chej%>">
                <input name="ID1" type="hidden"  value="<%=v1%>">
                <input name="Button" type="button" class="Style_button" value="提&nbsp;&nbsp;交" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="Style_button" value="重&nbsp;&nbsp;置 ">                
                <input name="myclose" type="button" class="Style_button" id="myclose" value="关&nbsp;&nbsp;闭"
				 onClick="javascrip:window.close()">
                </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td>
  <div><font color="#D43939">当前正在修改：
   <%if (chej.equals("zz")) { %>郑州检修车间<%} 
   else {if (chej.equals("ys")) { %>月山检修车间<%} 
   else {if (chej.equals("ly")) { %>洛阳检修车间<%} 
   else {} }}%>配件索赔情况...</font></div>
  <div><font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr>
</table>
<% } }%>
  </body>
</html>
