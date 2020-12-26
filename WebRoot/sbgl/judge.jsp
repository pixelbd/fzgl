<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>设备故障分析...</title>
    
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
if (form1.zr1.value=="")
{ alert("请输入责任判定！");form1.xfsj.focus();return;}

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
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/sbzrfx.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
     <form ACTION="sbgl/judgetj.jsp" METHOD="POST" name="form1">
      <table width="559" height="60"  border="0" align="center" cellpadding="-2" cellspacing="0">
      <input name="id" type="hidden" value="<%=id%>">
          <tr align="left" height="35">
            <td width="30%"  align="left" class="style1">设备故障产生原因</td>
            <td width="70%"><select name="gz1" class="Sytle_select">
                  <option value="正常损耗" >正常损耗</option>
                  <option value="使用、养护不当" >使用、养护不当</option>
                  <option value="配件不合格" >配件不合格</option>
                  <option value="制造、安装不良" >制造、安装不良</option>
                  <option value="维修不当" >维修不当产生的故障</option>
             </select></td>
          </tr>
          <tr height="35">
             <td width="30%" class="style1">设备故障产生责任认定 </td>
             <td width="70%"><select name="zr1" class="Sytle_select">
                  <option value="无责任" >无责任</option>
                  <option value="郑州检修车间" >郑州检修车间</option>
                  <option value="月山检修车间" >月山检修车间</option>
                  <option value="洛阳检修车间" >洛阳检修车间</option>
                  <option value="郑州轮轴车间" >郑州轮轴车间</option>
                  <option value="设备车间" >设备车间</option>
                  <option value="材料科" >材料科</option>
                  <option value="技术科" >技术科</option>
             </select></td>
             <td></td>
          </tr>
	  	  <tr align="left" height="35">
            <td width="30%"  align="left" class="style1">设备故障修复情况分析 </td>
            <td width="70%">
            <select name="gz2" class="Sytle_select">
                  <option value="及时修复" >及时修复</option>
                  <option value="维修不当" >维修不当</option>
                  <option value="配件不合格" >配件不合格</option>
                  <option value="未及时联系厂家" >未及时联系厂家</option>
                  <option value="较大故障" >较大故障不能短时间修复</option>
             </select></td>
          </tr>
          <tr>
             <td width="30%" height="35" class="style1"  >设备故障未及时修复责任</td>
             <td width="70%">
             <select name="zr2" class="Sytle_select">
                  <option value="无责任" >无责任</option> 
                  <option value="设备车间" >设备车间</option>
                  <option value="材料科" >材料科</option>
                  <option value="技术科" >技术科</option>
             </select></td>
             <td></td>
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
  <div><font color="#D43939">当前正在对编号[ <%=Rs.getString("code")%>]设备故障情况进行分析...</font></div>
  
  </td>
  </tr>
</table>
<%}}  %>
  </body>
</html>

