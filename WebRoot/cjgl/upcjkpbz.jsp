<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�������������׼�޸�...</title>
    
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
</head>
<link href="Css/stylerjhinsert.css" rel="stylesheet">
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
          String tabname = "cjkpbz"; 
       
          
          String sql = "select * from "+tabname+" where code='" + code + "'";
          Rs = Smts.executeQuery(sql);
          Rs.first(); 
       %>

<table align="center" width="557" height="260" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/xgcpbz.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="cjgl/upcjkpbztl.jsp" METHOD="POST" name="form1">
      <input name="code" type="hidden"  value="<%=code%>">
      <input name="oldfl" type="hidden"  value="<%=Rs.getString("fl")%>">
       <table width="559"  align="center" cellpadding="-2" cellspacing="0">
          <tr> <td  height="30" class="style1" align="left">������׼����:</td></tr>
          <tr> <td align="center"><input name="bz" type="text" class="Sytle_text" size="80" value="<%=Rs.getString("bz")%>">&nbsp;*</td>
          </tr>
          <tr>
          <td height="30" class="style1" align="left">��������: 
          <select name="fl" class="Sytle_select">
                  <option value="��������" <%if (Rs.getString("fl").equals("��������")) out.print("selected"); %>>��������&nbsp;</option>
                  <option value="�ֳ��ƶ�" <%if (Rs.getString("fl").equals("�ֳ��ƶ�")) out.print("selected");%>>�ֳ��ƶ�&nbsp;</option>
                  <option value="��������" <%if (Rs.getString("fl").equals("��������")) out.print("selected");%>>��������&nbsp;</option>
                  <option value="����" <%if (Rs.getString("fl").equals("����")) out.print("selected");%>>����&nbsp;</option>
                  <option value="ת���" <%if (Rs.getString("fl").equals("ת���")) out.print("selected");%>>ת���&nbsp;</option>
                  <option value="��������" <%if (Rs.getString("fl").equals("��������")) out.print("selected");%>>��������&nbsp;</option>
                  <option value="�ƶ���" <%if (Rs.getString("fl").equals("�ƶ���")) out.print("selected");%>>�ƶ���&nbsp;</option>
                  <option value="�����ƶ����" <%if (Rs.getString("fl").equals("�����ƶ����")) out.print("selected");%>>�����ƶ����&nbsp;</option>
                  <option value="�ֶ�" <%if (Rs.getString("fl").equals("�ֶ�")) out.print("selected");%>>�ֶ�&nbsp;</option>
                  <option value="�������" <%if (Rs.getString("fl").equals("�������")) out.print("selected");%>>�������&nbsp;</option>
                  <option value="HMIS��Ϣ¼��" <%if (Rs.getString("fl").equals("HMIS��Ϣ¼��")) out.print("selected");%>>HMIS��Ϣ¼��&nbsp;</option>
                </select>
          </td>
          </tr>
          <tr>  
       <td colspan="2"   class="style1" align="left">�۷����:</td></tr>
          <tr>
            <td colspan="2" align="center"  >
            <div>
            <table width="90%"    class=tableBorder cellpadding="-1" cellspacing="-1">
            <tr>
              <td width="25%" height="30"  align="center">ְ���۷�</td> 
              <td width="25%" height="30"  align="center">����(����)�۷�</td>
              <td width="25%" height="30"  align="center">�����쵼�۷�</td>
              <td width="25%" height="30"  align="center">����רְ�۷�</td>
            </tr>
            <tr>
              <td width="25%" align="center"><input type="text" name="kf1" value="<%=Rs.getString("kf1")%>" size="5"> </td>
              <td width="25%" align="center"><input type="text" name="kf2" value="<%=Rs.getString("kf2")%>" size="5"> </td>
              <td width="25%" align="center"><input type="text" name="kf3" value="<%=Rs.getString("kf3")%>" size="5"> </td>
              <td width="25%" align="center"><input type="text" name="kf4" value="<%=Rs.getString("kf4")%>" size="5"> </td>
            </tr>
            </table>
            </div>
            </td>
          </tr>
          <tr><td colspan="2"   class="style1" align="left">�ӷ����:</td></tr>
          <tr>
          <td colspan="2" align="center"  >
          <div>
            <table width="90%"    class=tableBorder cellpadding="-1" cellspacing="-1">
            <tr>
              <td width="25%" height="30"  align="center">ְ���ӷ�</td> 
              <td width="25%" height="30"  align="center">����(����)�ӷ�</td>
              <td width="25%" height="30"  align="center"></td>
              <td width="25%" height="30"  align="center"></td>
             </tr>
            <tr>
              <td width="25%" align="center"><input type="text" name="jf1" value="<%=Rs.getString("jf1")%>" size="5"> </td>
              <td width="25%" align="center"><input type="text" name="jf2" value="<%=Rs.getString("jf2")%>" size="5"> </td>
              <td width="25%">&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            </table>
            </div>
          </td>
          </tr><tr>  
            <td  height="30" class="style1" align="left">
            <table><tr>
                 <td height="30" class="style1" align="left">�Ƿ���Ϊ�������"��ѹ��": </td> 
          <td>
               <input type="radio" name="gyx" value="1" <%if (Rs.getString("gyx").equals("1")) out.print("checked");%>> ��Ϊ�������"��ѹ��"
               <input type="radio" name="gyx" value="0" <%if (Rs.getString("gyx").equals("0")) out.print("checked");%>> ����Ϊ�������"��ѹ��"
          </td>
          </tr></table></td>
          </tr>
          <tr>
          <td colspan="2" align="left">
          <table width="100%" border="0" align="center" cellpadding="-2" cellspacing="-1">
          <tr>
          <td height="30" class="style1" align="left">�Ƿ�Թ�����Ա����������������:</td> 
          <td width="50%">
               <input type="radio" name="ldkh" value="1"  <%if (Rs.getString("ldkh").equals("1")) out.print("checked");%>> ��
               <input type="radio" name="ldkh" value="0"  <%if (Rs.getString("ldkh").equals("0")) out.print("checked");%>> ��
          </td>
          </tr>
          </table>
          </td>
          </tr>
          <tr ><td height="15" colspan="2"></td></tr>
          <tr>
            <td  height="30"  align="center" valign="middle"> 
                <input name="Button" type="submit" class="Style_button" value="��&nbsp;&nbsp;��" >
                <input name="Submit2" type="reset" class="Style_button" value="��&nbsp;&nbsp;�� ">                
                <input name="myclose" type="button" class="Style_button"  value="��&nbsp;&nbsp;��" onClick="javascrip:window.close()">
            </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">��ǰ�����޸ĳ������������׼��Ϣ.</font> <font color="#15600B">ע����<font color="#ff0080">&nbsp;*</font>&nbsp;�ŵ���ĿΪ���������ʡ�ԡ�</font></div>
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
