<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
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

    -->  
     </style>
  </head>
<%  
    int CountPgdsp = 0;
	int CurrPgdsp = 1;
	int PgSize = 20;
	int CountRdsp = 0;
    int CountRdata = 0;
    int CountRdata2 = 0;
    int CountRdata3 = 0;
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
    //��ȡ��ǰ���ڵ��·�
   java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
   java.util.Date today=new java.util.Date();
   int nowyear = today.getYear()+1900;
   int nowmonth = today.getMonth()+1; 
  
    String chej = "";
    if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
    String dspf ="";
    if (request.getParameter("v1")!=null) dspf = new String(request.getParameter("v1"));
    String dspto ="";
    if (request.getParameter("v2")!= null) dspto =new String(request.getParameter("v2"));
  
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
     <table align="center"  cellpadding="-2" cellspacing="-2" >
     <tr >
         <td height="28" valign="center" align="left" bgcolor="#ffffff">
 <% if (islog) {
 	if (((String)session.getAttribute("deptment")).equals("41")) { chej="zz";  
     %><div><img width="13" height="13" src="Images/listflag.gif">֣�ݼ��޳�������������</div>
    <%} else { if(((String)session.getAttribute("deptment")).equals("42")) {
     chej="ys"; 
     %><div><img width="13" height="13" src="Images/listflag.gif">��ɽ���޳�������������</div>
    <%} else { if(((String)session.getAttribute("deptment")).equals("43")) {
     chej="ly";  
  %><div><img width="13" height="13" src="Images/listflag.gif">�������޳�������������</div>
     <% } else { if(((String)session.getAttribute("deptment")).equals("44")) {
     chej="zl";  
  %><div><img width="13" height="13" src="Images/listflag.gif">֣�����ᳵ������������</div>
    <% } else {  
     if (request.getParameter("cj")!=null) { 
         if (request.getParameter("cj").equals("zz")) { chej="zz"; %>  <div><img width="13" height="13" src="Images/listflag.gif">֣�ݼ��޳�������������</div> <%}
            else { if (request.getParameter("cj").equals("ys")) { chej="ys"; %><div><img width="13" height="13" src="Images/listflag.gif">��ɽ���޳�������������</div><%}
                      else { if (request.getParameter("cj").equals("ly")) { chej="ly";%><div><img width="13" height="13" src="Images/listflag.gif">�������޳�������������</div> <%} 
                             else if (request.getParameter("cj").equals("zl")) { chej="zl";%><div><img width="13" height="13" src="Images/listflag.gif">֣�����ᳵ������������</div> <%} 
                           }
                 }
              } %>
     <form name="formcj" method="post" action="pjgl/pjgl.jsp">��ѡ����޳���:
     <input type="radio" name="cj" value="zz" checked> ֣�ݼ��޳���
     <input type="radio" name="cj" value="ys" > ��ɽ���޳���
     <input type="radio" name="cj" value="ly" > �������޳���
     <input type="radio" name="cj" value="zl" > ֣�����ᳵ��
     <input type="hidden" name="page" value="2">
     <input type="hidden" name="sp" value="1">
     <input type="submit" name="Submit" class=Style_button2 value="  ѡ  ��  " >
     </form> <% } }}}%>
     <!-- end of ʶ���������� -->
     </td>
     </tr>
     </table>
     <table   width="100%" align="center" cellpadding="-2" cellspacing="-2" bgcolor="#ffffff">
     <tr><td>
    <table width="100%" height="60"  align="center" cellpadding="-1" cellspacing="-1" bgcolor="#E6F0F9">
    <tr height="29">
    <td  class=word_yellow colspan="11" align="left"   background="Images/bg.jpg">&nbsp;&nbsp;&nbsp;���������
    </td>
    </tr>
    <tr height="29">
    <td colspan="3" align="center">
            <div >
              <% 
        if  (((String)session.getAttribute("deptment")).equals("41") 
           || ((String)session.getAttribute("deptment")).equals("42")
           || ((String)session.getAttribute("deptment")).equals("43")
           || ((String)session.getAttribute("deptment")).equals("44")
           || ((String)session.getAttribute("deptment")).equals("admin"))
           {
           //5������Ϲ���Ա8����6����רְ1�����쵼���Խ��б༭
           if (((String)session.getAttribute("zw")).equals("6")
              ||((String)session.getAttribute("zw")).equals("5")
              ||((String)session.getAttribute("zw")).equals("8")
              ||((String)session.getAttribute("zw")).equals("1")
              ||((String)session.getAttribute("zw")).equals("cjadmin")
              ||((String)session.getAttribute("deptment")).equals("admin")) { %>
           [<a href="pjgl/editsppj.jsp?user=<%=user%>" target=" ">&nbsp;�༭���������¼&nbsp;</a>]
           <%} } else if (((String)session.getAttribute("deptment")).equals("admin")) {%> 
           [<a href="pjgl/editsppj.jsp?user=<%=user%>" target=" ">&nbsp;�༭���������¼&nbsp;</a>]
           <%}%>
            </div>
    </td>
    <td colspan="8" align="center" >
         <form name="dspcx" action="pjgl/pjgl.jsp">��ѯʱ���:��
        <input name="v1" type="text" ondblClick="loadCalendar(this)" value=<%=dspf%>>&nbsp��
        <input name="v2" type="text" ondblClick="loadCalendar(this)" value=<%=dspto%>>
        <input type="hidden" name="cj" value=<%=chej %>>
        <input type="hidden" name="page" value="2">
        <input type="hidden" name="sp" value="1">
        <input type="submit" name="Submit"  class=Style_button value="  ��  ѯ  ">
        </form>
    </td>
    </tr>
    <tr>
       <td colspan="11" align="center"><font color="#13566F">
        <% if (dspf!= null && dspf!=null && !dspto.equals("") && !dspto.equals(""))
	   { %>��ǰ��ʾ����Ϊ����<%=dspf%>��<%=dspto%>������������
	   <%} else { %>��ǰ��ʾ����Ϊ��<%=nowyear%>��<%=nowmonth%>�´�����������<%} %>
       </font></td>
    </tr>
	<tr>
    <td  align="right"><div><img src="Images/list.gif"></div></td>
    <td  colspan="11" align="left">
        <div><font color="#ff8040">��&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;ϸ</font></div>
    </td>
    </tr>
    <tr>
    <td colspan="11">
    <div>
    
  <%   String StrPgdsp = request.getParameter("gopage");
            	if ((StrPgdsp == null)||(StrPgdsp.equals("")))
            	{
            		CurrPgdsp = 1;
            	}
            	else
            	{
            		CurrPgdsp = Integer.parseInt(StrPgdsp);
            	}
      Statement Smtsdsp; 
      ResultSet Rsdsp;
      if (Con != null)
            	{
            		try
            		{
            		String  sqldsp="";
            		 if (dspf!= null && !dspf.equals("") && dspto!= null && !dspto.equals(""))    
						{   
						   sqldsp ="Select * From sppj"+chej+"  where  rq>='"+dspf+"'"+ "&& rq<='"+dspto+"'   order by rq desc";
						}
						else {
						   sqldsp ="Select * From sppj"+chej+"  where year(rq)='"+nowyear+"' and month(rq)='"+nowmonth+"'  order by rq desc";
						}
            		  
                        Smtsdsp = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsdsp = Smtsdsp.executeQuery(sqldsp);
                        Rsdsp.last();
                        int i = 0;
            			CountRdsp = Rsdsp.getRow();
            			CountPgdsp = (CountRdsp/PgSize);
            			if (CountRdsp%PgSize>0)   CountPgdsp++;
            			Rsdsp.first();
            			if (CountRdsp>0)
            			{
            				Rsdsp.absolute(CurrPgdsp*PgSize-PgSize+1);
            				%>
            				<!-- ���������ϸ -->
                            <table class="tableBorder_B1"   cellpadding="-1" cellspacing="1"   >
            				<tr align="center" height="29" >
                            <td width="180"  class=word_white bgcolor="#13566F">����</td>
                            <td width="100" class=word_white bgcolor="#13566F">�������</td>
                            <td width="100" class=word_white bgcolor="#13566F">������</td>
                            <td width="200" class=word_white bgcolor="#13566F">����ͺ�</td>
                            <td width="200" class=word_white colspan="2" bgcolor="#13566F">ԭװ���ͳ���</td>
                            <td width="160" class=word_white bgcolor="#13566F">���쳧����</td>
                            <td width="120" class=word_white bgcolor="#13566F">����ʱ��</td>
                            <td width="50" class=word_white bgcolor="#13566F">��&nbsp;��</td>
                            <td width="15%" class=word_white bgcolor="#13566F">��������</td>
                            <td width="100" class=word_white bgcolor="#13566F">�������</td>
                            </tr>
                            <% 
           					while (i<PgSize && !Rsdsp.isAfterLast())	{     
            			    %>
            			    <tr height="25" >
                            <td width="180" align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("rq")%></td>
                            <td width="200" align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("pjmc")%></td> 
                            <% if (Rsdsp.getString("pjbh")!=null && Rsdsp.getString("pjbh")!="") { %>
                            <td  align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("pjbh")%></td> 
                            <%} else { %> <td align="center" class="word_darkblue">��</td> <%} %>
                            <td width="200" align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("xinghao")%></td>
                            <td width="30" align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("chexing")%></td> 
                            <td width="100"  align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("chehao")%></td>
                            <td width="160"  align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("zzcdh")%></td>
                            <td width="120" align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("zzsj")%></td>
                            <td width="50" align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("shuliang")%></td>
                            <td width="15%"  align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("guzhang")%></td>
                            <td width="200" align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("chuli")%></td> 
                            </tr> 
                        <%
					            Rsdsp.next();
					            i++;
                            }
                        %>
                         </table>
                         <!-- ��ʾҳ��� -->
           <table  bgcolor="#E6F0F9" align="center"  width="95%"> 
          <tr><form name="formpg" method="post" action="pjgl/pjgl.jsp">
          <td nowrap class="word_blue" align="left">[<%=CurrPgdsp%>/<%=CountPgdsp %>] ÿҳ20�� ��<%=CountRdsp%>����¼&nbsp;&nbsp;&nbsp;&nbsp; ת����
            <input name="gopage" type="text" size="3" >&nbsp;ҳ&nbsp;&nbsp;
           <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="2">
            <input name="sp" type="hidden" value="1">
            <input name="cj" type="hidden" value="<%=chej%>">
            <input name="v1" type="hidden" value="<%=dspf%>">
            <input name="v2" type="hidden" value="<%=dspto%>">
           </td></form>
          <td>
          <a href="pjgl/pjgl.jsp?page=2&sp=1&gopage=1&v1=<%=dspf%>&v2=<%=dspto%>&cj=<%=chej%>">��һҳ</a> 
           <%if (CurrPgdsp>1){%>
            <a href="pjgl/pjgl.jsp?page=2&sp=1&gopage=<%=CurrPgdsp-1%>&v1=<%=dspf%>&v2=<%=dspto%>&cj=<%=chej%>">��һҳ</a> 
            <%
          	}
          %>
            <%if (CurrPgdsp<CountPgdsp){%>
            <a href="pjgl/pjgl.jsp?page=2&sp=1&gopage=<%=CurrPgdsp+1%>&v1=<%=dspf%>&v2=<%=dspto%>&cj=<%=chej%>">��һҳ</a> 
            <%
          	}
          %>
            <a href="pjgl/pjgl.jsp?page=2&sp=1&gopage=<%=CountPgdsp%>&v1=<%=dspf%>&v2=<%=dspto%>&cj=<%=chej%>">���һҳ</a>
            </td>
        </tr>
        </table>
                        <%
					    }
					  }
		     
           catch (SQLException e)
            		{
            			out.println(" ");
            		}
            		finally
            		{
            			
            		}	
            }    
             %>
    
     </div>
     </td>
     </tr>
    
    <tr align="center" height="29">
        <td  align="right"><div><img src="Images/count.gif"></div></td>
        <td  colspan="10" align="left"><div>
        <font color="#ff8040">��&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;ͳ&nbsp;��</font></div>
        </td>
    </tr>
    <tr>
        <td colspan="11">
        <!-- ���ͳ�Ʒ��� ���������ͳ��-->
        <table width="90%" border="0" cellpadding="-2" cellspacing="-2"  align="center">
                <tr>
          <td colspan="11" >
          
          <div><table width="100%">
          <%   
             Statement Smtsdata2; 
             ResultSet Rsdata2;
              if (Con != null)
            	{
            		try
            		{
            		String  sqldata2="";
            		
            		if (dspf!= null && !dspf.equals("") && dspto!= null && !dspto.equals(""))    
						{   
						   sqldata2 ="Select bw,sum(shuliang)as total2  From sppj"+chej+" where rq>='"+dspf+"'"+ "&& rq<='"+dspto+"'"+"  group by bw order by pjmc";
						}
						else {
						   sqldata2 ="Select bw,sum(shuliang)as total2  From sppj"+chej+" where year(rq)='"+nowyear+"' and month(rq)='"+nowmonth+"'   group by bw order by pjmc";
						}
						
						Smtsdata2 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsdata2 = Smtsdata2.executeQuery(sqldata2);
                        Rsdata2.last();
                        Rsdata2.first();
                        CountRdata2=Rsdata2.getRow();
            			if (CountRdata2>0)
            			{
           %>               <tr align="center" height="29">
                            <td  colspan="4" class=word_white bgcolor="#307F9C"><div> �����������λͳ��</div></td>
                            </tr>  
            				<tr align="center" height="29">
                            <td  colspan="2" class=word_white bgcolor="#307F9C">���������λ</td>
                            <td  colspan="2" class=word_white bgcolor="#307F9C">��&nbsp;��</td>
                            </tr>
                        <% 
           				while ( !Rsdata2.isAfterLast())
           				{     
            			%>
            			    <tr height="25" align="center">
                            <td width="50%" colspan="2" align="center" bgcolor="#fffffF" ><%=Rsdata2.getString("bw")%></td> 
                            <td width="50%" colspan="2"  align="center" bgcolor="#fffffF" ><%=Rsdata2.getString("total2")%></td>
                            </tr> 
                        <%
					            Rsdata2.next();
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
             %></table>
             </div>
             </td>
         </tr>
                <tr>
                <td colspan="11" >
               
               <div><table width="100%">
               <%   
                Statement Smtsdata; 
                ResultSet Rsdata;
                if (Con != null)
            	{
            		try
            		{
            		String  sqldata="";
            		if (dspf!= null && !dspf.equals("") && dspto!= null && !dspto.equals(""))    
						{   
						   sqldata ="Select pjmc,xinghao,zzcdh,sum(shuliang)as total  From sppj"+chej+" where rq>='"+dspf+"'"+ "&& rq<='"+dspto+"'"+"  group by pjmc,xinghao,zzcdh order by pjmc";
						}
						else {
						   sqldata ="Select pjmc,xinghao,zzcdh,sum(shuliang)as total  From sppj"+chej+" where year(rq)='"+nowyear+"' and month(rq)='"+nowmonth+"'   group by pjmc,xinghao,zzcdh order by pjmc";
						}
						
                        Smtsdata = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsdata = Smtsdata.executeQuery(sqldata);
                        Rsdata.last();
                        Rsdata.first();
                        CountRdata=Rsdata.getRow();
            			if (CountRdata>0)
            			{
            			%>  <tr align="center" height="29">
                            <td  colspan="4" class=word_white bgcolor="#307F9C"><div> ���������ͳ��</div></td>
                            </tr>
            				<tr align="center" height="29">
                            <td   class=word_white bgcolor="#307F9C">�������</td>
                            <td   class=word_white bgcolor="#307F9C">����ͺ�</td>
                            <td   class=word_white bgcolor="#307F9C">���쳧����</td>
                            <td   class=word_white bgcolor="#307F9C">��&nbsp;��</td>
                            </tr>
                        <% 
           				while ( !Rsdata.isAfterLast())	{     
            			%>
            			    <tr height="25" align="center">
                            <td width="30%" align="center" bgcolor="#fffffF" ><%=Rsdata.getString("pjmc")%></td> 
                            <td width="20%" align="center" bgcolor="#fffffF" ><%=Rsdata.getString("xinghao")%></td>
                            <td width="30%" align="center" bgcolor="#fffffF" ><%=Rsdata.getString("zzcdh")%></td>
                            <td width="20%" align="center" bgcolor="#fffffF" ><%=Rsdata.getString("total")%></td>
                            </tr> 
                        <%
					            Rsdata.next();
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
            </table></div>
            </td>  
     </tr>      
     
         <tr>
             <td colspan="11" width="100%">
            
             <div><table width="100%" border="0" cellpadding="-2" cellspacing="1">
             <%   
                Statement Smtsdata3; 
                ResultSet Rsdata3;
                if (Con != null)
            	{
            		try
            		{
            		String  sqldata3="";
                         
                        
                      if (dspf!= null && !dspf.equals("") && dspto!= null && !dspto.equals(""))    
						{  
						   sqldata3 ="Select zzcdh,pjmc,xinghao,sum(shuliang)as total3  From sppj"+chej+" where rq>='"+dspf+"'"+ "&& rq<='"+dspto+"'   group by zzcdh,pjmc,xinghao order by zzcdh,pjmc,xinghao"; 
						   }
						else {
						   sqldata3 ="Select zzcdh,pjmc,xinghao,sum(shuliang)as total3 From sppj"+chej+" where year(rq)='"+nowyear+"' and month(rq)='"+nowmonth+"' group by zzcdh,pjmc,xinghao order by zzcdh,pjmc,xinghao";
						
						}
						
                        Smtsdata3 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsdata3 = Smtsdata3.executeQuery(sqldata3);
                        Rsdata3.last();
                        Rsdata3.first();
                        CountRdata3=Rsdata3.getRow();
            			if (CountRdata3>0)
            			{
                       %>   <tr align="center" height="29">
                            <td  colspan="4" class=word_white bgcolor="#307F9C"> <div > ����������ͳ��</div></td>
                            </tr>
            				<tr align="center" height="29">
                            <td   class=word_white bgcolor="#307F9C">���쳧����</td>
                            <td    class=word_white bgcolor="#307F9C">�������</td>
                            <td    class=word_white bgcolor="#307F9C">����ͺ�</td>
                            <td    class=word_white bgcolor="#307F9C">��&nbsp;��</td>
                            </tr>
                        <% 
           				while ( !Rsdata3.isAfterLast())	
           				{     
            			%>
            			    <tr border="0" height="25" align="center" >
                            <td width="25%" bgcolor="#fffffF" ><%=Rsdata3.getString("zzcdh")%></td> 
                            <td width="25%" bgcolor="#fffffF" ><%=Rsdata3.getString("pjmc")%></td> 
                            <td width="25%" bgcolor="#fffffF" ><%=Rsdata3.getString("xinghao")%></td> 
                            <td width="25%" bgcolor="#fffffF"><%=Rsdata3.getString("total3")%></td>
                            </tr> 
                        <%
					            Rsdata3.next();
                          }
					    }
				   }
		        catch (SQLException e)
            		{  out.println("�޷���������¼��"); }
            	finally
            		{      }	
               } 
                         %>  
               <tr height="25"><td colspan="4"></td></tr>
              </table></div>
              </td>  
        </tr>  
        </table>
        	
    </td>
    </tr>
   </table>
    </td>
    </tr>
    </table>

    
  </body>
</html>
