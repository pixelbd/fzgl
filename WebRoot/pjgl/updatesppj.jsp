<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�޸�����������¼...</title>
    
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
{ alert("���������ڣ�"); form1.rq.focus(); return; }
if (form1.pjmc.value=="")
{ alert("������������ƣ�"); form1.pjmc.focus(); return; }
if (form1.zzcdh.value=="")
{ alert("���������쳧���ţ�"); form1.zzcdh.focus(); return;}
if (form1.zzsj.value=="")
{ alert("����������ʱ�䣡"); form1.zzsj.focus(); return; }
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
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/pjgl","root","123"); 
          Statement Smts; 
          ResultSet Rs;
          if (Con != null)
          {
            	
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
           
          if ((request.getParameter("ID1") != null)&&(request.getParameter("ID2") != null)) {
          String v1 = request.getParameter("ID1");
          String chej = request.getParameter("ID2"); 
          
          String sql = "select * from sppj"+chej+" where num='" + v1 + "'";
          Rs = Smts.executeQuery(sql);
          Rs.first(); 
 %>

<table align="center" width="560" height="500" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/xgpjspjl.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="pjgl/upsppjtj.jsp" METHOD="POST" name="form1">
        <table width="559" height="344"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr align="left">
            <td  height="27" align="left" class="style1">��&nbsp;&nbsp;�� </td>
             <td colspan="3" class="style1" ><input type="text" name="rq" class="Sytle_text" id="rq" value="<%=Rs.getString("rq")%>">&nbsp;*</td>
	  	  </tr>
	  	  <tr>
	  	    <td   class="style1">�������</td>
            <td align="left"><input type="text" name="pjmc" class="Sytle_text" id="pjmc" size="10" value="<%=Rs.getString("pjmc")%>">&nbsp;*</td>
            <td   colspan="2" class="style1">����ͺ�</td>
            <td  valign="center"><input type="text" name="xinghao" class="Sytle_text" id="xinghao" size="10" value="<%=Rs.getString("xinghao")%>"></td>
            <td  class="style1">������</td>
            <td  ><input name="pjbh" type="text" class="Sytle_text" id="pjbh" size="10" value="<%=Rs.getString("pjbh")%>"></td>
          </tr>
          <tr>
            <td height="25" ><span class="style1">ԭװ����</span></td>
            <td ><input width="10" name="chexing" type="text" class="Sytle_text" id="chexing" size="10" value="<%=Rs.getString("chexing")%>">&nbsp;</td>
            <td colspan="2" class="style1">��&nbsp;&nbsp;��</td>
            <td colspan="2"><input width="20" name="chehao" type="text" class="Sytle_text" id="chehao" size="20" value="<%=Rs.getString("chehao")%>"></td>
          </tr>
          <tr>
            <td  class="style1">���쳧����</td>
            <td colspan="2"><input width="20" name="zzcdh" type="text" class="Sytle_text" id="zzcdh" size="20" value="<%=Rs.getString("zzcdh")%>">&nbsp;*</td>
            <td colspan="1" class="style1">����ʱ��</td>
            <td colspan="3"><input width="20" name="zzsj" type="text" class="Sytle_text" id="zzsj" size="20" value="<%=Rs.getString("zzsj")%>">&nbsp;*</td>
          </tr>
          <tr>
          <td height="25"  align="left"><span class="style1">������λ</span></td>
          <td align="left" colspan="6" ><select name="bw" class="Sytle_select">
                          <option value="����" <%if (Rs.getString("bw").equals("����")) out.print("selected"); %> >����</option>
                          <option value="ת���" <%if (Rs.getString("bw").equals("ת���")) out.print("selected");%>>ת���</option>
                          <option value="����" <%if (Rs.getString("bw").equals("����")) out.print("selected");%>>����</option>
                          <option value="�����ƶ�" <%if (Rs.getString("bw").equals("�����ƶ�")) out.print("selected");%>>�����ƶ�</option>
                          <option value="�����ƶ�" <%if (Rs.getString("bw").equals("�����ƶ�")) out.print("selected");%>>�����ƶ�</option>
                          <option value="����" <%if (Rs.getString("bw").equals("����")) out.print("selected");%>>����</option>
                          </select>&nbsp;*</td>
          </tr>
          <tr >
          <td height="25"  align="left"><span class="style1">��������</span></td>
          <td align="left" colspan="6"><input name="guzhang" type="text" class="Style_text" id="guzhang" size="40"  value="<%=Rs.getString("guzhang")%>"></td>
          </tr>
          <tr>
          <td height="25"  align="left"  size="3"><span class="style1">����</span></td>
          <td align="left" colspan="6"><input name="shuliang" type="text" class="Style_text" id="shuliang" value="<%=Rs.getString("shuliang")%>"></td>
          </tr>
          <tr>
          <td height="25"  align="left" size="10"><span class="style1">����</span></td>
          <td align="left" colspan="6"><input name="chuli" type="text" class="Style_text" id="chuli" value="<%=Rs.getString("chuli")%>"></td>
          </tr>
          <tr>
            <td colspan="7" ><div align="center">
                <input name="ID2" type="hidden" class="Style_text" value="<%=chej%>">
                <input name="ID1" type="hidden"  value="<%=v1%>">
                <input name="Button" type="button" class="Style_button" value="��&nbsp;&nbsp;��" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="Style_button" value="��&nbsp;&nbsp;�� ">                
                <input name="myclose" type="button" class="Style_button" id="myclose" value="��&nbsp;&nbsp;��"
				 onClick="javascrip:window.close()">
                </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td>
  <div><font color="#D43939">��ǰ�����޸ģ�
   <%if (chej.equals("zz")) { %>֣�ݼ��޳���<%} 
   else {if (chej.equals("ys")) { %>��ɽ���޳���<%} 
   else {if (chej.equals("ly")) { %>�������޳���<%} 
   else {} }}%>����������...</font></div>
  <div><font color="#15600B">ע����<font color="#ff0080">&nbsp;*</font>&nbsp;�ŵ���ĿΪ���������ʡ�ԡ�</font></div>
  </td>
  </tr>
</table>
<% } }%>
  </body>
</html>
