<%@ page language="java" import="java.util.*,java.sql.*,java.sql.Date" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  
    int CountPg = 0;
	int CurrPg = 1;
	int PgSize = 30;
	int CountR = 0;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�ռƻ��༭</title>
    
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
      .word_yellow {
	 	font-size: 9pt;
	  	color: #EFD20F;  }
	  .title{
	  	font-size: 14px;
		color: #000000;
		font-family:����;}
     INPUT.Style_button {
	  BORDER-RIGHT: #4E759C 1px solid; BORDER-TOP: #4E759C 1px solid; FONT-SIZE: 9pt; 
	  BACKGROUND: #EFEFEF; BORDER-LEFT: #4E759C 1px solid; COLOR: #4E759C; BORDER-BOTTOM: #4E759C 1px solid;HEIGHT: 20px;width: 60px
       }
    -->  
     </style>
	
	
    <script src="js/onclock.JS"></script>
  </head>
 <LINK href="Css/css1.css" type=text/css rel=stylesheet>    
  <body onLoad="clockon(bgclock)" background="Images/bg2.gif">
  
 <%
    //��ȡ��ǰ���ڵ��·�
   java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
   java.util.Date today=new java.util.Date();
   int nowyear = today.getYear()+1900;
   int nowmonth = today.getMonth()+1;
   
  boolean islog=false;
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
 
  boolean canmodify=false;
  String chej = "zz";//��ʼ��Ϊ֣�ݼ��޳���
    
  if(islog) 
   { 
     //���ȹ��ܣ�������ȣ�ϵͳ����Ա�ɲ���
    // �ε��ȿɲ���(Ԥ��) if((((String)session.getAttribute("deptment")).equals("23")||((String)session.getAttribute("deptment")).equals("admin")) )
    if(
       ((String)session.getAttribute("deptment")).equals("admin")||
       (
       (
        ((String)session.getAttribute("deptment")).equals("41")||
        ((String)session.getAttribute("deptment")).equals("42")||
        ((String)session.getAttribute("deptment")).equals("43")||
        ((String)session.getAttribute("deptment")).equals("44")
       )&&
       (
        ((String)session.getAttribute("zw")).equals("7")||((String)session.getAttribute("zw")).equals("cjadmin")
       )
       ))
        { canmodify=true;
          if (((String)session.getAttribute("deptment")).equals("41")) chej="zz";
          if (((String)session.getAttribute("deptment")).equals("42")) chej="ys";
          if (((String)session.getAttribute("deptment")).equals("43")) chej="ly";
        }
  }
    %><%=canmodify%><%
    if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
    String vdate ="";
    if (request.getParameter("v1")!=null) vdate = new String(request.getParameter("v1"));
    String vapm ="";
    if (request.getParameter("v2")!= null) vapm =new String(request.getParameter("v2"));
    String dtname=" ";
    if (!chej.equals("")) { dtname="jxjh"+chej; } else { }
  %>
<%=dtname %>
  <table  width="100%"  align="center" cellpadding="-2" cellspacing="1"  bgcolor="#ffffff">
  <tr>
  <td align="center" height="25">
  <%
  if (((String)session.getAttribute("deptment")).equals("admin")) { %>
  <form name="form" method="post" action="jhgl/scrw.jsp?page=4&subpg=3">ѡ����޳��䣺
  <input name="cj" type="radio" value="zz" <% if (chej.equals("zz")) out.print("checked"); %>> ֣�ݼ��޳���
  <input type="radio" name="cj" value="ys" <% if (chej.equals("ys")) out.print("checked"); %>> ��ɽ���޳���
  <input type="radio" name="cj" value="ly" <% if (chej.equals("ly")) out.print("checked"); %>> �������޳���
  <input type="submit" name="Submit" class="Style_button" value="  ȷ   ��  " >
  </form>
  <% } %>
  </td>
  </tr>
  <tr>
  <td align="center" height="25">
  <form name="form2" method="post" action="jhgl/editrjh.jsp">
           <input width="10" name="cj" type="hidden" size="16" value="<%=chej%>">������Ҫ��ѯ�����ڣ�
           <input width="20" name="v1" type="text" size="16" value="<%=vdate%>">&nbsp������:&nbsp
           <select name="v2" value="<%=vapm%>">
           <option value="1">����</option>
		   <option value="2">����</option>
		   <option value="3">ȫ��</option>
	  	   </select> 
           <input type="submit" name="Submit" class="Style_button" value="  ��  ѯ  " >
  </form>
   </td>
  </tr>
  </table>

<table    align="center" width="100%" border="0" cellpadding="-2" cellspacing="1">
<tr>
<td  colspan="23" align="left" width="100%"  height="17" >
<div>&nbsp;<img   width="20" height="18" src="Images/add.gif" >��&nbsp;&nbsp;<a href="jhgl/scrw.jsp?page=4&subpg=3&cj=<%=chej%>" onClick="Javascript:window.open('insertrjh.jsp?cj=<%=chej%>','','width=557,height=634')">����ռƻ�</a>&nbsp;��&nbsp;</div></td>
</tr>
<tr  align="center"  height="25">
<td colspan="24" bgcolor="#6595D6" style="color:#ffffff;font-size:12;font-family:����"><div align="center" >
<% if (chej.equals("zz")) { %>[֣�ݼ��޳���] ���������ռƻ�<%} else{} %>
<% if (chej.equals("ys")) { %>[��ɽ���޳���] ���������ռƻ�<%} else{}%>
<% if (chej.equals("ly")) { %>[�������޳���] ���������ռƻ�<%} else{}%>
</div></td>
</tr>
<tr  align="center" style="color:#ffffff">
<td colspan="2" bgcolor="#6595D6"></td>
<td colspan="2" bgcolor="#6595D6"><div align="center" >����̨λ</div></td>
<td colspan="4" bgcolor="#6595D6"><div align="center" >����������Ϣ</div></td>
<td colspan="2" bgcolor="#6595D6"><div align="center" >ǰ�γ�����Ϣ</div></td>
<td colspan="2" bgcolor="#6595D6"><div align="center" >ǰ�ζ�����Ϣ</div></td>
<td colspan="5" bgcolor="#6595D6"><div align="center" >�����Ϣ</div></td>
<td colspan="4" bgcolor="#6595D6"><div align="center" >������Ϣ</div></td>
<td  bgcolor="#6595D6"></td>
<td colspan="2" bgcolor="#6595D6"><font color="#ffff00">����</font></td>
</tr>
<tr  align="center" height="25">
<td class=tablebody2>����</td><td class=tablebody2>��/����</td>
<td class=tablebody2>��-λ</td><td class=tablebody2> ��</td>
<td class=tablebody2>����</td><td class=tablebody2>����</td><td class=tablebody2>����</td><td class=tablebody2>�޳�</td>
<td class=tablebody2>��λ</td><td class=tablebody2>����</td><td class=tablebody2>��λ</td><td class=tablebody2>����</td>
<td class=tablebody2>����</td><td class=tablebody2>ת���</td><td class=tablebody2>�ƶ���</td><td class=tablebody2>�ƶ���</td><td class=tablebody2>����</td>
<td class=tablebody2>����</td><td class=tablebody2>������֤��</td>
<td class=tablebody2>HMIS�ϴ�����</td><td class=tablebody2>����</td>
<td class=tablebody2>��ע</td>
<td class=tablebody2><font color="#0000ff">�޸�</td>
<td class=tablebody2><font color="#ff0000">ɾ��</font></td>
</tr>

<% 
   Class.forName("org.gjt.mm.mysql.Driver").newInstance();
   Connection Conrjh = DriverManager.getConnection("jdbc:mysql://localhost/jhgl","root","123"); 

   String StrPg = request.getParameter("pgcode");
            	if (StrPg == null)
            	{
            		CurrPg = 1;
            	}
            	else
            	{
            		CurrPg = Integer.parseInt(StrPg);
            	}
   Statement Smts; 
   ResultSet Rsrjh;
   if (Conrjh != null)
            	{
            		try
            		{
            		String  sql2="";
            		    
                        
                        if (vdate!= null && !vdate.equals(""))
						{   
						    if (vapm.equals("1")||vapm.equals("2"))  {sql2 = "select * from "+dtname+" where rq='"+vdate+"'" +" && apm='"+vapm+"'"+" order by rq desc";}
						    else { sql2 = "Select * From "+dtname+" Where rq='"+vdate+"'";}
						}
						else {
							sql2 = "Select * From "+dtname+" where  year(rq)='"+nowyear+"' and month(rq)='"+nowmonth+"' order by rq desc";
						}
						
            			Smts = Conrjh.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsrjh = Smts.executeQuery(sql2);
            			
                        Rsrjh.last();
                        int j = 0;
            			CountR = Rsrjh.getRow();
            			CountPg = (CountR/PgSize);
            			if (CountR%PgSize>0)
            				CountPg++;
            			Rsrjh.first();
            			if (CountR>0)
            			{
            				Rsrjh.absolute(CurrPg*PgSize-PgSize+1);
	            			while (j<PgSize && !Rsrjh.isAfterLast())
            			       			{     
            			%>
            	<tr <% if (j%2==0)  out.print("bgcolor='#F1D0AE'"); else out.print("bgcolor='#F9E7D4'"); %> height="25">
            	<td><div align="center" ><%=Rsrjh.getString("rq")%></div></td>
                <% if (Rsrjh.getString("apm").equals("1")) { %>
                <td><div align="center">����</div></td> <%} else { %>
                <% if (Rsrjh.getString("apm").equals("2")) { %>
                <td><div align="center" >����</div></td> <%} else { %> <td><div align="center" >&nbsp;</div></td> <% } } %>
                <td><div align="center" ><%=Rsrjh.getString("dao")%>-<%=Rsrjh.getString("wei")%></div></td>
                <td><div align="center" ><%=Rsrjh.getString("hao")%></div></td>
                <% if (Rsrjh.getString("cx")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("cx")%></div></td> <%} else { %>
                <td><div align="center" >&nbsp;</div></td> <%} %>
                <% if (Rsrjh.getString("ch")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("ch")%></div></td> <%} else { %>
                <td><div align="center" >&nbsp;</div></td> <%} %>
                <% if (Rsrjh.getString("xz")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("xz")%></div></td> <%} else { %>
                <td><div align="center" >&nbsp;</div></td> <%} %>
                <% if (Rsrjh.getString("xc")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("xc")%></div></td> <%} else { %>
                <td><div align="center">&nbsp;</div></td> <%} %>
                <% if (Rsrjh.getString("qccxdw")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("qccxdw")%></div></td> <%} else { %>
                <td><div align="center">&nbsp;</div></td> <%} %>
                <% if (Rsrjh.getString("qccxrq")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("qccxrq")%></div></td> <%} else { %>
                <td><div align="center">&nbsp;</div></td> <%} %>
                <% if (Rsrjh.getString("qcdxdw")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("qcdxdw")%></div></td> <%} else { %>
                <td><div align="center">&nbsp;</div></td> <%} %>
                <% if (Rsrjh.getString("qcdxrq")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("qcdxrq")%></div></td> <%} else { %>
                <td><div align="center">&nbsp;</div></td> <%} %>
                <% if (Rsrjh.getString("lz")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("lz")%></div></td> <%} else { %>
                <td><div align="center">&nbsp;</div></td> <%} %>
                <% if (Rsrjh.getString("zxj")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("zxj")%></div></td> <%} else { %>
                <td><div align="center">&nbsp;</div></td> <%} %>
                <% if (Rsrjh.getString("zdl")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("zdl")%></div></td> <%} else { %>
                <td><div align="center">&nbsp;</div></td> <%} %>
                <% if (Rsrjh.getString("zdf")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("zdf")%></div></td> <%} else { %>
                <td><div align="center">&nbsp;</div></td> <%} %>
                <% if (Rsrjh.getString("cg")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("cg")%></div></td> <%} else { %>
                <td><div align="center">&nbsp;</div></td> <%} %>
                <% if (Rsrjh.getString("qz")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("qz")%></div></td> <%} else { %>
                <td><div align="center">&nbsp;</div></td> <%} %>
                <% if (Rsrjh.getString("bzq")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("bzq")%></div></td> <%} else { %>
                <td><div align="center">&nbsp;</div></td> <%} %>
                <% if (Rsrjh.getString("hmisrq")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("hmisrq")%></div></td> <%} else { %>
                <td><div align="center">&nbsp;</div></td> <%} %>
                <% if (Rsrjh.getString("bl")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("bl")%></div></td> <%} else { %>
                <td><div align="center"></div></td> <%} %>
                <% if (Rsrjh.getString("bz")!=null ) { %>
                <td><div align="center" ><%=Rsrjh.getString("bz")%></div></td> <%} else { %>
                <td><div align="center"></div></td> <%} %>
                <td><div align="center"><a href="jhgl/updaterjh.jsp?ID1=<%=Rsrjh.getString("ch")%>&ID2=<%=Rsrjh.getString("rq")%>">
                <img src="Images/edit.gif" width="12" height="12" border="0" ></a></div></td>
                <td><div align="center">
                <a href="jhgl/scrw.jsp?page=4&subpg=3" onClick="Javascript:window.open('delrjh.jsp?ID1=<%=Rsrjh.getString("id")%>&ID2=<%=chej%>','','width=519,height=155')">
                <img src="Images/del.gif" width="16" height="16" border="0" ></a></div></td>
              </tr> 
              <%
					            Rsrjh.next();
					            j++;
					    }
					    }
		    }
           catch (SQLException e)
            		{
            			out.println("����");
            		}
            		finally
            		{
            			Conrjh.close();
            		}	
            }    
%>

</table>
<!-- ��ʾҳ��� -->
		  <table    width="100%" bgcolor="#ffffff" align="center"  cellpadding="-2" cellspacing="-2" > 
          <tr >
          
           <td class="word_blue" width="60%"  height="35"  align="left"><form name="formpg" method="post" action="jhgl/editrjh.jsp">
           [<%=CurrPg%>/<%=CountPg %>] ÿҳ30�� ����<%=CountR%>����¼&nbsp;&nbsp;&nbsp;&nbsp; ת����
            <input name="pgcode" type="text" size="3" >&nbsp;ҳ&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="cj" type="hidden" value=<%=chej%>>
            <input name="v1" type="hidden" value=<%=vdate%>>
            <input name="v2" type="hidden" value=<%=vapm%>>
           </form>
           </td>
          <td width="40%"  height="35" align="center">
          <a href="jhgl/scrw.jsp?scrw.jsp?page=4&subpg=3&cj=<%=chej%>&v1=<%=vdate%>&v2=<%=vapm%>&pgcode=1 " >��ҳ</a>
          
           <%if (CurrPg>1){%>
            <a href="jhgl/scrw.jsp?page=4&subpg=3&cj=<%=chej%>&v1=<%=vdate%>&v2=<%=vapm%>&pgcode=<%=CurrPg-1%> " >��һҳ</a> 
            <%
          	}
          %>
            <%if (CurrPg<CountPg){%>
            <a href="jhgl/scrw.jsp?page=4&subpg=3&cj=<%=chej%>&v1=<%=vdate%>&v2=<%=vapm%>&pgcode=<%=CurrPg+1%>">��һҳ</a> 
            <%
          	}
          %>
            <a href="jhgl/scrw.jsp?page=4&subpg=3&cj=<%=chej%>&v1=<%=vdate%>&v2=<%=vapm%>&pgcode=<%=CountPg%> " >���һҳ</a>
            </td>
        </tr>
        </table>


  </body>
</html>
