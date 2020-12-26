<%@ page language="java"  pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加车间管理级考评标准...</title>
    
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
   .tableBorder
   {   
     BORDER-RIGHT: #FF9933 1px dotted; 
   BORDER-TOP: #FF9933 1px dotted; 
   BORDER-LEFT: #FF9933 1px dotted; 
   BORDER-BOTTOM: #FF9933 1px dotted
     }
-->
</style>
<link href="Css/stylerjhinsert.css" rel="stylesheet">
<script language="javascript">
function Mycheck()
{
if (form1.bz.value=="")
{ 
alert("请输入标准描述！");
form1.bz.focus();
return;
}

form1.submit();
}
</script>

</head>

<body background="Images/bg2.gif">
<%       request.setCharacterEncoding("gb2312");  %>

<table align="center" width="557" height="260" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/tjkpbz.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="cjgl/inscjkpbztl.jsp" METHOD="POST" name="form1">
      <table width="559" height="86"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr>  
            <td  colspan="2" height="30" class="style1" align="left">车间考评标准描述:</td></tr>
          <tr>
            <td colspan="2" align="center" ><input name="bz" type="text" class="Sytle_text" size="80">&nbsp;*</td>
          </tr>
          <tr>
          <td height="30" class="style1" align="left">描述分类:</td> 
          <td><select name="fl" class="Sytle_select">
                  <option value="生产管理" >生产管理&nbsp;</option>
                  <option value="安全管理" >安全管理&nbsp;</option>
                  <option value="劳动管理" >劳动管理&nbsp;</option>
                  <option value="质量管理" >质量管理&nbsp;</option>
                  <option value="设备管理" >设备管理&nbsp;</option>
                  <option value="班组核算" >班组核算&nbsp;</option>
                  <option value="现场管理" >现场管理&nbsp;</option>
                  <option value="技术管理" >技术管理&nbsp;</option>
                  <option value="思想政治工作" >思想政治工作&nbsp;</option>
                </select>&nbsp;&nbsp;&nbsp;&nbsp;
          </td>
          </tr>
          <tr>
          <td colspan="2" align="left">
          <table width="100%" border="0" align="center" cellpadding="-2" cellspacing="-1">
          <tr>
          <td height="30" class="style1" align="left">是否设为车间管理"高压线":</td> 
          <td>
               <input type="radio" name="gyx" value="1"> 设为车间管理"高压线"
               <input type="radio" name="gyx" value="0" checked> 不设为车间管理"高压线"
          </td>
          </tr>
          </table>
          </td>
          </tr>
          <tr>
          <td colspan="2" align="left">
          <table width="100%" border="0" align="center" cellpadding="-2" cellspacing="-1">
          <tr>
          <td height="30" class="style1" align="left">是否对管理人员进行责任连带考核:</td> 
          <td width="50%">
               <input type="radio" name="ldkh" value="1"> 是
               <input type="radio" name="ldkh" value="0" checked> 否
          </td>
          </tr>
          </table>
          </td>
          </tr>
          <tr><td colspan="2"   class="style1" align="left">扣分情况:</td></tr>
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
              <td width="25%" align="center"><input type="text" name="kf1" value="0" size="5"> </td>
              <td width="25%" align="center"><input type="text" name="kf2" value="0" size="5"> </td>
              <td width="25%" align="center"><input type="text" name="kf3" value="0" size="5"> </td>
              <td width="25%" align="center"><input type="text" name="kf4" value="0" size="5"> </td>
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
              <td width="25%" align="center"><input type="text" name="jf1" value="0" size="5"> </td>
              <td width="25%" align="center"><input type="text" name="jf2" value="0" size="5"> </td>
              <td width="25%">&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            </table>
            </div>
          </td>
          </tr>
          <tr ><td height="20" colspan="2"></td></tr>
          <tr>
            <td colspan="2" height="30"  align="center" valign="middle"> 
                <input name="Button" type="button" class="Style_button" value="保&nbsp;&nbsp;存" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="Style_button" value="重&nbsp;&nbsp;置 ">                
                <input name="myclose" type="button" class="Style_button"  value="关&nbsp;&nbsp;闭"
				 onClick="javascrip:window.close()">
             </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">当前正在添加车间管理级考评标准信息.</font> <font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr>
</table>

  </body>
</html>

