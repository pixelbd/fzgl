<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�豸���Ϸ���...</title>
    
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
if (form1.zr1.value=="")
{ alert("�����������ж���");form1.xfsj.focus();return;}

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
           
          if (request.getParameter("id") != null) {
          String id = request.getParameter("id");
          String sql = "select * from sbwx  where id='" +id + "'";
          Rs = Smts.executeQuery(sql);
          Rs.first(); 
       %>

<table align="center" width="557" height="160" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/sbzrfx.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
     <form ACTION="sbgl/judgetj.jsp" METHOD="POST" name="form1">
      <table width="559" height="60"  border="0" align="center" cellpadding="-2" cellspacing="0">
      <input name="id" type="hidden" value="<%=id%>">
          <tr align="left" height="35">
            <td width="30%"  align="left" class="style1">�豸���ϲ���ԭ��</td>
            <td width="70%"><select name="gz1" class="Sytle_select">
                  <option value="�������" >�������</option>
                  <option value="ʹ�á���������" >ʹ�á���������</option>
                  <option value="������ϸ�" >������ϸ�</option>
                  <option value="���졢��װ����" >���졢��װ����</option>
                  <option value="ά�޲���" >ά�޲��������Ĺ���</option>
             </select></td>
          </tr>
          <tr height="35">
             <td width="30%" class="style1">�豸���ϲ��������϶� </td>
             <td width="70%"><select name="zr1" class="Sytle_select">
                  <option value="������" >������</option>
                  <option value="֣�ݼ��޳���" >֣�ݼ��޳���</option>
                  <option value="��ɽ���޳���" >��ɽ���޳���</option>
                  <option value="�������޳���" >�������޳���</option>
                  <option value="֣�����ᳵ��" >֣�����ᳵ��</option>
                  <option value="�豸����" >�豸����</option>
                  <option value="���Ͽ�" >���Ͽ�</option>
                  <option value="������" >������</option>
             </select></td>
             <td></td>
          </tr>
	  	  <tr align="left" height="35">
            <td width="30%"  align="left" class="style1">�豸�����޸�������� </td>
            <td width="70%">
            <select name="gz2" class="Sytle_select">
                  <option value="��ʱ�޸�" >��ʱ�޸�</option>
                  <option value="ά�޲���" >ά�޲���</option>
                  <option value="������ϸ�" >������ϸ�</option>
                  <option value="δ��ʱ��ϵ����" >δ��ʱ��ϵ����</option>
                  <option value="�ϴ����" >�ϴ���ϲ��ܶ�ʱ���޸�</option>
             </select></td>
          </tr>
          <tr>
             <td width="30%" height="35" class="style1"  >�豸����δ��ʱ�޸�����</td>
             <td width="70%">
             <select name="zr2" class="Sytle_select">
                  <option value="������" >������</option> 
                  <option value="�豸����" >�豸����</option>
                  <option value="���Ͽ�" >���Ͽ�</option>
                  <option value="������" >������</option>
             </select></td>
             <td></td>
	  	  </tr>
	  	  <tr>
	  	      <td height="30" colspan="3" ><div align="center">
                <input name="Button" type="button" class="Style_button" value="��&nbsp;&nbsp;��" onClick="Mycheck()">
                <input name="myclose" type="button" class="Style_button" id="myclose" value="��&nbsp;&nbsp;��"
				 onClick="javascrip:window.close()">
                </div></td>
          </tr>
        </table>
        </form>
      </td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">��ǰ���ڶԱ��[ <%=Rs.getString("code")%>]�豸����������з���...</font></div>
  
  </td>
  </tr>
</table>
<%}}  %>
  </body>
</html>

