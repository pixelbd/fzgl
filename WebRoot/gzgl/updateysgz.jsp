<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�޸����շ��ֹ��ϼ�¼...</title>
    
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
{ alert("���������ڣ�");form1.rq.focus();return;}
if (form1.ysy.value=="")
{ alert("����������Ա��");form1.ysy.focus();return;}
if (form1.zrbz.value=="")
{ alert("���������ΰ��飡");form1.zrbz.focus();return;}
if (form1.zrr.value=="")
{ alert("�����������ˣ�");form1.zrr.focus();return;}
if (form1.gzms.value=="")
{ alert("��������������");form1.gzms.focus();return;}
if (form1.bw.value=="")
{ alert("��������ϲ�λ��");form1.bw.focus();return;}
if (form1.lb.value=="")
{ alert("������������");form1.lb.focus();return;}
if (form1.ch.value=="")
{ alert("�����복�Ż������ţ�");form1.ch.focus();return;}
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
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
          Statement Smts; 
          ResultSet Rs;
          if (Con != null)
            	{
            	
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
           
          if ((request.getParameter("ID1") != null)&&(request.getParameter("ID2") != null)) {
          String v1 = request.getParameter("ID1");
          String chej = request.getParameter("ID2"); 
          
          String sql = "select * from ysgz"+chej+" where id='" + v1 + "'";
          Rs = Smts.executeQuery(sql);
          Rs.first(); 
       %>

<table align="center" width="557" height="400" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/xgysjl.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="gzgl/upysgztj.jsp" METHOD="POST" name="form1">
      <input name="cj" type="hidden" id="" value="<%=chej%>">
      <input name="id" type="hidden" id="" value="<%=v1%>">
      <table width="559" height="250"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr align="left">
            <td  height="40" align="left" class="style1">��&nbsp;&nbsp;�� </td>
             <td colspan="2" class="style1"   ><input type="text" name="rq" class="Sytle_text" id="rq" value="<%=Rs.getString("rq")%>">&nbsp;*</td>
             <td colspan="3" class="style1"  > </td>
	  	  </tr>
	  	  <tr>
	  	    <td  height="40" class="style1">����Ա</td>
            <td align="left"><input type="text" name="ysy" class="Sytle_text" id="ysy" size="10" value="<%=Rs.getString("ysy")%>">&nbsp;*</td>
            <td   colspan="2" class="style1">���ΰ���</td>
            <td  valign="center"><input type="text" name="zrbz" class="Sytle_text" id="zrbz" size="10" value="<%=Rs.getString("zrbz")%>">&nbsp;*</td>
            <td  class="style1">������</td>
            <td  ><input name="zrr" type="text" class="Sytle_text" id="zrr" size="10" value="<%=Rs.getString("zrr")%>">&nbsp;*</td>
          </tr>
          <tr>
            <td height="40" ><span class="style1">����</span></td>
            <td ><input width="10" name="cx" type="text" class="Sytle_text" id="cx" size="10" value="<%=Rs.getString("cx")%>">&nbsp;</td>
            <td colspan="2" class="style1">����/������</td>
            <td colspan="2"><input width="20" name="ch" type="text" class="Sytle_text" value="<%=Rs.getString("ch")%>" size="20">&nbsp;*</td>
          </tr>
          
          <tr>
          <td height="40"  align="left"><span class="style1">������λ</span></td>
          <td align="left" colspan="6" ><select name="bw" class="Sytle_select">
                          <option value="����" <%if (Rs.getString("bw").equals("����")) out.print("selected");%>>����</option>
                          <option value="ת���" <%if (Rs.getString("bw").equals("ת���")) out.print("selected");%>>ת���</option>
                          <option value="����" <%if (Rs.getString("bw").equals("����")) out.print("selected");%>>����</option>
                          <option value="�����ƶ�" <%if (Rs.getString("bw").equals("�����ƶ�")) out.print("selected");%> >�����ƶ�</option>
                          <option value="�����ƶ�" <%if (Rs.getString("bw").equals("�����ƶ�")) out.print("selected");%>>�����ƶ�</option>
                          <option value="����" <%if (Rs.getString("bw").equals("����")) out.print("selected");%>>����</option>
                          </select>&nbsp;*</td>
          </tr>
          <tr>
          <td height="40"  align="left"><span class="style1">�������</span></td>
          <td align="left" colspan="6" ><select name="lb" class="Sytle_select">
                          <option value="A" <%if (Rs.getString("lb").equals("A")) out.print("selected");%>>A�ࣨ���͹��ϣ�</option>
                          <option value="B" <%if (Rs.getString("lb").equals("B")) out.print("selected");%>>B�ࣨ��Ҫ���ϣ�</option>
                          <option value="C" <%if (Rs.getString("lb").equals("C")) out.print("selected");%>>C�ࣨһ����ϣ�</option>
                          </select>&nbsp;*</td>
          </tr>
          <tr>
          <td height="40"  align="left"><span class="style1">��������</span></td>
          <td align="left" colspan="6"><input name="gzms" type="text" class="Style_text" value="<%=Rs.getString("gzms") %>" size="60">&nbsp;*</td>
          </tr>
         
          
         <tr>
            <td colspan="7" ><div align="center">
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
  <div><font color="#D43939">��ǰ�����޸�����ǩ����
   <%if (chej.equals("zz")) { %>֣�ݼ��޳���<%} 
   else {if (chej.equals("ys")) { %>��ɽ���޳���<%} 
   else {if (chej.equals("ly")) { %>�������޳���<%} 
   else {} }}%>��ͳ-93�������...</font></div>
  <div><font color="#15600B">ע����<font color="#ff0080">&nbsp;*</font>&nbsp;�ŵ���ĿΪ���������ʡ�ԡ�</font></div>
  </td>
  </tr>
</table>
<%}}  %>
  </body>
</html>

