<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�޸Ļ����¼...</title>
    
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
{ alert("������������ڣ�");form1.rq.focus();return;}
if (form1.rt.value=="")
{ alert("������������⣡");form1.rt.focus();return;}
if (form1.cjr.value=="")
{ alert("���������μ��ˣ�");form1.cjr.focus();return;}
if (form1.zcr.value=="")
{ alert("�����������ˣ�");form1.zcr.focus();return;}
if (form1.nr.value=="")
{ alert("��������������");form1.nr.focus();return;}
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
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/hygl","root","123"); 
          Statement Smts; 
          ResultSet Rs;
          String meeting="";
          if (Con != null)
            	{
            	
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
           
          if ((request.getParameter("ID1") != null)&&(request.getParameter("ID2") != null)) {
          String id = request.getParameter("ID1");
          String tabname = request.getParameter("ID2"); 
          if (tabname.equals("cjschzz")) {  meeting =  "֣�ݼ��޳�������������"; 	}
          if (tabname.equals("cjschys")) {  meeting =  "��ɽ���޳�������������"; 	}
          if (tabname.equals("cjschly")) {  meeting =  "�������޳�������������"; 	}
          if (tabname.equals("cjschzl")) {  meeting =  "֣�����ᳵ������������"; 	}
          if (tabname.equals("cjlxhzz")) {  meeting =  "֣�ݼ��޳�����ϯ��"; 	}
          if (tabname.equals("cjlxhys")) {  meeting =  "��ɽ���޳�����ϯ��"; 	}
          if (tabname.equals("cjlxhly")) {  meeting =  "�������޳�����ϯ��"; 	}
          if (tabname.equals("cjlxhzl")) {  meeting =  "֣�����ᳵ����ϯ��"; 	}
          if (tabname.equals("cjzlhzz")) {  meeting =  "֣�ݼ��޳�������������"; 	}
          if (tabname.equals("cjzlhys")) {  meeting =  "��ɽ���޳�������������"; 	}
          if (tabname.equals("cjzlhly")) {  meeting =  "�������޳�������������"; 	}
          if (tabname.equals("cjzlhzl")) {  meeting =  "֣�����ᳵ������������"; 	}
          if (tabname.equals("cjzthzz")) {  meeting =  "֣�ݼ��޳���ר�������"; 	}
          if (tabname.equals("cjzthys")) {  meeting =  "��ɽ���޳���ר�������"; 	}
          if (tabname.equals("cjzthly")) {  meeting =  "�������޳���ר�������"; 	}
          if (tabname.equals("cjzthzl")) {  meeting =  "֣�����ᳵ��ר�������"; 	}
          if (tabname.equals("dsch")) {  meeting =  "������������"; 	}
          if (tabname.equals("dqth")) {  meeting =  "�μ���������"; 	}
          
          
          String sql = "select * from "+tabname+" where id='" + id + "'";
          Rs = Smts.executeQuery(sql);
          Rs.first(); 
       %>

<table align="center" width="557" height="400" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/xghyjl.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="hygl/updatehytj.jsp" METHOD="POST" name="form1">
      <input name="ID1" type="hidden"  value="<%=id%>">
      <input name="ID2" type="hidden"  value="<%=tabname%>">
      <div align="left">       
        </div><table width="559" height="250"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr align="left">
            <td  width="100" height="30" align="left" class="style1">��������:&nbsp;&nbsp;</td>
             <td  class="style1"   ><%=meeting%></td>
          </tr>
	  	 <tr>
	  	    <td  height="30" class="style1">��������:</td>
            <td align="left"><input type="text" name="rt" class="Sytle_text" id="rt"  size="40" value="<%=Rs.getString("rt")%>">&nbsp;*</td>
          </tr>
         <tr>
            <td height="30"   class="style1">����ʱ��:</td>
            <td  valign="center"><input type="text" name="rq" class="Sytle_text" id="rq" size="10" value="<%=Rs.getString("rq")%>">&nbsp;*</td>
          </tr>
          <tr>  
            <td height="30" class="style1">��&nbsp;��&nbsp;��:</td>
            <td  ><input name="zcr" type="text" class="Sytle_text" id="zcr" size="10" value="<%=Rs.getString("zcr")%>">&nbsp;*</td>
          </tr>
          <tr>
            <td height="30" ><span class="style1">��&nbsp;��&nbsp;��:</span></td>
            <td ><input width="10" name="cjr" type="text" class="Sytle_text" id="cjr" size="60" value="<%=Rs.getString("cjr")%>">&nbsp;</td>
          </tr>
          <tr> 
           <td height="30" class="style1" valign="top">��������</td>
            <td >
            <textarea  name="nr"  class="Sytle_text"  cols="64" rows="20" ><%=Rs.getString("nr")%></textarea>
            </td>
          </tr>
          <% if  ((tabname.equals("dqth"))||(tabname.equals("dsch")))
	  	  {  	
	  	  %>
	  	  <tr> 
           <td  class="style1">����ص�</td>
            <td ><input width="20" name="nr" type="text" class="Sytle_text" value="<%=Rs.getString("dd")%>" size="20">&nbsp;*</td>
          </tr>
          <% } %>
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
  <div><font color="#D43939">��ǰ�����޸Ļ����¼</font></div>
  <div><font color="#15600B">ע����<font color="#ff0080">&nbsp;*</font>&nbsp;�ŵ���ĿΪ���������ʡ�ԡ�</font></div>
  </td>
  </tr>
</table>
<%  } }  %>
  </body>
</html>

