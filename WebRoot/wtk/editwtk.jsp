<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="Gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�޸������</title>
    
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
if (form1.tcrq.value=="")
{ alert("����������������ڣ�");form1.tcrq.focus();return;}
if (form1.wt.value=="")
{ alert("�������������ݣ�");form1.wt.focus();return;}
if (form1.fzr.value=="")
{ alert("�����븺���ˣ�");form1.fzr.focus();return;}
if (form1.wtlb.value=="")
{ alert("��ѡ���������");form1.wtlb.focus();return;}
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
  
  <body  background="Images/bg2.gif">
   <script language="javascript">
   function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
   if(rtn!=null)
		field.value=rtn;
   return;
   }
  </script>
  <%
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/wtk","root","123"); 
          Statement Smts; 
          ResultSet Rs;
          String str="";
          if (Con != null)
            	{
            	
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
           
          if ((request.getParameter("tabname") != null)&&(request.getParameter("id") != null)) {
          String id = request.getParameter("id");
          String tabname = request.getParameter("tabname"); 
          if (tabname.equals("wtkzz")) {  str =  "֣�ݼ��޳��������"; 	}
          if (tabname.equals("wtkys")) {  str =  "��ɽ���޳��������"; 	}
          if (tabname.equals("wtkly")) {  str =  "�������޳��������"; 	}
          if (tabname.equals("wtkzl")) {  str =  "֣�����ᳵ�������"; 	}
          if (tabname.equals("dwtk")) {  str =  "�μ������"; 	}
          
          
          String sql = "select * from "+tabname+" where num='" + id + "'";
          Rs = Smts.executeQuery(sql);
          Rs.first(); 
          
 %>

<table align="center" width="557" height="400" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/xgwtkjl.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="wtk/editwtktj.jsp" METHOD="POST" name="form1">
      <input name="id" type="hidden"  value="<%=id%>">
      <input name="tabname" type="hidden"  value="<%=tabname%>">
      <div align="left">       
        </div><table width="559" height="250"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr align="left">
            <td  colspan="2"  height="30" align="center" class="style1">��ǰ�����:&nbsp;&nbsp;<%=str%></td>
          </tr>
	  	 <tr>
	  	    <td width="100" height="28" class="style1" align="center" valign="top">��������:</td>
            <td align="left"><textarea  name="wt"  class="Sytle_text"  cols="64" rows="15"><%=Rs.getString("wt")%></textarea></td>
          </tr>
         
          <tr>
            <td   height="28" class="style1" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;ʩ:</td>
            <td  valign="center"><input type="text" name="cs" class="Sytle_text"  size="40" value="<%=Rs.getString("cs")%>">&nbsp;*</td>
          </tr><tr>  
            <td  height="28" class="style1" align="center">�������:</td>
            <td><select name="wtlb" class="Sytle_select">
                  <option value="1" <%if (Rs.getString("wtlb").equals("1")) out.print("checked"); %>>�豸&nbsp;</option>
                  <option value="2" <%if (Rs.getString("wtlb").equals("2")) out.print("checked"); %>>����ִ��&nbsp;</option>
                  <option value="3" <%if (Rs.getString("wtlb").equals("3")) out.print("checked"); %>>��ȫ&nbsp;</option>
                  <option value="4" <%if (Rs.getString("wtlb").equals("4")) out.print("checked"); %>>����&nbsp;</option>
               </select>&nbsp;*
           </td>
          </tr>
          <tr>  
            <td  height="28" class="style1" align="center">��&nbsp;��&nbsp;��:</td>
            <td  ><input name="fzr" type="text" class="Sytle_text" size="15" value="<%=Rs.getString("fzr")%>">&nbsp;*</td>
          </tr>
          <tr>
            <td height="28" align="center"><span class="style1" >���ʱ��:</span></td>
            <td ><input width="10" name="tcrq" type="text" class="Sytle_text"  size="10" onDBLClick="loadCalendar(this)" value="<%=Rs.getString("tcrq")%>">&nbsp;*</td>
          </tr>
          <tr> 
           <td height="28" class="style1" align="center">���ʱ��:</td>
            <td ><input width="20" name="jjrq" type="text" class="Sytle_text"  size="10" onDBLClick="loadCalendar(this)" <% if (Rs.getString("jjrq")!=null) { %> value="<%=Rs.getString("jjrq")%>" <%} %>></td>
          </tr>
          <tr> 
           <td height="28" class="style1" valign="top" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;ע:</td>
            <td valign="top" ><input width="20" name="bz" type="text" class="Sytle_text"  size="70" <% if (Rs.getString("bz")!=null) { %> value="<%=Rs.getString("bz")%>" <%} %> ></td>
          </tr>
          <tr>
            <td colspan="2" ><div align="center">
                <input name="Button" type="button" class="Style_button" value="��&nbsp;&nbsp;��" onClick="Mycheck()">
                <input name="myclose" type="button" class="Style_button" id="myclose" value="��&nbsp;&nbsp;��"
				 onClick="javascrip:window.close()">
                </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="60">
  <div><font color="#D43939">��ǰ�����޸�������¼</font></div>
  <div><font color="#15600B">ע����<font color="#ff0080">&nbsp;*</font>&nbsp;�ŵ���ĿΪ���������ʡ�ԡ�</font></div>
  </td>
  </tr>
</table>
<%  } }  %>
  </body>
</html>
