<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'sbjhwc.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <LINK href="Css/css1.css" type=text/css rel=stylesheet> 
  <script language="javascript">
function Mycheck()
{
if (form1.rq.value=="")
{ alert("请输入日期！");form1.rq.focus();return;}

form1.submit();}
</script>
  <body background="Images/bg2.gif">
  <script language="javascript">
   function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
   }
</script>
 <%  String chej = "";
     String str="";
     String tbname="";
     if (((String)session.getAttribute("deptment")).equals("41")) { chej="zz"; str="上报郑州检修车间车辆检修日计划完成情况"; tbname="jhwczz";} else {
        if (((String)session.getAttribute("deptment")).equals("42")) { chej="ys"; str="上报月山检修车间车辆检修日计划完成情况"; tbname="jhwcys";}  else {
          if (((String)session.getAttribute("deptment")).equals("43")) { chej="ly";str="上报洛阳检修车间车辆检修日计划完成情况"; tbname="jhwcly";} else {}}}
     
 
 %>   
  <form ACTION="jhgl/sbjhwcdetl.jsp" METHOD="POST" name="form1">
  <table   width="100%" border="0" cellpadding="-2" cellspacing="1">
  <tr><td  colspan="2" align="left" valign="middle" height="30"><font color="#0000a0" >上报日生产计划完成情况</font></td>
  </tr>
  <tr>
  
  <td align="left" height="30" width="40%">
  <% if (chej.equals("")) {%>
  请选择车间:<select name="tabname" class="Sytle_select" >
                 <option value="jhwczz">郑州检修车间&nbsp;&nbsp;</option>
		         <option value="jhwcys">月山检修车间</option>
		         <option value="jhwcly">洛阳检修车间</option>
		         </select>
   <% } else {%>
   <%=str %>
   <input name="tabname" type="hidden"  value="<%=tbname %>">
   <% } %>
	  	    </td>
  <td   align="left">上报日期:&nbsp;&nbsp;<input name="rq" type="text"  ondblclick="loadCalendar(this)" id="rq">&nbsp;</td>
  </tr>
  </table>

    <table   width="100%" border="0" class=tableBorder3 cellpadding="1" cellspacing="1">
    
     <tr bgcolor="FFCC99" height="20"  >
         <td  rowspan="4" align="center" valign="middle"><font color="#333399">入段厂修</font></td> 
         <td width="78%"  align="center" colspan="21">国铁货车</td>
         <td width="20%"  align="center" colspan="6">自备货车</td>
     </tr>
     <tr bgcolor="FFCC99" height="20">
         <td align="center" colspan="9">60t级货车</td>
         <td align="center" colspan="4">70t级货车</td>
         <td align="center" colspan="4">专用货车</td>
         <td align="center" colspan="4"  valign="middle">国铁改造</td>
         <td  align="center" colspan="2">自备</td>
         <td   align="center" colspan="4"  valign="middle">自备改造</td>
     </tr>
     <tr  bgcolor="FFCC99" height="20">
         <td width="29" align="center">C</td>
         <td width="29"  align="center">N</td>
         <td width="29" align="center">NX</td>
         <td width="29" align="center">X</td>
         <td width="29" align="center">G</td>
         <td width="29" align="center">K</td>
         <td width="29" align="center">T</td>
         <td width="29" align="center">P</td>
         <td width="29" align="center">行包</td>
         <td width="29" align="center">C</td>
         <td width="29" align="center">NX</td>
         <td width="29" align="center">P</td>
         <td width="29" align="center">K</td>
         <td width="29" align="center">D</td>
         <td width="29" align="center">DL1</td>
         <td width="29" align="center">X2H(K)</td>
         <td width="29" align="center">X6K</td>
         <td width="29" align="center">K2改造</td>
         <td width="29" align="center">完善改造</td>
         <td width="29" align="center">改120</td>
         <td width="29" align="center">改闸</td>
         <td width="29" align="center">G</td>
         <td width="29" align="center">K</td>
         <td width="29" align="center">K2改造</td>
         <td width="29" align="center">完善改造</td>
         <td width="29" align="center">改120</td>
         <td width="29" align="center">改闸</td>
     </tr>
     
     <tr  bgcolor="FFCC99" height="20">
         <td width="29" align="center"><input name="cxgtc" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29"  align="center"><input name="cxgtn" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgtnx" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgtx" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgtg" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgtk" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgtt" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgtp" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgtpb" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgt70c" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgt70nx" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgt70p" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgt70k" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgtd" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgtdl1" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgtx2kh" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgtx6k" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgtgk2" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgtgt" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgtg120" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxgtgzha" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxzbg" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxzbk" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxzbgk2" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxzbgt" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxzbg120" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="cxzbgzha" type="text" class="Sytle_text"  size="1" value="0"></td>
     </tr>
     
     <tr bgcolor="FFCC99" height="20"  >
         <td  rowspan="4" align="center" valign="middle"><font color="#333399">&nbsp;段&nbsp;&nbsp;修&nbsp;</font></td> 
         <td width="68%"  align="center" colspan="21">国铁货车</td>
         <td width="20%"  align="center" colspan="6">自备货车</td>
     </tr>
     <tr bgcolor="FFCC99" height="20">
         <td align="center" colspan="9">60t级货车</td>
         <td align="center" colspan="4">70t级货车</td>
         <td align="center" colspan="4">专用货车</td>
         <td align="center" colspan="4"  valign="middle">国铁改造</td>
         <td  align="center" colspan="2">自备</td>
         <td   align="center" colspan="4"  valign="middle">自备改造</td>
     </tr>
     <tr  bgcolor="FFCC99" height="20">
         <td width="29" align="center">C</td>
         <td width="29"  align="center">N</td>
         <td width="29" align="center">NX</td>
         <td width="29" align="center">X</td>
         <td width="29" align="center">G</td>
         <td width="29" align="center">K</td>
         <td width="29" align="center">T</td>
         <td width="29" align="center">P</td>
         <td width="29" align="center">行包</td>
         <td width="29" align="center">C</td>
         <td width="29" align="center">NX</td>
         <td width="29" align="center">P</td>
         <td width="29" align="center">K</td>
         <td width="29" align="center">D</td>
         <td width="29" align="center">DL1</td>
         <td width="29" align="center">X2H(K)</td>
         <td width="29" align="center">X6K</td>
         <td width="29" align="center">K2改造</td>
         <td width="29" align="center">完善改造</td>
         <td width="29" align="center">改120</td>
         <td width="29" align="center">改闸</td>
         <td width="29" align="center">G</td>
         <td width="29" align="center">K</td>
         <td width="29" align="center">K2改造</td>
         <td width="29" align="center">完善改造</td>
         <td width="29" align="center">改120</td>
         <td width="29" align="center">改闸</td>
     </tr>
     <tr  bgcolor="FFCC99" height="20">
         <td width="29" align="center"><input name="dxgtc" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29"  align="center"><input name="dxgtn" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgtnx" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgtx" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgtg" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgtk" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgtt" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgtp" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgtpb" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgt70c" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgt70nx" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgt70p" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgt70k" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgtd" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgtdl1" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgtx2kh" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgtx6k" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgtgk2" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgtgt" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgtg120" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxgtgzha" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxzbg" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxzbk" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxzbgk2" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxzbgt" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxzbg120" type="text" class="Sytle_text"  size="1" value="0"></td>
         <td width="29" align="center"><input name="dxzbgzha" type="text" class="Sytle_text"  size="1" value="0"></td>
     </tr>
     
  </table>
  <table width="100%" border="0" cellpadding="-2" cellspacing="1">
  <tr><td width="100%" align="center" height="50">
     <input type="button" name="button1" class="Style_button" value="  上  报  " onClick="Mycheck()">
     </td></tr>
  </table>
  </form>
  </body>
</html>
