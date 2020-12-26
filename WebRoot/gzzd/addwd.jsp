<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加文电记录...</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link href="Css/css1.css" rel="stylesheet">
<script language="javascript">
function Mycheck()
{
if ((form1.tdb.value=="") && (form1.tlj.value==""))
{ alert("文件号头不能为空！"); form1.tdb.focus(); return;}
if (form1.tdb.value!="")
{ if((form1.tdbnian.value=="")||(form1.tdbhao.value==""))
  { alert("部文电信息不全,请补充！"); form1.tdb.focus(); return;}
 }
if (form1.tlj.value!="")
{ if((form1.tljnian.value=="")||(form1.tljhao.value==""))
  { alert("局文电信息不全,请补充！"); form1.tlj.focus(); return; }
 }
if (form1.rq.value=="")
{ alert("请输入文件发布日期！"); form1.rq.focus(); return;}
if (form1.bw.value=="")
{ alert("请输入内容涉及分类！"); form1.bw.focus(); return;}
if (form1.bt.value=="")
{ alert("请输入文件电报标题！"); form1.bt.focus(); return;}
if (form1.zy.value=="")
{ alert("请输入文件电报摘要！"); form1.zy.focus(); return;}
if (form1.file.value=="")
{ alert("请添加文件电报！"); form1.file.focus(); return;}
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
  <script language="javascript">
  function loadCalendar(field){
  var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
  if(rtn!=null)
		field.value=rtn;
  return;
  }
  </script>

<table align="center" width="557" height="400" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/tjwdjl.gif">
      <tr><td></td></tr>
    </table>  
    <form action="gzzd/addwdtj.jsp" method="post" name="form1" enctype="multipart/form-data" onsubmit="return Mycheck(form1)">    
    <table align="center">
       <tr><td align="left" colspan="5">
       <strong>文电信息</strong></td></tr>
       <tr>
          <td height="28">文电类别:&nbsp;</td>
          <td><input type="radio" name="wdlb" value="1"> 技术</td>
          <td><input type="radio" name="wdlb" value="2"> 安全</td>
          <td><input type="radio" name="wdlb" value="3"> 其他</td>
          <td></td>
       </tr>
      <tr> 
          <td colspan="5" height="28">文件号头:&nbsp;&nbsp;&nbsp;部&nbsp;&nbsp;&nbsp;
          <select name="tdb" class="Sytle_select"  >
          <option value="" ></option>
            <option value="运装货车">运装货车</option>
            <option value="运装货车电">运装货车电</option>
            <option value="运装管验">运装管验</option>
            <option value="运装管验电">运装管验电</option>
            <option value="运营货管电">运装管验电</option>
            <option value="铁科技函">铁科技函</option>
            <option value="铁运">铁运</option>
            <option value="铁安监电">铁安监电</option>
            </select>&nbsp;&nbsp;&nbsp;
            <input name="tdbnian" type="text" class="Sytle_text"  size="10">&nbsp;年&nbsp;&nbsp;&nbsp;
            <input name="tdbhao" type="text" class="Sytle_text"  size="10">&nbsp;号
         </td>
       </tr>
       <tr>
          <td colspan="5" height="28">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;局&nbsp;&nbsp;&nbsp;
          <select name="tlj" class="Sytle_select" >
          <option value="" ></option>
            <option value="郑辆检">郑辆检&nbsp;&nbsp;</option>
            <option value="郑辆检电">郑辆检电&nbsp;&nbsp;</option>
            <option value="郑安电">郑安电&nbsp;&nbsp;</option>
            <option value="郑电安">郑电安&nbsp;&nbsp;</option>
            <option value="郑辆运电">郑辆运电&nbsp;&nbsp;</option>
            <option value="郑辆综电">郑辆综电&nbsp;&nbsp;</option>
            <option value="郑辆检函">郑辆检函&nbsp;&nbsp;</option>
            <option value="郑辆运函" >郑辆运函&nbsp;</option>
            <option value="郑辆办函" >郑辆办函&nbsp;</option>
            <option value="郑局车验函">郑局车验函</option>
            <option value="郑铁辆函">郑铁辆函&nbsp;</option>
            <option value="郑铁财函">郑铁财函&nbsp;</option>
            <option value="郑铁货">郑铁货&nbsp;</option>
            <option value="郑铁办">郑铁办&nbsp;</option>
            <option value="郑铁技">郑铁技&nbsp;</option>
          </select>&nbsp;&nbsp;&nbsp;
          <input name="tljnian" type="text" class="Sytle_text"  size="10">&nbsp;年&nbsp;&nbsp;&nbsp;
          <input name="tljhao" type="text" class="Sytle_text"  size="10">&nbsp;号
          </td>
       </tr>
       <tr>
          <td height="28" align="left">涉及内容:&nbsp;</td>
          <td><input type="radio" name="bw" value="1"> 车体、底体架</td>
          <td><input type="radio" name="bw" value="2"> 转向架</td>
          <td><input type="radio" name="bw" value="3"> 轮轴</td>
          <td><input type="radio" name="bw" value="4"> 钩缓</td>
       </tr>
       <tr>
          <td height="28">&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <TD><input type="radio" name="bw" value="5"> 基础制动</td>
          <td><input type="radio" name="bw" value="6"> 空气制动</td>
          <td><input type="radio" name="bw" value="7"> 油漆标记</td>
          <td><input type="radio" name="bw" value="8"> 技术综合</td>
          <td><input type="radio" name="bw" value="9"> 事故通报</td>
       </tr>
       <tr>
          <td height="28">发布时间:&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td colspan="4"><input name="rq" type="text" class="Sytle_text"  size="15" onDBLClick="loadCalendar(this)">&nbsp;&nbsp;&nbsp; &nbsp;
       </tr>
       <tr>
          <td height="28">文件电报标题：&nbsp;</td>
          <td colspan="4"><input name="bt" type="text" class="Sytle_text"  size="45">&nbsp;&nbsp;&nbsp; &nbsp;</td>
       </tr>
       <tr>
          <td height="28" >文件电报摘要： &nbsp;</td>
          <td colspan="4" ><textarea  name="zy"  class="Sytle_text"  cols="75" rows="16"></textarea> </td>
      </tr>
      <tr>
          <td height="28" >上传文件电报： &nbsp;</td>
          <td colspan="4" ><input type="file" name="file"></td>
      </tr>
      <tr><td colspan="6" height="40"  align="center" valign="middle"> 
               <input type="submit" name="Submit" class="Style_button" value="保&nbsp;&nbsp;存">&nbsp;&nbsp;
               <input name="Submit2" type="reset" class="Style_button" value="重&nbsp;&nbsp;置 ">&nbsp;&nbsp;                
               <input name="myclose" type="button" class="Style_button" id="myclose" value="关&nbsp;&nbsp;闭"
				onClick="javascrip:window.close()">
          </td>
      </tr>
    </table>
     </form>
    </td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">当前正在添加文件电报记录.</font> <font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr>
</table>
</body>
</html>

