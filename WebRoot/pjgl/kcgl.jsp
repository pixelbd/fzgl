<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>���������...</title>
    
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
  .whitecolor{
  color:"#ffffff";
  }
  .orange{
	font-size: 9pt;	color: #FFC000;
}
  -->
   </style>
  </head>




  <body>

 <!-- ���ʶ��,ȷ���û�Ȩ��  
       ϵͳ����Ա�����Ͽ���Ա�жο�����Ȩ dkcgl=true;
       ϵͳ����Ա�����伶ϵͳ����Ա���������Ա����Ʒ�����Ա�г��䱸Ʒ�����Ȩ  cjkcgl=true;
       ȷ����Ʒ�ֿ����� pjk="1"��֣�ݼ��� "2"����ɽ���� "3"���������� "4"��֣������ "5":�ο�
  -->
 <%
  boolean dkcgl=false;
  boolean cjkcgl=false;
  boolean islog=false;
  String  pjk="";
  String kc="";
  if   (request.getParameter("kc")!=null) kc=new String(request.getParameter("kc"));
  
  try
	  {
	    islog=((String)session.getAttribute("islog")).equals("1"); 
	  }
  catch(Exception e)
	  {	     
	  }
  if (islog)	{  
   if (((String)session.getAttribute("deptment")).equals("41") || ((String)session.getAttribute("deptment")).equals("42") ||
      ((String)session.getAttribute("deptment")).equals("43") || ((String)session.getAttribute("deptment")).equals("44") || 
      ((String)session.getAttribute("deptment")).equals("admin") ) 
      { 
         if (((String)session.getAttribute("zw")).equals("1") || ((String)session.getAttribute("zw")).equals("10") ||   
            ((String)session.getAttribute("zw")).equals("5") || ((String)session.getAttribute("zw")).equals("cjadmin") || 
            ((String)session.getAttribute("deptment")).equals("admin")) 
            {  cjkcgl=true; }
            
          if (((String)session.getAttribute("deptment")).equals("41")) { pjk="1";}
          if (((String)session.getAttribute("deptment")).equals("42")) { pjk="2";}
          if (((String)session.getAttribute("deptment")).equals("43")) { pjk="3";}
          if (((String)session.getAttribute("deptment")).equals("44")) { pjk="4";}
          if (((String)session.getAttribute("deptment")).equals("admin")) { pjk="0";}
       }
   if (((String)session.getAttribute("deptment")).equals("24") || 
      ((String)session.getAttribute("deptment")).equals("admin") ) 
      {  dkcgl=true;  
         if (((String)session.getAttribute("deptment")).equals("24")) { pjk="5";}
      }  
  }
  %>
  
<table width="871"  bgcolor="#ffffff"   class="tableBorder_LR" align="center" cellpadding="0" cellspacing="0">
  <tr>
  
  <td>
  <div>
   <table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="Images/pjtitle1.gif" width="777" height="40"></td>
        </tr>
        <tr>
          <td height="47" valign="top" background="Images/menubg.gif"><div>
          <table width="100%" height="34"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="34" align="center" class="whitecolor">
               <%if (dkcgl || cjkcgl) {%>
               | <a href="pjgl/pjgl.jsp?page=1&kc=1&pjk=<%=pjk%>">������Ǽ�</a> 
               | <a href="pjgl/pjgl.jsp?page=1&kc=2&pjk=<%=pjk%>">�������Ǽ�</a> 
               <% } %>
               <%if (dkcgl ) {%>
               | <a href="pjgl/pjgl.jsp?page=1&kc=3&pjk=<%=pjk%>">�����Ϣ����</a> 
               <% } %>
               | <a href="pjgl/pjgl.jsp?page=1&kc=4&pjk=<%=pjk%>">�������ѯ</a> 
               | <a href="pjgl/pjgl.jsp?page=1&kc=5&pjk=<%=pjk%>">��������ѯ</a> 
               | <a href="pjgl/pjgl.jsp?page=1&kc=6&pjk=<%=pjk%>">�������ѯ</a> 
               |</td>
              </tr>
           </table></td>
        </tr>
      </table></div><div>
<table width="777"  border="0" align="center" cellpadding="0" cellspacing="0" height="272">
  <tr>
    <td width="44" height="249" valign="top"><img src="Images/left.gif" width="44" height="248"></td>
    <td valign="top" width="698">
    <% if (kc.equals("1")) { %> <div> <jsp:include flush="true" page="pjin.jsp"></jsp:include> </div><% } 
       else { if (kc.equals("2")) { %> <div> <jsp:include flush="true" page="pjout.jsp"></jsp:include></div> <%  } 
              else { if (kc.equals("3")) { %> <div> <jsp:include flush="true" page="pjinfo.jsp"></jsp:include></div> <%}
                     else{ if (kc.equals("4")) { %> <div> <jsp:include flush="true" page="pjincx.jsp"></jsp:include></div> <%}
                           else { if (kc.equals("5")) { %> <div> <jsp:include flush="true" page="pjoutcx.jsp"></jsp:include> </div><% } 
                                  else{ if (kc.equals("6")) { %> <div> <jsp:include flush="true" page="kccx.jsp"></jsp:include> </div><% } 
                                      } 
                                 } 
                         }
                   }
            }
    %>
    </td>
    <td valign="top"> <img src="Images/right.gif" width="35" height="248"></td>
        </tr>
      </table></div>


</td></tr>
</table>
  </body>
</html>
