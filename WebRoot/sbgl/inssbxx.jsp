<%@ page language="java"  import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>����豸������Ϣ...</title>
    
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
if (formup.made.value=="")
{ alert("�������豸����ʱ�䣡"); formup.made.focus(); return;}
if (formup.mc.value=="")
{ alert("�������豸���ƣ�"); formup.mc.focus(); return;}
if (formup.code.value=="")
{ alert("�������豸��ţ�"); formup.code.focus(); return;}
if (formup.fl.value=="")
{ alert("��ѡ���豸���"); formup.fl.focus(); return;}
formup.submit();}
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
    <script language="javascript">
   function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
   }
   function change1()
   { form1.submit();}
   function changebz()
   { formbz.submit();}
   </script>
<% 
//����:zjid�ʼ�Ա���֤��,chej�������,code�������,gzcode���ϱ���,fl���Ϸ���,ms����������
  Class.forName("org.gjt.mm.mysql.Driver").newInstance();
  Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123");  
  Statement Smts; 
  ResultSet Rs;
  Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);     
  
  request.setCharacterEncoding("gb2312"); 
  
  boolean islog=false;
  
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
 %>
 <%   
     String bz="";
     if (request.getParameter("bz")!=null)  bz=new String(request.getParameter("bz"));
     String chejstr="";
     String chej="";
     if (request.getParameter("cj")!=null)  chej=new String(request.getParameter("cj"));
     if (chej.equals("41")) chejstr="֣�ݼ���";
     if (chej.equals("42")) chejstr="��ɽ����";
     if (chej.equals("43")) chejstr="��������";
     if (chej.equals("44")) chejstr="֣������";
     
     String sqlbz="select bz,code from banzu where cj='"+chej+"' and code<>'' order by code";
     
     if(islog) {
      if (((String)session.getAttribute("deptment")).equals("41")) chejstr="֣�ݼ���";
      if (((String)session.getAttribute("deptment")).equals("42")) chejstr="��ɽ����";
      if (((String)session.getAttribute("deptment")).equals("43")) chejstr="��������";
      if (((String)session.getAttribute("deptment")).equals("44")) chejstr="֣������"; 
      
      if (((String)session.getAttribute("deptment")).equals("admin")
           || ((String)session.getAttribute("deptment")).equals("22")
           || ((String)session.getAttribute("zw")).equals("3")
           || ((String)session.getAttribute("zw")).equals("cjadmin")) 
   { 
    //ϵͳ����Ա������Ա���������Ա�����䰲ȫԱ��Ȩ�޸��豸��Ϣ�����䰲ȫԱֻ���޸ı������豸��Ϣ��
  
    int CountR = 0;
    
    //��������Ϣ�а�����а�����Ϣ
     %>

<table align="center" width="557" height="260" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
  <td width="557"   valign="top">
  <table align="center" width="557" height="90"  bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2"  >
  <tr>
    <td width="557" height="70" valign="top" colspan="2">
    <table  width="100%" height="70"  border="0" cellpadding="-2" cellspacing="-2" background="Images/tjsbxx.gif">
    <tr><td></td></tr>  
    </table> 
    </td>
   </tr>
  <tr>
  <% if (((String)session.getAttribute("deptment")).equals("41") || ((String)session.getAttribute("deptment")).equals("42")
        || ((String)session.getAttribute("deptment")).equals("43") || ((String)session.getAttribute("deptment")).equals("44"))
    {  %>
    <td width="557" height="30" valign="top">�豸ʹ�ó��䣺<font color="#ff0080"><%=chejstr%></font></td>
 <% } else {%>
 <td align="left" width="50%">
 <table  width="100%" height="30"   align="center" cellpadding="-2" cellspacing="-2">
    <tr>
    <td width="" height="30" valign="top"><span class="style1">�豸ʹ�ó���</span></td>
    <td align="center">
    <div>
    <form ACTION="sbgl/inssbxx.jsp" name=form1 METHOD="POST">
    <select name="cj"   class="Sytle_select" onchange="change1()">
     &nbsp;<option value="">��ѡ���豸��������</option>
     <option <%if (chej.equals("41")) out.print("selected"); %> value="41">֣�ݼ��޳���</option>
     <option <%if (chej.equals("42")) out.print("selected"); %> value="42">��ɽ���޳���</option>
     <option <%if (chej.equals("43")) out.print("selected"); %> value="43">�������޳���</option>
     <option <%if (chej.equals("44")) out.print("selected"); %> value="44">֣�����ᳵ��</option>
     </select>&nbsp;&nbsp;&nbsp;&nbsp;</form>
    </div>
    </td>
    
  </tr>
  </table>

 </td>
 <% } %>

 <td width="50%">
  <div>     
    <table width="100%" height="30"    align="center" cellpadding="-2" cellspacing="-2">
    <tr><td align="left">
    <div>
    <form ACTION="sbgl/inssbxx.jsp" name=formbz METHOD="POST">
    <input type="hidden" name="cj" value="<%=chej%>">
    <select name="bz"   class="Sytle_select" onchange="changebz()">
    <option value=""><font color="#ff0000">��ѡ���豸ʹ�ð���&nbsp;</font></option>
    <%
       if (Con!= null)
       {
           try
           {  
           Rs = Smts.executeQuery(sqlbz);
           Rs.last();
           int i = 0;
           CountR = Rs.getRow();
           Rs.first();
           if (CountR>0)
           {
               while (!Rs.isAfterLast())
               {      
               %>
               <option  <%if (bz.equals(Rs.getString("code"))) out.print("selected"); %> value="<%=Rs.getString("code")%>"><%=Rs.getString("bz")%>&nbsp;</option>
               <% 
				Rs.next();
				i++;
			    } 
			}
			}
        catch (SQLException e)
        {
            out.println("error!");
        }
        finally {  Con.close(); }
        }
	%>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;</form>
    </div>
    </td>
    
  </tr>
  </table>
  </div>
  </td>
 <tr>
</tr>
</table>
<table align="center" width="557"  bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>  <form ACTION="sbgl/inssbxxtj.jsp" METHOD="POST" name="formup">
  <input type="hidden" name="bz" value="<%=bz%>"> <!-- bz�������� -->
    <input type="hidden" name="cj" value="<%=chej%>">     <!-- �������� --> 
          <td>
            <table><tr>
            <td width="10%" height="35" ><span class="style1">�豸����</span></td>
            <td width="20%"><input width="10" name="mc" type="text" class="Sytle_text" id="cx" size="20">&nbsp;*</td>
            <td width="10%" height="35" ><span class="style1">�豸���</span></td>
            <td width="20%"><input width="10" name="code" type="text" class="Sytle_text" id="cx" size="20">&nbsp;*</td>
            </tr>
            <tr>
            <td width="10%" class="style1">�豸�ͺ�</td>
            <td width="30%"><input width="20" name="xh" type="text" class="Sytle_text" id="ch" size="20">&nbsp;</td>
            <td width="10%" class="style1">�豸���</td>
            <td width="20%">
            <select name="fl"   class="Sytle_select">
               <option value="">�豸����</option>
               <option value="A">A���豸</option>
               <option value="B">B���豸</option>
               <option value="C">C���豸</option>
            </select>&nbsp;*
            </td>
            </tr>
            </table>
            </td>
          </tr>
           <tr align="left"> <td>
            <table>
             <tr>
                <td  height="40" align="left" class="style1" >�豸����ʱ�� </td>
                <td class="style1" >
                <input type="text" name="made" class="Sytle_text"   onDBLClick="loadCalendar(this)">&nbsp;*</td>
                <td  class="style1" ></td>
                <td  height="35" ><span class="style1">�豸���쳧��</span></td>
            <td width="20%"><input width="10" name="work" type="text" class="Sytle_text" id="cx" size="20">&nbsp;</td>
            
             </tr>
            </table>
            </td> 
            </form></td>
            </tr>
          <tr>
            <td  height="50" valign="bottom"   align="center">
            <input name="Button" type="button" class="Style_button" value="��&nbsp;&nbsp;��" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="Style_button" value="��&nbsp;&nbsp;�� ">                
                <input name="myclose" type="button" class="Style_button" id="myclose" value="��&nbsp;&nbsp;��" onClick="javascrip:window.close()">
                 </td>
          </tr>
        </table>
      
  </tr>
  <tr>
  <td  height="60">
  <div><font color="#D43939">��ǰ���������豸������Ϣ.</font></div>
  <div><font color="#15600B">ע����<font color="#ff0080">&nbsp;*</font>&nbsp;�ŵ���ĿΪ���������ʡ�ԡ�</font></div>
  </td>
  </tr>
</table>
</td>
</tr>
</table>
<% 
} else {%> <script language="javascript">
              alert("���޴˲���Ȩ�ޣ�");
              window.close();
            </script>
        <% } } else {%> <script language="javascript">
              alert("δ��¼,�����µ�¼��");
              window.close();
            </script>
        <% }%>
  </body>
</html>
