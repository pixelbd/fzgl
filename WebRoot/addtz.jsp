<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>���֪ͨͨ��...</title>
    
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
 if (form1.yxrq.value=="")
 { alert("��������Ч���ڣ�");form1.yxrq.focus();return;}
 if (form1.pzr.value=="")
 { alert("��������׼�ˣ�");form1.pzr.focus();return;}
   if (form1.bt.value=="")
 { alert("������֪ͨ���⣡");form1.bt.focus();return;}
 if (form1.yxrq.value=="")
 { alert("���������ݣ�");form1.nr.focus();return;}
 var bm= document.getElementsByName("bm");
 var flag = false;
 for(var i=0;i<bm.length;i++){
  if(bm[i].checked == true){
   flag = true;
   break;
  }
 }
 if(!flag){  alert("������ѡ��һ�����ղ���");  }

form1.submit();
}
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

<body background="Images/bg2.gif" >
    <script language="javascript">
	function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
   }
   function checkAllBox(obj){
 var bm= document.getElementsByName("bm");
 if(obj.checked==true){
  for(var i=0;i<bm.length;i++){
   bm[i].checked = true;
  }
 }else{
  for(var i=0;i<bm.length;i++){
   bm[i].checked = false;
  }
 }
}

  </script>
<%
  request.setCharacterEncoding("gb2312");  

  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
  java.util.Date today=new java.util.Date();
  String now = formatter.format(today); 
      
  boolean islog=false;
  String fbr="";
  String fbbm="";
  
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
  }      
        
         
         
               
%>
<table align="center" width="100%" border="0" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td align="center"  width="100%" valign="top"><img width="557" height="70" src="Images/tjtztg.gif" border="0"></td>
  </tr>
  <tr>
    <td><div>      
      <form ACTION="addtztj.jsp" METHOD="POST" name="form1" >
      <table width="100%" height="240"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr>  
            <td  height="30" class="style1" align="center">&nbsp;&nbsp;��&nbsp;��&nbsp;��:</td>
            <td   height="30" class="style1" align="left"><%=fbr%>
            <input type="hidden" value=<%=fbr%> name="fbr">
            &nbsp;&nbsp;��������:<%=now%>
            <input type="hidden" value=<%=now%> name="rq">
            &nbsp;&nbsp;��������:<%=fbbm%>
            <input type="hidden" value=<%=fbbm%> name="fbbm"></td>
          </tr>
          <tr>
            <td   height="30" class="style1" align="center">&nbsp;&nbsp;��Ч����:</td>
            <td  valign="center"><input type="text" name="yxrq" class="Sytle_text" id="rq" size="15" onDBLClick="loadCalendar(this)">&nbsp;*</td>
          </tr>
          <tr>
            <td height="30" align="center"><span class="style1" >&nbsp;&nbsp;��&nbsp;׼&nbsp;��:</span></td>
            <td ><input width="10" name="pzr" type="text" class="Sytle_text" id="pzr" size="14" >&nbsp;*</td>
          </tr>
         <tr><td height="30" align="center"><span class="style1" >&nbsp;&nbsp;���ղ���:</span></td>
           <td>
            <input name="checkall" type="checkbox" value="" onClick="checkAllBox(this);"/><font color='#334094'>ȫѡ</font><br>
   			<input name="bm" type="checkbox" value="a"/><font color='#669999'>���쵼&nbsp;&nbsp;</font>
  			<input name="bm" type="checkbox" value="j22"/><font color='#669999'>������&nbsp;&nbsp;</font>
 		    <input name="bm" type="checkbox" value="j21"/><font color='#669999'>������&nbsp;&nbsp;</font>
   			<input name="bm" type="checkbox" value="j25"/><font color='#669999'>�ʼ��&nbsp;&nbsp;</font>
   			<input name="bm" type="checkbox" value="j23"/><font color='#669999'>���ȿ�&nbsp;&nbsp;</font>
   			<input name="bm" type="checkbox" value="j24"/><font color='#669999'>���Ͽ�&nbsp;&nbsp;</font><br>
   			<input name="bm" type="checkbox" value="j41"/><font color='#669999'>֣�ݼ��޳���&nbsp;</font>
   			<input name="bm" type="checkbox" value="j42"/><font color='#669999'>��ɽ���޳���&nbsp;</font>
   			<input name="bm" type="checkbox" value="j43"/><font color='#669999'>�������޳���&nbsp;</font>
   			<input name="bm" type="checkbox" value="j44"/><font color='#669999'>֣�����ᳵ��&nbsp;</font>
   		  </td>
         </tr>
         <tr>
	  	    <td  height="30" class="style1" align="center">&nbsp;&nbsp;֪ͨ����:</td>
            <td align="left"><input type="text" name="bt" class="Sytle_text" id="rt" size="70" >&nbsp;*</td>
          </tr>
          <tr> 
           <td height="160" class="style1" valign="top" align="center">&nbsp;&nbsp;��ϸ����:</td>
            <td valign="top" ><textarea  name="nr"  class="Sytle_text"  cols="66" rows="10"></textarea> </td>
          </tr>
          <tr>
            <td colspan="2" height="28"  align="center" valign="middle"> 
                <input name="Button" type="button" class="Style_button" value="��&nbsp;&nbsp;��" onClick="Mycheck()">
                <input name="myclose" type="button" class="Style_button" id="myclose" value="��&nbsp;&nbsp;��"
				 onClick="javascrip:window.close()">
                 </td>
          </tr>
        </table>
      </form>
      </div>
      </td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">&nbsp; ��ǰ�������֪ͨ��ͨ��.</font> <font color="#15600B">ע����<font color="#ff0080">&nbsp;*</font>&nbsp;�ŵ���ĿΪ���������ʡ�ԡ�</font></div>
  </td>
  </tr>
</table>

  </body>
</html>

