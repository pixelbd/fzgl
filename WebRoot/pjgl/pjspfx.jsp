<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>������� </title>
    
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
    	.word_darkblue{
	    font-size:9pt;
	    color:#122072;}
	    .word_white{
	    font-size:9pt;
	    color:#ffffff;}
  .orange{
	font-size: 9pt;	color: #FFC000;
}

    -->  
     </style>
  </head>
<%  
 
	int CountPgysp = 0;
    int CountRpj = 0;
    int CountPgfx = 0;
	int CurrPgdfx = 1;
	int PgSize = 20;
 int CountRfx = 0;
%>
 
  <body>
  <script language="javascript">
	function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
}
</script> 
  <% 
    String chej = "";
    if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
    String spf ="";
    if (request.getParameter("v5")!=null) spf = new String(request.getParameter("v5"));
    String spto ="";
    if (request.getParameter("v6")!= null) spto =new String(request.getParameter("v6"));
    
    String user=(String)session.getAttribute("deptment");
    
    Class.forName("org.gjt.mm.mysql.Driver").newInstance();
    Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/pjgl","root","123"); 
  %>  
  <!-- ���ʶ�� -->
 <%
  boolean islog=false;
	  try
	  {
	   islog=((String)session.getAttribute("islog")).equals("1");
	  }
	  catch(Exception e)
	  {	    
	  }
	   //-  ʶ����������,�粻�ǳ���Ҫѡ�񳵼� --
 %>
     <table   align="center"  cellpadding="-2" cellspacing="-2"  >
     <tr>
         <td height="28" valign="center" align="left" bgcolor="#ffffff">
 <% if (islog) {
 	if (((String)session.getAttribute("deptment")).equals("41")) { chej="zz";  
     %><div><img width="13" height="13" src="Images/listflag.gif">֣�ݼ��޳�������������ݷ���</div>
    <%} else { if(((String)session.getAttribute("deptment")).equals("42")) {
     chej="ys"; 
     %><div><img width="13" height="13" src="Images/listflag.gif">��ɽ���޳�������������ݷ���</div>
    <%} else { if(((String)session.getAttribute("deptment")).equals("43")) {
     chej="ly";  
  %><div><img width="13" height="13" src="Images/listflag.gif">�������޳�������������ݷ���</div>
     <% } else { 
     if (request.getParameter("cj")!=null) { 
         if (request.getParameter("cj").equals("zz")) { chej="zz"; %>  <div><img width="13" height="13" src="Images/listflag.gif">֣�ݼ��޳�������������ݷ���</div> <%}
            else { if (request.getParameter("cj").equals("ys")) { chej="ys"; %><div><img width="13" height="13" src="Images/listflag.gif">��ɽ���޳�������������ݷ���</div><%}
                      else { if (request.getParameter("cj").equals("ly")) { chej="ly";%><div><img width="13" height="13" src="Images/listflag.gif">�������޳�������������ݷ���</div> <%} 
                           }
                 }
              } %>
     <form name="formchejian" method="post" action="pjgl/pjgl.jsp">��ѡ����޳���:
     <input type="radio" name="cj" value="zz" checked> ֣�ݼ��޳���
     <input type="radio" name="cj" value="ys" > ��ɽ���޳���
     <input type="radio" name="cj" value="ly" > �������޳���
     <input type="hidden" name="page" value="2">
     <input type="hidden" name="sp" value="3">
     <input type="submit" name="Submit" class=Style_button2 value="  ѡ  ��  " >
     </form> <% } }}} %>
     <!-- end of ʶ���������� -->
     </td>
     </tr>
     </table>
     <table bgcolor="#E6F0F9" border="0" width="100%" align="center" cellspacing="-1" cellpadding="1">
     <tr height="29">
    <td  colspan="2" align="left" background="Images/bg.jpg" class=word_yellow>&nbsp;&nbsp;&nbsp;����������ݷ��� 
    </td>
    </tr>
    <tr bgcolor="#E6F0F9">
     <td  colspan="2" align="center" >
     <form action="pjgl/pjgl.jsp" name="yspcx" >��ѯʱ���:��
       <input name="v5" type="text" ondblClick="loadCalendar(this)" value=<%=spf%>>&nbsp;��
        <input name="v6" type="text" ondblClick="loadCalendar(this)" value=<%=spto%>>
        <input type="hidden" name="page" value="2">
        <input type="hidden" name="sp" value="3">
        <input type="hidden" name="cj" value=<%=chej%>>
        <input type="submit" name="Submit" class=Style_button value="  ��  ѯ  " >
     </form>
    </td>
    </tr>
    <tr align="center" height="29" bgcolor="#E6F0F9">
    <td  align="left" width="5%"><div><img src="Images/list.gif"></div></td>
    <td  align="left">
        <div><font color="#ff8040">&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;�� 
        <% if (spf!= null && spf!=null && !spto.equals("") && !spto.equals(""))
	   { %>��ǰ�Ա�����Ϊ����<%=spf%>��<%=spto%>����������
	   <%} else { %>��ǰ��ʾ����Ϊȫ������������<%} %></font></div>
    </td>
    </tr>
    <tr>
        <td colspan="2">
          <div>
          <table width="100%"  cellpadding="-2" cellspacing="1"  align="center">
          
          <%   
             Statement Smtsfx; 
             ResultSet Rsfx;
              if (Con != null)
            	{
            		try
            		{
            		String  sqlfx="";
            		
            		if (spf!= null && !spf.equals("") && spto!= null && !spto.equals(""))    
						{   
						   sqlfx ="Select a.zzcdh,a.pjmc,a.xinghao,sum(a.shuliang)as dsp,sum(b.shuliang) as ysp  From sppj"+chej+" as a,ysppj"+chej+" as b  where a.pjmc=b.pjmc and a.xinghao=b.xinghao and a.zzcdh=b.zzcdh and rq>='"+spf+"'"+ "and rq<='"+spto+"'"+" group by a.zzcdh,a.pjmc,a.xinghao,b.zzcdh,b.pjmc,b.xinghao  order by a.zzcdh,a.pjmc,a.xinghao";
						}
						else {
						   sqlfx ="Select a.zzcdh as dspzzcdh,a.pjmc as dsppjmc,a.xinghao as dspxh,sum(a.shuliang)as dsp,b.zzcdh as yspzzcdh,b.pjmc as ysppjmc,b.xinghao as yspxh,sum(b.shuliang) as ysp  From sppj"+chej+" as a,ysppj"+chej+" as b  where a.pjmc=b.pjmc and a.xinghao=b.xinghao and a.zzcdh=b.zzcdh   group by a.zzcdh,a.pjmc,a.xinghao,b.zzcdh,b.pjmc,b.xinghao  order by a.zzcdh,a.pjmc,a.xinghao";
						}
						%><%=sqlfx%><%
						Smtsfx = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsfx = Smtsfx.executeQuery(sqlfx);
                        Rsfx.last();
                        Rsfx.first();
                        CountRfx=Rsfx.getRow();
            			if (CountRfx>0)
            			{
           %>
            				<tr align="center" height="29">
                            <td   class=word_white bgcolor="#307F9C">�������</td>
                            <td   class=word_white bgcolor="#307F9C">����ͺ�</td>
                            <td   class=word_white bgcolor="#307F9C">���쳧����</td>
                            <td   class=word_white bgcolor="#307F9C">��������</td>
                             <td   class=word_white bgcolor="#307F9C">&nbsp;</td>
                              <td   class=word_white bgcolor="#307F9C">&nbsp;</td>
                               <td   class=word_white bgcolor="#307F9C">&nbsp;</td>
                            <td   class=word_white bgcolor="#307F9C">�ѷ�������</td>
                            <td   class=word_white bgcolor="#307F9C">&nbsp;</td>
                            </tr>
                        <% 
           				while ( !Rsfx.isAfterLast())
           				{     
            			%>
            			    <tr height="25"  bgcolor="#ffffff" align="center">
                            <td width="10%"  align="center" ><%=Rsfx.getString("dsppjmc")%></td> 
                            <td width="10%"  align="center"><%=Rsfx.getString("dspxh")%></td>
                            <td width="10%"  align="center"><%=Rsfx.getString("dspzzcdh")%></td> 
                            <td width="10%"  align="center"><%=Rsfx.getString("dsp")%></td>
                            <td width="10%"  align="center" ><%=Rsfx.getString("ysppjmc")%></td> 
                            <td width="10%"  align="center"><%=Rsfx.getString("yspxh")%></td>
                            <td width="10%"  align="center"><%=Rsfx.getString("yspzzcdh")%></td> 
                            
                            <td width="10%"  align="center"><%=Rsfx.getString("ysp")%></td> 
                            <td width="10%"  align="center"></div></td>
                            
                            </tr> 
                        <%
					            Rsfx.next();
                         }
					    }
					}
           catch (SQLException e)
            		{
            			out.println("�޷���������¼��");
            		}
            		finally
            		{
             		}	
               }
             %>
             </table>
            
                            </div>
             </td>
             </tr>
    
    </table>
  </body>
</html>
