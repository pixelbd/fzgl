<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��������</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->   <style type="text/css">  
   <!--

   .STYLE1 {
	color: #0075C0
   }
  
    <!--
    .STYLE {
	color: #003366
     }
     -->
   </style>
  </head>
  <body>
  <%  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
      java.util.Date today=new java.util.Date();
      String now = formatter.format(today);
      int Countweather = 0;
      int i=0;
      String  sql="";
      String weatherstr="";
      String picname="";
      boolean islog=false;
  
      try
      { islog=((String)session.getAttribute("islog")).equals("1");
       }
      catch(Exception e)
       {
       //out.println(e);
       }
      
      Class.forName("org.gjt.mm.mysql.Driver").newInstance();
      Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/fzgl","root","123");
 %>      
      <table width="100%"  height="133" border="0" cellpadding="-2" cellspacing="-2">
      <tr>
      <td height="48" colspan="8" align="left" bordercolor="#ECE9D8" background="Images/weather.jpg">&nbsp;
      <font size="3" face="����" color="#004080">��&nbsp;��&nbsp;��&nbsp;��</font><font color="#808080">&nbsp;&nbsp;</font> 
       <% 
          if ((islog) && (((String)session.getAttribute("deptment")).equals("admin")))
          { %>[ <a href="" class="STYLE" onclick="Javascript:window.open('weatherreport.jsp','','width=620,height=440')">&nbsp;Ԥ������&nbsp;</a> ]
       <% } else { } %>
      </td>
      </tr>
      <tr  height="25">
           <td  align="center" colspan="2" width="123" class=tablebody2 ><font color="#008080" size="2">֣&nbsp;��&nbsp;Zheng Zhou</font></td>
           <td  align="center" colspan="2" width="123" class=tablebody2 ><font color="#008080" size="2">��&nbsp;��&nbsp;Luo Yang</font></td>
           <td  align="center" colspan="2" width="123" class=tablebody2 ><font color="#008080" size="2">��&nbsp;ɽ&nbsp;Yue Shan</font> </td>
           <td  align="center" colspan="2" width="123" class=tablebody2 ><font color="#008080" size="2">��&nbsp;��&nbsp;Xin Xiang</font> </td>
      </tr>
      <tr height="60">
      <% 
         Statement Smtsweather;
         ResultSet Rsweather;
        
         if (Con != null)
            	{
            	try
            		{
                    Smtsweather = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                    for (i=1;i<=4;i++)
                    { if (i==1) { sql="Select * From weatherzz where rq='"+now+"'"; }
                      if (i==2) { sql="Select * From weatherly where rq='"+now+"'"; }
                      if (i==3) { sql="Select * From weatherys where rq='"+now+"'"; }
                      if (i==4) { sql="Select * From weatherxx where rq='"+now+"'"; }
            		Rsweather = Smtsweather.executeQuery(sql);
                    Rsweather.last();
            		Countweather = Rsweather.getRow();
            		Rsweather.first();
            			if (Countweather>0)
            			{
	            		while ( !Rsweather.isAfterLast())
            			{     
            			 if ((Rsweather.getString("weather1")!=null)&& (!Rsweather.getString("weather1").equals("")))
            			  {  
            			     if (Rsweather.getString("weather1").equals("1")) { weatherstr="��"; picname="Images/weather/1.gif";}
            			     if (Rsweather.getString("weather1").equals("2")) { weatherstr="����"; picname="Images/weather/2.gif";}
            			     if (Rsweather.getString("weather1").equals("3")) { weatherstr="��"; picname="Images/weather/3.gif";}
            			     if (Rsweather.getString("weather1").equals("4")) { weatherstr="С��"; picname="Images/weather/4.gif";}
            			     if (Rsweather.getString("weather1").equals("5")) { weatherstr="����"; picname="Images/weather/5.gif";}
            			     if (Rsweather.getString("weather1").equals("6")) { weatherstr="����"; picname="Images/weather/6.gif";}
            			     if (Rsweather.getString("weather1").equals("7")) { weatherstr="����"; picname="Images/weather/7.gif";}
            			     if (Rsweather.getString("weather1").equals("8")) { weatherstr="����"; picname="Images/weather/8.gif";}
            			     if (Rsweather.getString("weather1").equals("9")) { weatherstr="��"; picname="Images/weather/9.gif";}
            			     if (Rsweather.getString("weather1").equals("10")) { weatherstr="��"; picname="Images/weather/10.gif";}
            			     if (Rsweather.getString("weather1").equals("11")) { weatherstr="Сѩ"; picname="Images/weather/11.gif";}
            			     if (Rsweather.getString("weather1").equals("12")) { weatherstr="��ѩ"; picname="Images/weather/12.gif";}
            			     if (Rsweather.getString("weather1").equals("13")) { weatherstr="��ѩ"; picname="Images/weather/13.gif";}
            			     if (Rsweather.getString("weather1").equals("14")) { weatherstr="��ɳ"; picname="Images/weather/14.gif";}
            			     if (Rsweather.getString("weather1").equals("15")) { weatherstr="����"; picname="Images/weather/15.gif";}
            			     if (Rsweather.getString("weather1").equals("16")) { weatherstr="��"; picname="Images/weather/16.gif";} 
            			     if (Rsweather.getString("weather1").equals("17")) { weatherstr="���ѩ"; picname="Images/weather/17.gif";}
            			     if ((Rsweather.getString("weather2")!=null)&& (!Rsweather.getString("weather2").equals("")))
            			     {
            			     if (Rsweather.getString("weather2").equals("1")) { weatherstr=weatherstr+"ת��"; picname="Images/weather/1.gif";}
            			     if (Rsweather.getString("weather2").equals("2")) { weatherstr=weatherstr+"ת����"; picname="Images/weather/2.gif";}
            			     if (Rsweather.getString("weather2").equals("3")) { weatherstr=weatherstr+"ת��"; picname="Images/weather/3.gif";}
            			     if (Rsweather.getString("weather2").equals("4")) { weatherstr=weatherstr+"תС��"; picname="Images/weather/4.gif";}
            			     if (Rsweather.getString("weather2").equals("5")) { weatherstr=weatherstr+"ת����"; picname="Images/weather/5.gif";}
            			     if (Rsweather.getString("weather2").equals("6")) { weatherstr=weatherstr+"ת����"; picname="Images/weather/6.gif";}
            			     if (Rsweather.getString("weather2").equals("7")) { weatherstr=weatherstr+"ת����"; picname="Images/weather/7.gif";}
            			     if (Rsweather.getString("weather2").equals("8")) { weatherstr=weatherstr+"ת����"; picname="Images/weather/8.gif";}
            			     if (Rsweather.getString("weather2").equals("9")) { weatherstr=weatherstr+"ת��"; picname="Images/weather/9.gif";}
            			     if (Rsweather.getString("weather2").equals("10")) { weatherstr=weatherstr+"�з�"; picname="Images/weather/10.gif";}
            			     if (Rsweather.getString("weather2").equals("11")) { weatherstr=weatherstr+"תСѩ"; picname="Images/weather/11.gif";}
            			     if (Rsweather.getString("weather2").equals("12")) { weatherstr=weatherstr+"ת��ѩ"; picname="Images/weather/12.gif";}
            			     if (Rsweather.getString("weather2").equals("13")) { weatherstr=weatherstr+"ת��ѩ"; picname="Images/weather/13.gif";}
            			     if (Rsweather.getString("weather2").equals("17")) { weatherstr=weatherstr+"ת���ѩ"; picname="Images/weather/17.gif";}
            			     } 
             			  %>
             			 <td align="center" width="40"><div><img src=<%=picname%> width="40" height="35" border="0"></div></td>
             			 <td  align="center" width="83">
            			 <div align="center" ><%=weatherstr%></div>
                         <% } else {%><div align="left" ><%=Rsweather.getString("weather1")%>  </div><%} %>
                         <div align="center" ><%=Rsweather.getString("lowtemp")%>��~<%=Rsweather.getString("hightemp")%>��</div>
                         <%  Rsweather.next();%></td><%
					    }
					    }
					}}
		            catch (SQLException e)
            		{
            			out.println("������Ϣ��ȫ��");
            		}
            		finally
            		{
            			Con.close();
            		}	
       	}
            		%>
      </tr>
            </table>
 
  </body>
</html>
