<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��������ѯ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script language="javascript">
function Mycheck()
{
if (formincx.pj.value=="")
{ alert("���ݲ���Ϊ��,���������ڡ���Ż����ƣ�");
  formincx.pj.focus();
  return;
}
  formincx.submit();
} 
</script> 
  <body>
    <!-- ����ѡ�������� -->
    <script language="javascript">
   function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
   }
  </script>
<%      boolean islog=false;
        int CountR=0;
        try
         { islog=((String)session.getAttribute("islog")).equals("1");
         }
        catch(Exception e)
        {
         //out.println(e);
        }
        String pjk="";
        if (request.getParameter("pjk")!=null) pjk=new String(request.getParameter("pjk"));
        
        String tabname="";
        String str="";
        
        if (pjk.equals("1")) { tabname="chukuzz"; str="֣�ݼ��޳��䱸Ʒ��";}
        if (pjk.equals("2")) { tabname="chukuys"; str="��ɽ���޳��䱸Ʒ��";}
        if (pjk.equals("3")) { tabname="chukuly"; str="�������޳��䱸Ʒ��";}
        if (pjk.equals("4")) { tabname="chukuzl"; str="֣�����ᳵ�䱸Ʒ��";}
        if (pjk.equals("5")) { tabname="chukud"; str="�β��Ͽ�";}
        
       
       String bhmc="";
        if (request.getParameter("bhmc")!=null) bhmc=new String(request.getParameter("bhmc"));
        
        String pj="";
        if (request.getParameter("pj")!=null) pj=new String(request.getParameter("pj"));
%>
   <table align="center" width="694" border="0" cellpadding="-2" cellspacing="-2">
  <tr> <td><img width="694" height="68" src="Images/chukucx.gif" >  </td>
  </tr>
  <tr>
      <td height="25"><div>
      <%if (!(((String)session.getAttribute("deptment")).equals("41")
          || ((String)session.getAttribute("deptment")).equals("42")
          || ((String)session.getAttribute("deptment")).equals("43") 
          || ((String)session.getAttribute("deptment")).equals("44"))) 
      { %>
     <form name="formpjk" method="post" action="pjgl/pjgl.jsp">��ѡ��Ʒ������:
     <input type="radio" name="pjk" value="1" <%if (pjk.equals("1")) out.print("checked"); %>> ֣�ݼ��޳���
     <input type="radio" name="pjk" value="2" <%if (pjk.equals("2")) out.print("checked"); %>> ��ɽ���޳���
     <input type="radio" name="pjk" value="3" <%if (pjk.equals("3")) out.print("checked"); %>> �������޳���
     <input type="radio" name="pjk" value="4" <%if (pjk.equals("4")) out.print("checked"); %>> ֣�����ᳵ��
     <input type="radio" name="pjk" value="5" <%if (pjk.equals("5")) out.print("checked"); %>> �β��Ͽ�
     <input type="hidden" name="page" value="1">
     <input type="hidden" name="kc" value="5">
      <input type="submit" name="Submit" class=Style_button2 value="  ȷ  ��  " >
     </form>
     <% } %></div>
      </td>
  </tr>
  <tr>
     <td align="center" height="25">��ѯ����:<%=str %>���������Ϣ</td>
  </tr>
  <tr>
      <td height="25">
     <form name="formincx" method="post" action="pjgl/pjgl.jsp">��ѡ���ѯ����:
     <input type="radio" name="bhmc" value="1" <%if (bhmc.equals("1")) out.print("checked");%>> ��������
     <input type="radio" name="bhmc" value="2" <%if (bhmc.equals("2")) out.print("checked");%>> �������
     <input type="radio" name="bhmc" value="3" <%if (bhmc.equals("3")) out.print("checked");%>>������
     <input type="text" name="pj"  ondblClick="loadCalendar(this)"> 
     <input type="hidden" name="page" value="1">
     <input type="hidden" name="kc" value="5">
     <input type="hidden" name="pjk" value=<%=pjk%>>
     <input type="submit" name="Submit" class=Style_button2   value="  ȷ  ��  " onClick="Mycheck()">
     </form>
     </td>
  </tr>
</table>
 <table align="center" width="694"  border="0" cellpadding="-2" cellspacing="-2">
   <tr border="1" bordercolor="#6894D5" height="25">
       <td ><div align="center" class="word_blue">������</div></td>
       <td ><div align="center" class="word_blue">�������</div></td>
       <td ><div align="center" class="word_blue">���</div></td> 
       <td ><div align="center" class="word_blue">��λ</div></td>
       <td ><div align="center" class="word_blue">�������</div></td>
       <td ><div align="center">����</div></td>
        <td ><div align="center">������</div></td> 
        <td ><div align="center">����Ա</div></td>
   </tr> 
      <%         
       Class.forName("org.gjt.mm.mysql.Driver").newInstance();
       Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/pjgl","root","123");       
       Statement Smts; 
       ResultSet Rs;
       if (Con != null)
        {
             try
             {
              String sql="";
              if (bhmc.equals("1")) { 
               sql ="select "+tabname+".id,"+tabname+".name,pjinfo.gg,pjinfo.dw,pjinfo.dj,"+tabname+".rq,"+tabname+".chukus,"+tabname+".czy from " +tabname+",pjinfo where "+tabname+".rq='"+pj+"' and "+tabname+".id=pjinfo.id"+" order by "+tabname+".rq DESC "; }
                else { if (bhmc.equals("2")) { 
                 sql ="select "+tabname+".id,"+tabname+".name,pjinfo.gg,pjinfo.dw,pjinfo.dj,"+tabname+".rq,"+tabname+".chukus,"+tabname+".czy from " +tabname+",pjinfo where "+tabname+".name like '"+pj+"%' and "+tabname+".id=pjinfo.id"+" order by "+tabname+".rq DESC "; }
                      else { if (bhmc.equals("3")) {
                        sql ="select "+tabname+".id,"+tabname+".name,pjinfo.gg,pjinfo.dw,pjinfo.dj,"+tabname+".rq,"+tabname+".chukus,"+tabname+".czy from " +tabname+",pjinfo where "+tabname+".id='"+pj+"' and "+tabname+".id=pjinfo.id"+" order by "+tabname+".rq DESC "; }
                           }
                     }
                
              Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
 
              Rs = Smts.executeQuery(sql);
              Rs.last();
                 CountR = Rs.getRow();
            		Rs.first();
            			if (CountR>0)
            			{
            		    while (  !Rs.isAfterLast())	{     
            			    %>
            			    <tr border="1" bordercolor="#6894D5" height="25">
                            <td  ><div align="center" class="word_blue"><%=Rs.getString("id")%></div></td>
                            <td ><div align="center" class="word_blue"><%=Rs.getString("name")%></div></td>
                            <td ><div align="center" class="word_blue"><%=Rs.getString("gg")%></div></td> 
                            <td ><div align="center" class="word_blue"><%=Rs.getString("dw")%></div></td> 
                            <td ><div align="center" class="word_blue"><%=Rs.getString("dj")%></div></td>  
                            <td ><div align="center"><%=Rs.getString("rq")%></div></td>
                            <td ><div align="center"><%=Rs.getString("chukus")%></div></td> 
                            <td ><div align="center"><%=Rs.getString("czy")%></div></td>
                            </tr>  
              <%            Rs.next();
				          } 
					    }
		    }
           catch (SQLException e)
            		{
            			out.println("�޷���������¼");
            		}
            		finally
            		{
            			Con.close();
            		}	
            }    
%> 
</table>
  </body>
</html>
