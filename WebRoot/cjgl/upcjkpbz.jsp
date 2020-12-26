<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>车间管理级考评标准修改...</title>
    
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
   .tableBorder
   {   
     BORDER-RIGHT: #FF9933 1px dotted; 
   BORDER-TOP: #FF9933 1px dotted; 
   BORDER-LEFT: #FF9933 1px dotted; 
   BORDER-BOTTOM: #FF9933 1px dotted
     }
-->
</style>
</head>
<link href="Css/stylerjhinsert.css" rel="stylesheet">
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
          String tabname = "cjkpbz"; 
       
          
          String sql = "select * from "+tabname+" where code='" + code + "'";
          Rs = Smts.executeQuery(sql);
          Rs.first(); 
       %>

<table align="center" width="557" height="260" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/xgcpbz.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="cjgl/upcjkpbztl.jsp" METHOD="POST" name="form1">
      <input name="code" type="hidden"  value="<%=code%>">
      <input name="oldfl" type="hidden"  value="<%=Rs.getString("fl")%>">
       <table width="559"  align="center" cellpadding="-2" cellspacing="0">
          <tr> <td  height="30" class="style1" align="left">考评标准描述:</td></tr>
          <tr> <td align="center"><input name="bz" type="text" class="Sytle_text" size="80" value="<%=Rs.getString("bz")%>">&nbsp;*</td>
          </tr>
          <tr>
          <td height="30" class="style1" align="left">描述分类: 
          <select name="fl" class="Sytle_select">
                  <option value="生产任务" <%if (Rs.getString("fl").equals("生产任务")) out.print("selected"); %>>生产任务&nbsp;</option>
                  <option value="现车制动" <%if (Rs.getString("fl").equals("现车制动")) out.print("selected");%>>现车制动&nbsp;</option>
                  <option value="油漆与标记" <%if (Rs.getString("fl").equals("油漆与标记")) out.print("selected");%>>油漆与标记&nbsp;</option>
                  <option value="车体" <%if (Rs.getString("fl").equals("车体")) out.print("selected");%>>车体&nbsp;</option>
                  <option value="转向架" <%if (Rs.getString("fl").equals("转向架")) out.print("selected");%>>转向架&nbsp;</option>
                  <option value="车钩缓冲" <%if (Rs.getString("fl").equals("车钩缓冲")) out.print("selected");%>>车钩缓冲&nbsp;</option>
                  <option value="制动梁" <%if (Rs.getString("fl").equals("制动梁")) out.print("selected");%>>制动梁&nbsp;</option>
                  <option value="空气制动配件" <%if (Rs.getString("fl").equals("空气制动配件")) out.print("selected");%>>空气制动配件&nbsp;</option>
                  <option value="轮对" <%if (Rs.getString("fl").equals("轮对")) out.print("selected");%>>轮对&nbsp;</option>
                  <option value="滚动轴承" <%if (Rs.getString("fl").equals("滚动轴承")) out.print("selected");%>>滚动轴承&nbsp;</option>
                  <option value="HMIS信息录入" <%if (Rs.getString("fl").equals("HMIS信息录入")) out.print("selected");%>>HMIS信息录入&nbsp;</option>
                </select>
          </td>
          </tr>
          <tr>  
       <td colspan="2"   class="style1" align="left">扣分情况:</td></tr>
          <tr>
            <td colspan="2" align="center"  >
            <div>
            <table width="90%"    class=tableBorder cellpadding="-1" cellspacing="-1">
            <tr>
              <td width="25%" height="30"  align="center">职工扣分</td> 
              <td width="25%" height="30"  align="center">班组(工长)扣分</td>
              <td width="25%" height="30"  align="center">主管领导扣分</td>
              <td width="25%" height="30"  align="center">包保专职扣分</td>
            </tr>
            <tr>
              <td width="25%" align="center"><input type="text" name="kf1" value="<%=Rs.getString("kf1")%>" size="5"> </td>
              <td width="25%" align="center"><input type="text" name="kf2" value="<%=Rs.getString("kf2")%>" size="5"> </td>
              <td width="25%" align="center"><input type="text" name="kf3" value="<%=Rs.getString("kf3")%>" size="5"> </td>
              <td width="25%" align="center"><input type="text" name="kf4" value="<%=Rs.getString("kf4")%>" size="5"> </td>
            </tr>
            </table>
            </div>
            </td>
          </tr>
          <tr><td colspan="2"   class="style1" align="left">加分情况:</td></tr>
          <tr>
          <td colspan="2" align="center"  >
          <div>
            <table width="90%"    class=tableBorder cellpadding="-1" cellspacing="-1">
            <tr>
              <td width="25%" height="30"  align="center">职工加分</td> 
              <td width="25%" height="30"  align="center">班组(工长)加分</td>
              <td width="25%" height="30"  align="center"></td>
              <td width="25%" height="30"  align="center"></td>
             </tr>
            <tr>
              <td width="25%" align="center"><input type="text" name="jf1" value="<%=Rs.getString("jf1")%>" size="5"> </td>
              <td width="25%" align="center"><input type="text" name="jf2" value="<%=Rs.getString("jf2")%>" size="5"> </td>
              <td width="25%">&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            </table>
            </div>
          </td>
          </tr><tr>  
            <td  height="30" class="style1" align="left">
            <table><tr>
                 <td height="30" class="style1" align="left">是否设为车间管理"高压线": </td> 
          <td>
               <input type="radio" name="gyx" value="1" <%if (Rs.getString("gyx").equals("1")) out.print("checked");%>> 设为车间管理"高压线"
               <input type="radio" name="gyx" value="0" <%if (Rs.getString("gyx").equals("0")) out.print("checked");%>> 不设为车间管理"高压线"
          </td>
          </tr></table></td>
          </tr>
          <tr>
          <td colspan="2" align="left">
          <table width="100%" border="0" align="center" cellpadding="-2" cellspacing="-1">
          <tr>
          <td height="30" class="style1" align="left">是否对管理人员进行责任连带考核:</td> 
          <td width="50%">
               <input type="radio" name="ldkh" value="1"  <%if (Rs.getString("ldkh").equals("1")) out.print("checked");%>> 是
               <input type="radio" name="ldkh" value="0"  <%if (Rs.getString("ldkh").equals("0")) out.print("checked");%>> 否
          </td>
          </tr>
          </table>
          </td>
          </tr>
          <tr ><td height="15" colspan="2"></td></tr>
          <tr>
            <td  height="30"  align="center" valign="middle"> 
                <input name="Button" type="submit" class="Style_button" value="保&nbsp;&nbsp;存" >
                <input name="Submit2" type="reset" class="Style_button" value="重&nbsp;&nbsp;置 ">                
                <input name="myclose" type="button" class="Style_button"  value="关&nbsp;&nbsp;闭" onClick="javascrip:window.close()">
            </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">当前正在修改车间管理级考评标准信息.</font> <font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
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
