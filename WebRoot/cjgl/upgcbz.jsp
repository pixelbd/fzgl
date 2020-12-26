<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>工程质量标准修改...</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
<!--
   body {
	margin-left: 0px; 
	margin-right: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
      }
   .style1 { color: #334094 }
   .style2 { color: #669999 }
-->
</style>
  </head>
   <LINK href="Css/stylerjhinsert.css" type=text/css rel=stylesheet>
  <body>
<%       request.setCharacterEncoding("gb2312");  
        Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
          Statement Smts; 
          ResultSet Rs;
          
          if (Con != null)
         {
          try
          { 	
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
           
          if ((request.getParameter("code") != null)) {
          String code = request.getParameter("code");
          String tabname = "gczlbz"; 
       
          
          String sql = "select * from "+tabname+" where code='" + code + "'";
          Rs = Smts.executeQuery(sql);
          Rs.first(); 
       %>

<table align="center" width="557" height="260" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/xggcbz.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="cjgl/upgcbztl.jsp" METHOD="POST" name="form1">
      <input name="code" type="hidden"  value="<%=code%>">
      <input name="oldfl" type="hidden"  value="<%=Rs.getString("fl")%>">
       <table width="559"  align="center" cellpadding="-2" cellspacing="0">
          <tr> <td  height="30" class="style1" align="left">工程质量标准描述:</td></tr>
          <tr> <td align="center"><input name="bz" type="text" class="Sytle_text" size="80" value="<%=Rs.getString("bz")%>">&nbsp;*</td>
          </tr>
          <tr>
          <td height="30" class="style1" align="left">描述分类: 
          <select name="fl" class="Sytle_select">
                  <option value="转向架检修" <%if (Rs.getString("fl").equals("转向架检修")) out.print("selected"); %>>转向架检修&nbsp;</option>
                  <option value="底体架检修" <%if (Rs.getString("fl").equals("底体架检修")) out.print("selected"); %>>底体架检修&nbsp;</option>
                  <option value="现车制动检修" <%if (Rs.getString("fl").equals("现车制动检修")) out.print("selected"); %>>现车制动检修&nbsp;</option>
                  <option value="制动梁检修" <%if (Rs.getString("fl").equals("制动梁检修")) out.print("selected");%>>制动梁检修&nbsp;</option>
                  <option value="钩缓检修" <%if (Rs.getString("fl").equals("钩缓检修")) out.print("selected");%>>钩缓检修&nbsp;</option>
                  <option value="空气制动检修" <%if (Rs.getString("fl").equals("空气制动检修")) out.print("selected");%>>空气制动检修&nbsp;</option>
                  <option value="配件检修" <%if (Rs.getString("fl").equals("配件检修")) out.print("selected");%>>配件检修&nbsp;</option>
                  <option value="轮对检修" <%if (Rs.getString("fl").equals("轮对检修")) out.print("selected");%>>轮对检修&nbsp;</option>
                  <option value="轴承检修" <%if (Rs.getString("fl").equals("轴承检修")) out.print("selected");%>>轴承检修&nbsp;</option>
                  <option value="其他检修设备" <%if (Rs.getString("fl").equals("其他检修设备")) out.print("selected");%>>其他检修设备&nbsp;</option>
                  <option value="提速改造" <%if (Rs.getString("fl").equals("提速改造")) out.print("selected");%>>提速改造&nbsp;</option>
                  <option value="70t级检修" <%if (Rs.getString("fl").equals("70t级检修")) out.print("selected");%>>70t级检修&nbsp;</option>
                </select>
          </td>
          </tr>
          <tr>  
            <td  height="30" class="style1" align="left">扣分情况:&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="kf" type="text" class="Sytle_text" size="5" value="<%=Rs.getString("kf")%>">&nbsp;*</td>
          </tr>
          <tr>  
            <td  height="30" class="style1" align="left">加分情况:&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="jf" type="text" class="Sytle_text" size="5" value="<%=Rs.getString("jf")%>">&nbsp;</td>
          </tr>
          <tr>
            <td  height="30"  align="center" valign="middle"> 
                <input name="Button" type="submit" class="Style_btn" value="保&nbsp;&nbsp;存" >
                <input name="Submit2" type="reset" class="Style_btn" value="重&nbsp;&nbsp;置 ">                
                <input name="myclose" type="button" class="Style_btn"  value="关&nbsp;&nbsp;闭" onClick="javascrip:window.close()">
            </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">当前正在修改工程质量标准信息.</font> <font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr>
</table>
<% }  
				    }
		           
                   catch (SQLException e)
            		{
            			out.println("未找到符合条件记录!");
            		}
            		finally
            		{  }	
      }    %>
  </body>
</html>
