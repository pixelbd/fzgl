<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�������</title>
    
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

  .word1{
	font-size: 9pt;	color: #6A4A2F;
}
  -->
   </style>
  </head>
<script language="javascript">
function Mycheck()
{
if (form2.rq.value=="")
{ alert("���������ڣ�");form2.rq.focus();return;}
if (form2.czy.value=="")
{ alert("���������Ա������");form2.czy.focus();return;}
if (form2.cks.value=="")
{ alert("�����������������");form2.cks.focus();return;}
if (form2.pjname.value=="")
{ alert("������������ƣ�");form2.pjname.focus();return;}
if (form2.pjbh.value=="")
{ alert("�����������ţ�");form2.pjbh.focus();return;}
 form2.submit();
 }
function getpjinfo()
{ 
 form1.submit();
} 
</script>  
  <body>
  <script language="javascript">
  function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
   }
  </script>
  <%   boolean islog=false;
  
        try
         { islog=((String)session.getAttribute("islog")).equals("1");
         }
        catch(Exception e)
        {
         //out.println(e);
        }
     String czy=(String)session.getAttribute("usertrue");
     java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
     java.util.Date today=new java.util.Date();
     String rq = formatter.format(today);
     
     String pjk="";
     if (request.getParameter("pjk")!=null) pjk=new String(request.getParameter("pjk"));
     
     String tabname="";
     String str="";
     
     if (pjk.equals("1")) { tabname="chukuzz"; str="֣�ݼ��޳��䱸Ʒ��";}
     if (pjk.equals("2")) { tabname="chukuys"; str="��ɽ���޳��䱸Ʒ��";}
     if (pjk.equals("3")) { tabname="chukuly"; str="�������޳��䱸Ʒ��";}
     if (pjk.equals("4")) { tabname="chukuzl"; str="֣�����ᳵ�䱸Ʒ��";}
     if (pjk.equals("5")) { tabname="chukud"; str="�β��Ͽ�";}
     
     String pjname="";
     String pjgg="";
     
     if (request.getParameter("pjbh")!=null) 
     {
       Class.forName("org.gjt.mm.mysql.Driver").newInstance();
       Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/pjgl","root","123");       
       Statement Smts; 
       ResultSet Rs;
       if (Con != null)
        {
             try
             {
              String  sql ="select * from pjinfo where id='"+(request.getParameter("pjbh"))+"'";
              Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
     
              Rs = Smts.executeQuery(sql);
              
              Rs.first();
              if (!Rs.isAfterLast())
              {
              pjname=Rs.getString("pjname");
              pjgg=Rs.getString("gg");
              }
             
             }
             catch (SQLException e)
            		{
            		}
            		finally
            		{
            			Con.close();
            		}	
       }    
     }
   %>
  <table align="left" width="694" class="tableBorder_Btm" border="0" cellpadding="-2" cellspacing="-2">
  <tr>
      <td><img width="694" height="68" src="Images/chuku.gif" >
      </td>
  </tr>
  <tr>
      <td height="25">
      <% if (((String)session.getAttribute("deptment")).equals("admin")){%>
     <form name="formpjk" method="post" action="pjgl/pjgl.jsp">��ѡ��Ʒ������:
     <input type="radio" name="pjk" value="1" <%if (pjk.equals("1")) out.print("checked"); %>> ֣�ݼ��޳���
     <input type="radio" name="pjk" value="2" <%if (pjk.equals("2")) out.print("checked"); %>> ��ɽ���޳���
     <input type="radio" name="pjk" value="3" <%if (pjk.equals("3")) out.print("checked"); %>> �������޳���
     <input type="radio" name="pjk" value="4" <%if (pjk.equals("4")) out.print("checked"); %>> ֣�����ᳵ��
     <input type="radio" name="pjk" value="5" <%if (pjk.equals("5")) out.print("checked"); %>> �β��Ͽ�
     <input type="hidden" name="page" value="1">
      <input type="hidden" name="kc" value="2">
     <input type="submit" name="Submit" class=Style_button value="  ȷ  ��  " >
     </form>
     <% } %>
      </td>
  </tr>
  <tr>
     <td align="center" height="20" class="word1">
     <%=str %>����������. 
     </td>
  </tr>
  <tr>
     <td>                     
         <div>
     <table align="center" >
     <tr height="30"><td colspan="3" width="100%" align="center">
     <form name="form1" method="post" action="pjgl/pjgl.jsp">
     <input type="hidden" name="page" value="1">
     <input type="hidden" name="pjk" value=<%=pjk %>>
     <input type="hidden" name="kc" value="2">������:
     <input type="text" name="pjbh" onblur="getpjinfo()" <%if(request.getParameter("pjbh")!=null) { %> value=<%=request.getParameter("pjbh")%><%} %>>
     </form></td></tr>
     <%
     String pjbh="";
     if(request.getParameter("pjbh")!=null) {  pjbh=request.getParameter("pjbh");  } %>
     <form name="form2" method="post" action="pjgl/pjinouttj.jsp">
      <tr height="40">
     <input type="hidden" name="page" value="1">
     <input type="hidden" name="kc" value="2">
     <input type="hidden" name="pjk" value=<%=pjk %>>
     <input type="hidden" name="tabname" value=<%=tabname%> >
     <input type="hidden" name="pjbh" value=<%=pjbh%>>
         <td align="left">&nbsp;�������:<input type="text" name="pjname" value=<%=pjname%>></td>
         <td colspan="2">&nbsp;������:<input type="text" name="pjgg" value=<%=pjgg%>></td>
     </tr>
     <tr height="40">
     <td align="left">&nbsp;����:<input type="text" name="rq" onDBLClick="loadCalendar(this)" value=<%=rq%> size="10"></td>
     <td>&nbsp;���������:<input type="text" name="cks" size="4"></td>
     <td>&nbsp;����Ա:<input type="text" name="czy" value=<%=czy%> size="8"></td>
     </tr>
     <tr height="40">
            <td width="100%" colspan="4" ><div align="center">
                <input name="Button" type="button" class="Style_button2" value="��&nbsp;&nbsp;��" onClick="Mycheck()">&nbsp;&nbsp;&nbsp;&nbsp;
                <input name="Submit2" type="reset" class="Style_button2" value="��&nbsp;&nbsp;�� "> 
            </div></td>
     </tr>
      </form>
     
     </table>
         </div>
     </td>
  </tr>
  </table>
    
  </body>
</html>
