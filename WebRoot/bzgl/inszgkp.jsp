<%@ page language="java"  import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>���ְ��������¼...</title>
    
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
if (formup.rq.value=="")
{ alert("���������ڣ�");formup.rq.focus();return;}
if (formup.zrr.value=="")
{ alert("��ѡ�񱻿����ˣ�");formzg.zrr.focus();return;}
if (formup.flms.value=="")
{ alert("��ѡ���������");form1.fl.focus();return;}
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
   if(rtn!=null) field.value=rtn;
   return;
   }
   function change1()
   { form1.submit();}
   function change2()
   { form2.submit();}
   function changebz()
   { formbz.submit();}
   function changezg()
   { formzg.submit();}
   </script>
<% 
//����:gzid�������֤��,chej�������,code�������,gzcode���ϱ���,fl���Ϸ���,ms����������
  Class.forName("org.gjt.mm.mysql.Driver").newInstance();
  Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123");  
  Statement Smts; 
  ResultSet Rs;
  Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);     
  request.setCharacterEncoding("gb2312"); 
  String gzname="";
  String gzid="";
  String chej="";
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
    if(islog) {
      if ((((String)session.getAttribute("deptment")).equals("41")
           || ((String)session.getAttribute("deptment")).equals("42")
           || ((String)session.getAttribute("deptment")).equals("43")
           || ((String)session.getAttribute("deptment")).equals("44"))
           &&((String)session.getAttribute("zw")).equals("8")) { 
           gzname=(String)session.getAttribute("usertrue");//��������,��¼ʱȷ��
           gzid=(String)session.getAttribute("userid");//������ݺ�,��¼ʱȷ��
           chej=(String)session.getAttribute("deptment");
    //���е���ʱʹ��,�ɹ���Ա��¼����ʱʹ��   if (((String)session.getAttribute("deptment")).equals("admin"))     gzname="";
  
    int CountR = 0;
    
    //����Ϸ���
    String sqlfl="select distinct fl from cjkpbz order by fl";
    //����Ϸ�������
    String fl="";
    if (request.getParameter("fl")!=null)  fl=new String(request.getParameter("fl"));
    String flms="";
    if (request.getParameter("flms")!=null)  flms=new String(request.getParameter("flms"));
    
    String sqlflms="select * from cjkpbz where fl='"+fl+"'";
    //��������Ϣ�а���ְ���Ͱ������
  //  String bz="";
  //   if (request.getParameter("bz")!=null)  bz=new String(request.getParameter("bz"));
    String zrr="";
    if (request.getParameter("zrr")!=null)  zrr=new String(request.getParameter("zrr"));
    String zgtab="";
    if (chej.equals("41")) zgtab="zhigongzz";
    if (chej.equals("42")) zgtab="zhigongys";
    if (chej.equals("43")) zgtab="zhigongly";
    if (chej.equals("44")) zgtab="zhigongzl";
  //    String sqlbz="select bz,code from banzu where cj='"+chej+"' order by bz";
    String bzcode="";
    if (request.getParameter("bzcode")!=null)  bzcode=new String(request.getParameter("bzcode"));
    String sqlzrr="select a.name,a.id,b.bz as bz from "+zgtab+" as a,(select bz from "+zgtab+" where id='"+gzid+"') as b where a.bz=b.bz order by name";
%>

<table align="center" width="557" height="260" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
    <td width="557"   valign="top">
<table align="center" width="557" height="90"  bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2"  >
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0" cellpadding="-2" cellspacing="-2" background="Images/tjbzkpxx.gif">
    <tr><td></td></tr>  
    </table> 
    </td>
   </tr>
  <tr>
    <td width="557" height="30" valign="top"><%if (!gzname.equals("")) { %>������<font color="#ff0080"><%=gzname%></font>������ְ��������¼�༭�� <% } %>
    </td>
  </tr>
</table>
<table align="center" width="557"   border="0" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
  <td>
  <div>     
    <table width="559" height="50"  border="0" align="center" cellpadding="-2" cellspacing="0">
    <tr><td colspan="2" height="25"  class="style1">������Ŀ����:</td></tr>
    <tr><td class="style1">
    <div>
    <form ACTION="bzgl/inszgkp.jsp" name=form1 METHOD="POST">
    <input type="hidden" name="bzcode" value="<%=bzcode%>">
    <input type="hidden" name="zzr" value="<%=zrr%>">
    <select name="fl"   class="Sytle_select" onchange="change1()">
    <option value=""><font color="#ff0000">��ѡ��������&nbsp;</font></option>
    <%
       
       if (Con!= null)
       {
           try
           {
           
           Rs = Smts.executeQuery(sqlfl);
           Rs.last();
           int i = 0;
           CountR = Rs.getRow();
           Rs.first();
           if (CountR>0)
           {
               while (!Rs.isAfterLast())
               {      
               %>
               <option  <%if (fl.equals(Rs.getString("fl"))) out.print("selected"); %> value="<%=Rs.getString("fl")%>"><%=Rs.getString("fl")%>&nbsp;</option>
               <% 
				Rs.next();
				i++;
			    } 
			}
	%>
    </select>&nbsp;*&nbsp;&nbsp;&nbsp;</form>
    </div>
    </td>
    <td class="style1"><div>
    <form ACTION="bzgl/inszgkp.jsp" name=form2 METHOD="POST">
    <input type="hidden" name="fl" value="<%=fl%>">
    <input type="hidden" name="bzcode" value="<%=bzcode%>">
    <input type="hidden" name="zzr" value="<%=zrr%>">
    <select name="flms" class="Sytle_select" onchange="change2()">
    <option value=""><font color="#ff0000">��ѡ������׼����&nbsp;</font></option>
    <%      Rs = Smts.executeQuery(sqlflms);
            Rs.last();
            i = 0;
            CountR = Rs.getRow();
            Rs.first();
            if (CountR>0)
            {
            	while (!Rs.isAfterLast())
            	{      
     %><option <%if (flms.equals(Rs.getString("code"))) out.print("selected"); %> value="<%=Rs.getString("code") %>" >[-<%=Rs.getString("kf1")%>][+<%=Rs.getString("jf1")%>]<%=Rs.getString("bz") %></option>
     <% 
				Rs.next();
				i++;
				} 
			}
		%>  
   </select>&nbsp;*&nbsp;&nbsp;&nbsp;
   </form></div>
  </td>
  </tr>
  </table>
  </div>
  </td>
  </tr>
  <tr>
  <td>
  <div>     
    <table width="559" height="50"  border="0" align="left" cellpadding="-2" cellspacing="-2">
    <tr><td  height="25"  class="style1">
    <form ACTION="bzgl/inszgkp.jsp" name=formzg METHOD="POST">��������:
    
    <input type="hidden" name="fl" value="<%=fl%>">
    <input type="hidden" name="flms" value="<%=flms%>">
    <select name="zrr" class="Sytle_select" onchange="changezg()">
    <option value="">��ѡ��ְ������&nbsp;</option>
    <%      Rs = Smts.executeQuery(sqlzrr);
            Rs.last();
            bzcode=Rs.getString("bz");
            
            i = 0;
            CountR = Rs.getRow();
            Rs.first();
            if (CountR>0)
            {
            	while (!Rs.isAfterLast())
            	{      
     %><option <%if (zrr.equals(Rs.getString("id"))) out.print("selected"); %> value="<%=Rs.getString("id") %>" ><%=Rs.getString("name")%></option>
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
        }%>  
   </select>&nbsp;*&nbsp;&nbsp;&nbsp;
   <input type="hidden" name="bzcode" value="<%=bzcode%>"></form>
  
  </td>
  </tr>
  </table>
  </div>
  </td>
  </tr>
  <form ACTION="bzgl/inszgkpdetl.jsp" METHOD="POST" name="formup">
  <input type="hidden" name="bzcode" value="<%=bzcode%>"> <!-- bzcode������� -->
    <input type="hidden" name="gzid" value="<%=gzid%>">     <!-- �������֤���� -->
    <input type="hidden" name="flms" value="<%=flms%>">     <!-- fl���ϱ��� -->
    <input type="hidden" name="zrr" value="<%=zrr%>">     <!-- ���������֤���� -->
    <input type="hidden" name="cj" value="<%=chej%>">   <!-- ������� -->
          <tr align="left">
            <td align="left">
            <table>
             <tr>
                <td  height="40" align="left" class="style1" >��&nbsp;&nbsp;&nbsp;&nbsp;��:&nbsp;&nbsp;</td>
                <td class="style1" >
                <input type="text" name="rq" class="Sytle_text" id="rq" onDBLClick="loadCalendar(this)">&nbsp;*</td>
                <td  class="style1" >&nbsp;&nbsp;&nbsp;&nbsp;���˽��<input type="text" name="money"  value="0.00" size="6">Ԫ
   </td>
             </tr>
            </table>
            </td>
	  	  </tr>
	  	  <tr>
          <td>
            <table><tr>
          <td height="40"  align="left"><span class="style1">��&nbsp;&nbsp;&nbsp;&nbsp;��:&nbsp;&nbsp;</span></td>
          <td align="left" colspan="6"><input name="ms" type="text" class="Style_text" id="ms" size="60">&nbsp;*</td>
          </tr></table>
          </td>
          </tr>
          <tr>
            <td colspan="7" ><div align="center">
            <input size="40" name="cj" type="hidden" class="Style_text" value="<%=chej%>">
                <input name="Button" type="button" class="Style_button" value="��&nbsp;&nbsp;��" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="Style_button" value="��&nbsp;&nbsp;�� ">                
                <input name="myclose" type="button" class="Style_button" id="myclose" value="��&nbsp;&nbsp;��" onClick="javascrip:window.close()">
                </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="60">
  <div><font color="#D43939">��ǰ�������룺
   <%if (chej.equals("41")) { %>֣�ݼ��޳���<%} 
   else {if (chej.equals("42")) { %>��ɽ���޳���<%} 
   else {if (chej.equals("43")) { %>�������޳���<%} 
   else {if (chej.equals("44")) { %>֣�����ᳵ��<%}} }}%>����ְ��������¼...</font></div>
  <div><font color="#15600B">ע����<font color="#ff0080">&nbsp;*</font>&nbsp;�ŵ���ĿΪ���������ʡ�ԡ�</font></div>
  </td>
  </tr>
</table>
</td>
</tr>
</table>
<% 
} else {%> <script language="javascript">
              alert("�����ǹ���������ִ�д˲�����");
              window.close();
            </script>
        <% } } else {%> <script language="javascript">
              alert("δ��¼,�����µ�¼��");
              window.close();
            </script>
        <% }%>
  </body>
</html>
