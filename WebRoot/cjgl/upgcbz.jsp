<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>����������׼�޸�...</title>
    
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
-->
</style>
  </head>
   <LINK href="Css/stylerjhinsert.css" type=text/css rel=stylesheet>
  <body>
<%       request.setCharacterEncoding("gb2312");  
        Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
          Statement Smts; 
          ResultSet Rs;
          
          if (Con != null)
         {
          try
          { 	
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
           
          if ((request.getParameter("code") != null)) {
          String code = request.getParameter("code");
          String tabname = "gczlbz"; 
       
          
          String sql = "select * from "+tabname+" where code='" + code + "'";
          Rs = Smts.executeQuery(sql);
          Rs.first(); 
       %>

<table align="center" width="557" height="260" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/xggcbz.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="cjgl/upgcbztl.jsp" METHOD="POST" name="form1">
      <input name="code" type="hidden"  value="<%=code%>">
      <input name="oldfl" type="hidden"  value="<%=Rs.getString("fl")%>">
       <table width="559"  align="center" cellpadding="-2" cellspacing="0">
          <tr> <td  height="30" class="style1" align="left">����������׼����:</td></tr>
          <tr> <td align="center"><input name="bz" type="text" class="Sytle_text" size="80" value="<%=Rs.getString("bz")%>">&nbsp;*</td>
          </tr>
          <tr>
          <td height="30" class="style1" align="left">��������: 
          <select name="fl" class="Sytle_select">
                  <option value="ת��ܼ���" <%if (Rs.getString("fl").equals("ת��ܼ���")) out.print("selected"); %>>ת��ܼ���&nbsp;</option>
                  <option value="����ܼ���" <%if (Rs.getString("fl").equals("����ܼ���")) out.print("selected"); %>>����ܼ���&nbsp;</option>
                  <option value="�ֳ��ƶ�����" <%if (Rs.getString("fl").equals("�ֳ��ƶ�����")) out.print("selected"); %>>�ֳ��ƶ�����&nbsp;</option>
                  <option value="�ƶ�������" <%if (Rs.getString("fl").equals("�ƶ�������")) out.print("selected");%>>�ƶ�������&nbsp;</option>
                  <option value="��������" <%if (Rs.getString("fl").equals("��������")) out.print("selected");%>>��������&nbsp;</option>
                  <option value="�����ƶ�����" <%if (Rs.getString("fl").equals("�����ƶ�����")) out.print("selected");%>>�����ƶ�����&nbsp;</option>
                  <option value="�������" <%if (Rs.getString("fl").equals("�������")) out.print("selected");%>>�������&nbsp;</option>
                  <option value="�ֶԼ���" <%if (Rs.getString("fl").equals("�ֶԼ���")) out.print("selected");%>>�ֶԼ���&nbsp;</option>
                  <option value="��м���" <%if (Rs.getString("fl").equals("��м���")) out.print("selected");%>>��м���&nbsp;</option>
                  <option value="���������豸" <%if (Rs.getString("fl").equals("���������豸")) out.print("selected");%>>���������豸&nbsp;</option>
                  <option value="���ٸ���" <%if (Rs.getString("fl").equals("���ٸ���")) out.print("selected");%>>���ٸ���&nbsp;</option>
                  <option value="70t������" <%if (Rs.getString("fl").equals("70t������")) out.print("selected");%>>70t������&nbsp;</option>
                </select>
          </td>
          </tr>
          <tr>  
            <td  height="30" class="style1" align="left">�۷����:&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="kf" type="text" class="Sytle_text" size="5" value="<%=Rs.getString("kf")%>">&nbsp;*</td>
          </tr>
          <tr>  
            <td  height="30" class="style1" align="left">�ӷ����:&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="jf" type="text" class="Sytle_text" size="5" value="<%=Rs.getString("jf")%>">&nbsp;</td>
          </tr>
          <tr>
            <td  height="30"  align="center" valign="middle"> 
                <input name="Button" type="submit" class="Style_btn" value="��&nbsp;&nbsp;��" >
                <input name="Submit2" type="reset" class="Style_btn" value="��&nbsp;&nbsp;�� ">                
                <input name="myclose" type="button" class="Style_btn"  value="��&nbsp;&nbsp;��" onClick="javascrip:window.close()">
            </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">��ǰ�����޸Ĺ���������׼��Ϣ.</font> <font color="#15600B">ע����<font color="#ff0080">&nbsp;*</font>&nbsp;�ŵ���ĿΪ���������ʡ�ԡ�</font></div>
  </td>
  </tr>
</table>
<% }  
				    }
		           
                   catch (SQLException e)
            		{
            			out.println("δ�ҵ�����������¼!");
            		}
            		finally
            		{  }	
      }    %>
  </body>
</html>
