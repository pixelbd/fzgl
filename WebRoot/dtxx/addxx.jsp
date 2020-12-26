<%@ page language="java"  pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加动态信息记录...</title>
    
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
if (form1.bt.value=="")
{ alert("请输入信息标题！");form1.bt.focus();return;}
if (form1.nr.value=="")
{ alert("请输入动态信息情况！");form1.nr.focus();return;}
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
   .wordtitle{color: #E54743}
-->
</style>
</head>

<body background="Images/bg2.gif">
  <%        
  request.setCharacterEncoding("gb2312");
         
  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
  java.util.Date today=new java.util.Date();
  String now = formatter.format(today); 
      
  boolean islog=false;
  String fbr="";
  String fbbm="";
  String str="";
  
  
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
  if (islog)
  {
   fbr=(String)session.getAttribute("usertrue");
   fbbm=(String)session.getAttribute("deptment");
   if (((String)session.getAttribute("deptment")).equals("1"))  { str="段领导";}
        if (((String)session.getAttribute("deptment")).equals("21")) { str="验收室";}
        if (((String)session.getAttribute("deptment")).equals("22")) { str="技术科";}
        if (((String)session.getAttribute("deptment")).equals("23")) { str="调度科";}
        if (((String)session.getAttribute("deptment")).equals("24")) { str="材料科";}
        if (((String)session.getAttribute("deptment")).equals("25")) { str="质检科";}
        if (((String)session.getAttribute("deptment")).equals("41")) { str="郑州检修车间";}
        if (((String)session.getAttribute("deptment")).equals("42")) { str="月山检修车间";}
        if (((String)session.getAttribute("deptment")).equals("43")) { str="洛阳检修车间";}
        if (((String)session.getAttribute("deptment")).equals("44")) { str="郑州轮轴车间";}
        if (((String)session.getAttribute("deptment")).equals("admin")) { str="系统管理员";}
  }
  %>

<table align="center" width="557" height="400" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/tjdtxx.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="dtxx/addxxtj.jsp" METHOD="POST" name="form1" enctype="multipart/form-data" onsubmit="return Mycheck(form1)">
      <table width="600" height="250"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr>
            <td   height="28" class="style1" align="left">&nbsp;发布时间:</td>
            <td  align="left" class="style1"><%=now%><input type="hidden" name="rq" value=<%=now%>></td>
            
            <td  height="28" class="style1" align="right">&nbsp;发布部门:</td>
            <td  align="left" class="style1"><%=str%><input name="fbbm" type="hidden" value=<%=fbbm%>></td>
            
            <td  height="28" class="style1" align="right">&nbsp;发&nbsp;布&nbsp;人:</td>
            <td  width="150" align="left" class="style1"><%=fbr%><input name="fbr" type="hidden" value=<%=fbr%> ></td>
          </tr>
	  	  <tr>
	  	    <td  height="28" class="style1" align="left">&nbsp;信息标题:</td>
            <td align="left" colspan="5"  class="wordtitle"><input type="text" name="bt" class="Sytle_text" id="bt" size="40" >&nbsp;必填项</td>
          </tr>
          
          <tr>
            <td height="28" class="style1" align="left">&nbsp;图片1说明:</td>
            <td colspan="5" class="wordtitle"><input type="text" name="tpjs1" class="Sytle_text" size="40" >&nbsp;可选项</td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;图片1:&nbsp;</td>
            <td colspan="5" ><input type="file" name="pic1"><font color="#CC0000">&nbsp;文件名中不能含有中文字符</font></td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;图片2说明:</td>
            <td colspan="5"  class="wordtitle"><input type="text" name="tpjs2" class="Sytle_text"  size="40" >&nbsp;可选项</td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;图片2:&nbsp;</td>
            <td colspan="5" ><input type="file" name="pic2"><font color="#CC0000">&nbsp;文件名中不能含有中文字符</font></td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;图片3说明:</td>
            <td colspan="5"  class="wordtitle"><input type="text" name="tpjs3" class="Sytle_text" size="40" >&nbsp;可选项</td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;图片3:&nbsp;</td>
            <td colspan="5" ><input type="file" name="pic3"><font color="#CC0000">&nbsp;文件名中不能含有中文字符</font></td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;图片4说明:</td>
            <td colspan="5"  class="wordtitle"><input type="text" name="tpjs4" class="Sytle_text"  size="40" >&nbsp;可选项</td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;图片4:&nbsp;</td>
            <td colspan="5" ><input type="file" name="pic4"><font color="#CC0000">&nbsp;文件名中不能含有中文字符</font></td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;图片5说明:</td>
            <td colspan="5"  class="wordtitle"><input type="text" name="tpjs5" class="Sytle_text"  size="40" >&nbsp;可选项</td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;图片5:&nbsp;</td>
            <td colspan="5" ><input type="file" name="pic5"><font color="#CC0000">&nbsp;文件名中不能含有中文字符</font></td>
          </tr>
          <tr> 
           <td height="100" class="style1" valign="top" align="left">&nbsp;详细内容:</td>
            <td valign="top" colspan="5"><textarea  name="nr"  class="Sytle_text"  cols="68" rows="10"></textarea> </td>
          </tr>
          <tr>
            <td colspan="6" height="40"  align="center" valign="middle"> 
                <input name="Submit" type="submit"  class="Style_button" value="上&nbsp;&nbsp;传" onClick="Mycheck()">
                <input name="myclose" type="button" class="Style_button" id="myclose" value="关&nbsp;&nbsp;闭"
				 onClick="javascrip:window.close()">
                 </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">当前正在添加动态信息记录.</font> <font color="#15600B">注：1.图片1~5为可选上传图片文件；2.只能上传GIF、JPG、BMP格式图片；3.为了保证图片能正常显示请上传不含中文字文件名的图片。</font></div>
  </td>
  </tr>
</table>

  </body>
</html>

