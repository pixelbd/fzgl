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
  .orange{
	font-size: 9pt;	color: #FFC000;
}

    -->  
     </style>
  </head>
<%  
 
	int CountPgysp = 0;
	int CurrPgysp = 1;
	int PgSize = 20;
    int CountRysp = 0;
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

    String yspf ="";
    if (request.getParameter("v3")!=null) yspf = new String(request.getParameter("v3"));
    String yspto ="";
    if (request.getParameter("v4")!= null) yspto =new String(request.getParameter("v4"));
    
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
     %><div><img width="13" height="13" src="Images/listflag.gif">֣�ݼ��޳���������������</div>
    <%} else { if(((String)session.getAttribute("deptment")).equals("42")) {
     chej="ys"; 
     %><div><img width="13" height="13" src="Images/listflag.gif">��ɽ���޳���������������</div>
    <%} else { if(((String)session.getAttribute("deptment")).equals("43")) {
     chej="ly";  
  %><div><img width="13" height="13" src="Images/listflag.gif">�������޳���������������</div>
     <% } else { 
     if (request.getParameter("cj")!=null) { 
         if (request.getParameter("cj").equals("zz")) { chej="zz"; %>  <div><img width="13" height="13" src="Images/listflag.gif">֣�ݼ��޳���������������</div> <%}
            else { if (request.getParameter("cj").equals("ys")) { chej="ys"; %><div><img width="13" height="13" src="Images/listflag.gif">��ɽ���޳���������������</div><%}
                      else { if (request.getParameter("cj").equals("ly")) { chej="ly";%><div><img width="13" height="13" src="Images/listflag.gif">�������޳���������������</div> <%} 
                           }
                 }
              } %>
     <form name="formcj" method="post" action="pjgl/pjgl.jsp">��ѡ����޳���:
     <input type="radio" name="cj" value="zz" checked> ֣�ݼ��޳���
     <input type="radio" name="cj" value="ys" > ��ɽ���޳���
     <input type="radio" name="cj" value="ly" > �������޳���
     <input type="hidden" name="page" value="2">
     <input type="hidden" name="sp" value="2">
     <input type="submit" name="Submit" class=Style_button2 value="  ѡ  ��  " >
     </form> <% } }}}%>
     <!-- end of ʶ���������� -->
     </td>
     </tr>
     </table>
     <table border="0" width="100%" align="center" cellspacing="0" cellpadding="1" >
     <tr >
    <td height="29" colspan="2"  align="left" background="Images/bg.jpg" class=word_yellow>&nbsp;&nbsp;&nbsp;���������
    </td>
    </tr>
    <tr bgcolor="#E6F0F9">
    <td align="center">
            <div>
              <% 
        if  (((String)session.getAttribute("deptment")).equals("41") 
           || ((String)session.getAttribute("deptment")).equals("42")
           || ((String)session.getAttribute("deptment")).equals("43")
           || ((String)session.getAttribute("deptment")).equals("admin"))
           {
           if (((String)session.getAttribute("zw")).equals("6")
           ||((String)session.getAttribute("zw")).equals("1")
           ||((String)session.getAttribute("zw")).equals("8")
           ||((String)session.getAttribute("zw")).equals("cjadmin")
           || ((String)session.getAttribute("deptment")).equals("admin")) { %>
           [<a href="pjgl/editysppj.jsp?user=<%=user%>">&nbsp;�༭�����������¼&nbsp;</a>]
           <%}}%>
            </div>
    </td>
    <td  align="center" >
    <form action="pjgl/pjgl.jsp" name="yspcx" >��ѯʱ���:��
       <input name="v3" type="text" ondblClick="loadCalendar(this)" value=<%=yspf%>>&nbsp��
        <input name="v4" type="text" ondblClick="loadCalendar(this)" value=<%=yspto%>>
        <input type="hidden" name="page" value="2">
        <input type="hidden" name="sp" value="2">
        <input type="hidden" name="cj" value=<%=chej%>>
        <input type="submit" name="Submit" class=Style_button value="  ��  ѯ  " >
    </form>
    </td>
     </tr>
     <tr>
       <td colspan="2"  align="center" bgcolor="#E6F0F9"><font color="#13566F">
        <% if (yspf!= null && yspf!=null && !yspto.equals("") && !yspto.equals(""))
	   { %>��ǰ��ʾ����Ϊ����<%=yspf%>��<%=yspto%>������������
	   <%} else { %>��ǰ��ʾ����Ϊ��<%=nowyear%>��<%=nowmonth%>��������������<%} %>
       </font></td>
    </tr>
    <tr align="center" height="29" bgcolor="#E6F0F9">
     <td  align="right"><div><img src="Images/list.gif"></div></td>
    <td   align="left">
        <div><font color="#ff8040">��&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;ϸ</font></div>
    </td>
    </tr>
    <tr>
        <td colspan="2" >
          <div>
            <%   String StrPgysp = request.getParameter("Page");
            	if ((StrPgysp == null)||(StrPgysp.equals("")))
            	{
            		CurrPgysp = 1;
            	}
            	else
            	{
            		CurrPgysp = Integer.parseInt(StrPgysp);
            	}
                Statement Smtsysp; 
                ResultSet Rsysp;
                if (Con != null)
            	{
            		try
            		{
            		String  sqlysp="";
            		if (yspf!= null && !yspf.equals("") && yspto!= null && !yspto.equals(""))    
						{   
						   sqlysp ="Select * From ysppj"+chej+"  where  rq>='"+yspf+"'"+ "&& rq<='"+yspto+"'   order by rq desc";
						}
						else {
						   sqlysp ="Select * From ysppj"+chej+"  where year(rq)='"+nowyear+"' and month(rq)='"+nowmonth+"'  order by rq desc";
						}
            		  
                        Smtsysp = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsysp = Smtsysp.executeQuery(sqlysp);
                        Rsysp.last();
                        int j = 0;
            			CountRysp = Rsysp.getRow();
            			CountPgysp = (CountRysp/PgSize);
            			if (CountRysp%PgSize>0)
            				CountPgysp++;
            			Rsysp.first();
            			if (CountRysp>0)
            			{
            				Rsysp.absolute(CurrPgysp*PgSize-PgSize+1);
            				%>
            				<table border="0" cellpadding="-2" cellspacing="1" bgcolor="#E6F0F9" >
            				<tr align="center" height="29">
                            <td   align="center" class=word_white bgcolor="#13566F">��������</td>
                            <td  align="center" class=word_white bgcolor="#13566F">�������</td>
                            <td  align="center" class=word_white bgcolor="#13566F">����ͺ�</td>
                            <td  align="center" class=word_white bgcolor="#13566F">���쳧����</td>
                            <td  align="center" class=word_white bgcolor="#13566F">����ʱ��</td>
                            <td  align="center" class=word_white bgcolor="#13566F">��������</td>
                            <td align="center" class=word_white bgcolor="#13566F">��&nbsp;ע</td>
                            </tr> 
                            <% 
           					while (j<PgSize && !Rsysp.isAfterLast())	{     
            			    %>
            			    <tr height="25" align="center">
                            <td width="180" align="center" bgcolor="#fffffF" ><%=Rsysp.getString("rq")%></td>
                            <td width="200" align="center" bgcolor="#fffffF" ><%=Rsysp.getString("pjmc")%></td> 
                            <td width="200" align="center" bgcolor="#fffffF" ><%=Rsysp.getString("xinghao")%></td>
                            <td width="160" align="center" bgcolor="#fffffF" ><%=Rsysp.getString("zzcdh")%></td>
                            <td width="160" align="center" bgcolor="#fffffF" ><%=Rsysp.getString("zzsj")%></td>
                            <td width="120" align="center" bgcolor="#fffffF" ><%=Rsysp.getString("shuliang")%></td>
                            <td width="15%" align="center" bgcolor="#fffffF"  ><%=Rsysp.getString("beizhu")%></td>
                            </tr> 
                        <%
					            Rsysp.next();
					            j++;
					    }
					   %></table>
					   <!-- ҳ��� -->
          <table   bgcolor="#E6F0F9" " align="center"  width="100%"> 
          <tr><form name="formpg" method="post" action="pjgl/pjgl.jsp">
          <td nowrap class="word_blue" align="left">[<%=CurrPgysp%>/<%=CountPgysp %>] ÿҳ20�� ��<%=CountRysp%>����¼&nbsp;&nbsp;&nbsp;&nbsp; ת����
            <input name="Page" type="text" size="3" >&nbsp;ҳ&nbsp;&nbsp;
           <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="2">
            <input name="sp" type="hidden" value="2">
            <input name="cj" type="hidden" value="<%=chej%>">
            <input name="v3" type="hidden" value="<%=yspf%>">
            <input name="v4" type="hidden" value="<%=yspto%>">
          </td></form>
          <td>
          <a href="pjgl/pjgl.jsp?page=2&sp=2&Page=1&v3=<%=yspf%>&v4=<%=yspto%>&cj=<%=chej%>">��ҳ</a> 
           <%if (CurrPgysp>1){%>
            <a href="pjgl/pjgl.jsp?page=2&sp=2&Page=<%=CurrPgysp-1%>&v3=<%=yspf%>&v4=<%=yspto%>&cj=<%=chej%>">��һҳ</a> 
            <%
          	}
          %>
            <%if (CurrPgysp<CountPgysp){%>
            <a href="pjgl/pjgl.jsp?page=2&sp=2&Page=<%=CurrPgysp+1%>&v3=<%=yspf%>&v4=<%=yspto%>&cj=<%=chej%>">��һҳ</a> 
            <%
          	}
          %>
            <a href="pjgl/pjgl.jsp?page=2&sp=2&Page=<%=CountPgysp%>&v3=<%=yspf%>&v4=<%=yspto%>&cj=<%=chej%>">���һҳ</a>
            </td>
        </tr>
        </table>
					   <%
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
                            
                            </div>
        </td>
    </tr>
    
    <tr align="center" height="29" bgcolor="#E6F0F9" >
        <td  align="right"><div><img src="Images/count.gif"></div></td>
        <td  colspan="10" align="left"><div>
        <font color="#ff8040">��&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;ͳ&nbsp;��</font></div>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center" bgcolor="#E6F0F9" >
        <!-- ���ͳ�Ʒ��� ���������ͳ��-->
        <table width="90%" border="0"  >
         <tr>
          <td >
          
          <div>
          <table width="100%" cellpadding="-2" cellspacing="1"  align="center" bgcolor="#E6F0F9">
          <%   
             Statement Smtsdata2; 
             ResultSet Rsdata2;
              if (Con != null)
            	{
            		try
            		{
            		String  sqldata2="";
            		
            		if (yspf!= null && !yspf.equals("") && yspto!= null && !yspto.equals(""))    
						{   
						   sqldata2 ="Select bw,sum(shuliang) as total2  From ysppj"+chej+" where rq>='"+yspf+"'"+ "&& rq<='"+yspto+"'"+"  group by bw ";
						}
						else {
						   sqldata2 ="Select bw,sum(shuliang) as total2  From ysppj"+chej+" where year(rq)='"+nowyear+"' and month(rq)='"+nowmonth+"'   group by bw ";
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
                            <td  colspan="2" class=word_white bgcolor="#307F9C">��������</td>
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
                <td  >
               
               <div><table width="100%" cellpadding="-2" cellspacing="1"  align="center" bgcolor="#E6F0F9">
               <%   
                Statement Smtsdata; 
                ResultSet Rsdata;
                if (Con != null)
            	{
            		try
            		{
            		String  sqldata="";
            		if (yspf!= null && !yspf.equals("") && yspto!= null && !yspto.equals(""))    
						{   
						   sqldata ="Select pjmc,xinghao,zzcdh,sum(shuliang)as total  From ysppj"+chej+" where rq>='"+yspf+"'"+ "&& rq<='"+yspto+"'"+"  group by pjmc,xinghao,zzcdh order by pjmc";
						}
						else {
						   sqldata ="Select pjmc,xinghao,zzcdh,sum(shuliang)as total  From ysppj"+chej+" where year(rq)='"+nowyear+"' and month(rq)='"+nowmonth+"'   group by pjmc,xinghao,zzcdh order by pjmc";
						}
						
                        Smtsdata = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsdata = Smtsdata.executeQuery(sqldata);
                        Rsdata.last();
                        Rsdata.first();
                        CountRdata=Rsdata.getRow();
            			if (CountRdata>0)
            			{
            			%> 
            			    <tr align="center" height="29">
                            <td  colspan="4" class=word_white bgcolor="#307F9C"><div> ���������ͳ��</div></td>
                            </tr>
            				<tr align="center" height="29">
                            <td   class=word_white bgcolor="#307F9C">�������</td>
                            <td   class=word_white bgcolor="#307F9C">����ͺ�</td>
                            <td   class=word_white bgcolor="#307F9C">���쳧����</td>
                            <td   class=word_white bgcolor="#307F9C">��������</td>
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
             <td width="100%">
             
             <div><table width="100%" border="0" cellpadding="-2" cellspacing="1">
             <%   
                Statement Smtsdata3; 
                ResultSet Rsdata3;
                if (Con != null)
            	{
            		try
            		{
            		String  sqldata3="";
                         
                        
                      if (yspf!= null && !yspf.equals("") && yspto!= null && !yspto.equals(""))    
						{  
						   sqldata3 ="Select zzcdh,pjmc,xinghao,sum(shuliang)as total3  From ysppj"+chej+" where rq>='"+yspf+"'"+ "&& rq<='"+yspto+"'   group by zzcdh,pjmc,xinghao order by zzcdh,pjmc,xinghao"; 
						   }
						else {
						   sqldata3 ="Select zzcdh,pjmc,xinghao,sum(shuliang)as total3 From ysppj"+chej+" where year(rq)='"+nowyear+"' and month(rq)='"+nowmonth+"' group by zzcdh,pjmc,xinghao order by zzcdh,pjmc,xinghao";
						
						}
						
                        Smtsdata3 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsdata3 = Smtsdata3.executeQuery(sqldata3);
                        Rsdata3.last();
                        Rsdata3.first();
                        CountRdata3=Rsdata3.getRow();
            			if (CountRdata3>0)
            			{
                       %>
                            <tr align="center" height="29">
                            <td  colspan="4" class=word_white bgcolor="#307F9C"><div > ����������ͳ��</div></td>
                            </tr>
            				<tr align="center" height="29">
                            <td   class=word_white bgcolor="#307F9C">���쳧����</td>
                            <td    class=word_white bgcolor="#307F9C">�������</td>
                            <td    class=word_white bgcolor="#307F9C">����ͺ�</td>
                            <td    class=word_white bgcolor="#307F9C">��������</td>
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
               <tr height="25"><td ></td></tr>
              </table></div>
              </td>  
        </tr>  
        </table>
        	
    </td>
    </tr>
   </table>

  </body>
</html>
