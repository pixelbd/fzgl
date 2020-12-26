<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改会议记录...</title>
    
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
{ alert("请输入会议日期！");form1.rq.focus();return;}
if (form1.rt.value=="")
{ alert("请输入会议主题！");form1.rt.focus();return;}
if (form1.cjr.value=="")
{ alert("请输入会议参加人！");form1.cjr.focus();return;}
if (form1.zcr.value=="")
{ alert("请输入主持人！");form1.zcr.focus();return;}
if (form1.nr.value=="")
{ alert("请输入会议情况！");form1.nr.focus();return;}
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
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/hygl","root","123"); 
          Statement Smts; 
          ResultSet Rs;
          String meeting="";
          if (Con != null)
            	{
            	
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
           
          if ((request.getParameter("ID1") != null)&&(request.getParameter("ID2") != null)) {
          String id = request.getParameter("ID1");
          String tabname = request.getParameter("ID2"); 
          if (tabname.equals("cjschzz")) {  meeting =  "郑州检修车间生产分析会"; 	}
          if (tabname.equals("cjschys")) {  meeting =  "月山检修车间生产分析会"; 	}
          if (tabname.equals("cjschly")) {  meeting =  "洛阳检修车间生产分析会"; 	}
          if (tabname.equals("cjschzl")) {  meeting =  "郑州轮轴车间生产分析会"; 	}
          if (tabname.equals("cjlxhzz")) {  meeting =  "郑州检修车间联席会"; 	}
          if (tabname.equals("cjlxhys")) {  meeting =  "月山检修车间联席会"; 	}
          if (tabname.equals("cjlxhly")) {  meeting =  "洛阳检修车间联席会"; 	}
          if (tabname.equals("cjlxhzl")) {  meeting =  "郑州轮轴车间联席会"; 	}
          if (tabname.equals("cjzlhzz")) {  meeting =  "郑州检修车间质量分析会"; 	}
          if (tabname.equals("cjzlhys")) {  meeting =  "月山检修车间质量分析会"; 	}
          if (tabname.equals("cjzlhly")) {  meeting =  "洛阳检修车间质量分析会"; 	}
          if (tabname.equals("cjzlhzl")) {  meeting =  "郑州轮轴车间质量分析会"; 	}
          if (tabname.equals("cjzthzz")) {  meeting =  "郑州检修车间专题分析会"; 	}
          if (tabname.equals("cjzthys")) {  meeting =  "月山检修车间专题分析会"; 	}
          if (tabname.equals("cjzthly")) {  meeting =  "洛阳检修车间专题分析会"; 	}
          if (tabname.equals("cjzthzl")) {  meeting =  "郑州轮轴车间专题分析会"; 	}
          if (tabname.equals("dsch")) {  meeting =  "段生产分析会"; 	}
          if (tabname.equals("dqth")) {  meeting =  "段级其他会议"; 	}
          
          
          String sql = "select * from "+tabname+" where id='" + id + "'";
          Rs = Smts.executeQuery(sql);
          Rs.first(); 
       %>

<table align="center" width="557" height="400" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/xghyjl.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="hygl/updatehytj.jsp" METHOD="POST" name="form1">
      <input name="ID1" type="hidden"  value="<%=id%>">
      <input name="ID2" type="hidden"  value="<%=tabname%>">
      <div align="left">       
        </div><table width="559" height="250"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr align="left">
            <td  width="100" height="30" align="left" class="style1">会议名称:&nbsp;&nbsp;</td>
             <td  class="style1"   ><%=meeting%></td>
          </tr>
	  	 <tr>
	  	    <td  height="30" class="style1">会议主题:</td>
            <td align="left"><input type="text" name="rt" class="Sytle_text" id="rt"  size="40" value="<%=Rs.getString("rt")%>">&nbsp;*</td>
          </tr>
         <tr>
            <td height="30"   class="style1">会议时间:</td>
            <td  valign="center"><input type="text" name="rq" class="Sytle_text" id="rq" size="10" value="<%=Rs.getString("rq")%>">&nbsp;*</td>
          </tr>
          <tr>  
            <td height="30" class="style1">主&nbsp;持&nbsp;人:</td>
            <td  ><input name="zcr" type="text" class="Sytle_text" id="zcr" size="10" value="<%=Rs.getString("zcr")%>">&nbsp;*</td>
          </tr>
          <tr>
            <td height="30" ><span class="style1">参&nbsp;加&nbsp;人:</span></td>
            <td ><input width="10" name="cjr" type="text" class="Sytle_text" id="cjr" size="60" value="<%=Rs.getString("cjr")%>">&nbsp;</td>
          </tr>
          <tr> 
           <td height="30" class="style1" valign="top">会议内容</td>
            <td >
            <textarea  name="nr"  class="Sytle_text"  cols="64" rows="20" ><%=Rs.getString("nr")%></textarea>
            </td>
          </tr>
          <% if  ((tabname.equals("dqth"))||(tabname.equals("dsch")))
	  	  {  	
	  	  %>
	  	  <tr> 
           <td  class="style1">会议地点</td>
            <td ><input width="20" name="nr" type="text" class="Sytle_text" value="<%=Rs.getString("dd")%>" size="20">&nbsp;*</td>
          </tr>
          <% } %>
          <tr>
            <td colspan="2" ><div align="center">
                <input name="Button" type="button" class="Style_button" value="保&nbsp;&nbsp;存" onClick="Mycheck()">
                <input name="myclose" type="button" class="Style_button" id="myclose" value="关&nbsp;&nbsp;闭"
				 onClick="javascrip:window.close()">
                </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="60">
  <div><font color="#D43939">当前正在修改会议记录</font></div>
  <div><font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr>
</table>
<%  } }  %>
  </body>
</html>

