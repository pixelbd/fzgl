<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>动态信息...</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
 
  <style type="text/css">
  blockquote {
    line-height:200%;
    letter-spacing: 0.2em;
    color:#004080;
    }
  .wordwhite{
      color:#FFFFFF;
      }
  .pic { 
     width:350px; height:260px; margin:5px; border:3px solid #FFFFFF; 
     }
  BODY{
      FONT-SIZE: 12px;
      COLOR: #000000;
      FONT-FAMILY:  宋体;
      background-color: #FFFFFF; 
      scrollbar-face-color: #DEE3E7;
      scrollbar-highlight-color: #FFFFFF;
      scrollbar-shadow-color: #DEE3E7;
      scrollbar-3dlight-color: #D1D7DC;
      scrollbar-arrow-color:  #006699;
      scrollbar-track-color: #EFEFEF;
      scrollbar-darkshadow-color: #98AAB1;
      	margin-left: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
	margin-right: 0px;
      }
  .tb_LRB{
	  border:2px solid #3AAFC0;
	  border-top-style:none;
      }
  .tb_LR{
	  border:2px solid #3AAFC0;
	  border-top-style:none;
	  border-bottom-style:none;
      }
  INPUT.btnblue {
	  BORDER-RIGHT: #3AAFC0 1px solid; BORDER-TOP: #3AAFC0 1px solid; FONT-SIZE: 9pt; 
	  BACKGROUND: #CAF0FF; BORDER-LEFT: #3AAFC0 1px solid; COLOR: #006699; BORDER-BOTTOM: #3AAFC0 1px solid;HEIGHT: 25px;width: 100px
      }
      
  </style>

   <LINK href="Css/css1.css" type=text/css rel=stylesheet>
  <body >

  <table align="center" width="100%" height="130" cellpadding="-2" cellspacing="-2"  >
  <tr>
      <td rowspan="2" background="Images/body_bg1.gif">&nbsp;</td>
      <td width="800" height="80" align="left" background="Images/body_bg1.gif">
      <div>
      <table>
      <tr><td width="500" align="left"><img  height="80" width="186" src="Images/showxx.gif" border="0"></td>
      <td width="300" align="center" valign="middle">
      <table>
      <tr><td rowspan="2"><img  height="40" width="60" src="Images/dhwhite.gif" border="0"></td>
          <td></td>
      </tr>
      <tr>
          <td height="40"></td>
          <td valign="center"><font size="2"><font color="#ffffff">郑州北车辆段货车检修系统</font></font></td></tr>
      </table>
      </td>
      
      </tr>
      </table>
      </div>
      </td>
      <td rowspan="2" background="Images/body_bg1.gif">&nbsp;</td>
  </tr>
   
 
  <% 
  String id="";
  String pic[]={"pic1","pic2","pic3","pic4","pic5"};
  String tpjs[]={"tpjs1","tpjs2","tpjs3","tpjs4","tpjs5"};
  String showpic[]={"","","","",""};
  String showtpjs[]={"","","","",""};
  String bumen="";
  int CountR=0;
  int i=0;
  
  if (request.getParameter("id") != null)  	id = new String(request.getParameter("id"));
  String sql="select * from dtxx where id='"+id+"'"; 
  
  Class.forName("org.gjt.mm.mysql.Driver").newInstance();
  Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/dtxx","root","123");
        
  Statement Smts; 
  ResultSet Rs;
  
  if (Con!= null)
  {
    try
    {
      Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
      Rs = Smts.executeQuery(sql);
            	
      Rs.last();
      CountR = Rs.getRow();
      Rs.first();
      if (CountR>0)
      {
  
  %>
  <tr>
     <td class="tb_LR" height="31" width="800" align="center" background="Images/h.gif">
     <font color="#004080">
     ==&nbsp;<%=Rs.getString("bt")%>&nbsp;==</font></td>
  </tr> 
  <%for (i=0;i<5;i++) { 
  if (!Rs.getString(pic[i]).equals("")) 
  { showpic[i]="http://10.99.125.238:8080/fzgl/dtxxpic/"+Rs.getString(pic[i]);
    showtpjs[i]=Rs.getString(tpjs[i]);
    
            %>
  <tr>
  
     <td></td>
     <td bgcolor="#DFF4F7" class=tb_LR align="center" width="800">
     <div><img class=pic src=<%=showpic[i]%> alt=<%=showtpjs[i]%>/></div>
     <div><font color="#259FEF">图片<%=i+1%>:[&nbsp;<%=showtpjs[i]%>&nbsp;]</font></div>
     </td>
     <td></td>
  </tr>
  <%}
  }%>
  <tr>
      <td >&nbsp;</td>
      <td width="800"  align="left" class=tb_LRB>
      <div>
      <table  width="100%" bgcolor="#DFF4F7">
      <tr><td><blockquote><%=Rs.getString("nr")%></blockquote>
      </td></tr>
      <tr>
         <td class="tb_LR" height="30" width="100%" align="left" bgcolor="#4DB5EF">
         <font color="#FFFFFF">
         [&nbsp;此信息由:
              <%if (Rs.getString("fbbm").equals("admin"))  { bumen="系统管理员";}
              if (Rs.getString("fbbm").equals("1"))  { bumen="段领导";}
              if (Rs.getString("fbbm").equals("21")) { bumen="验收室";}
              if (Rs.getString("fbbm").equals("22")) { bumen="技术科";}
              if (Rs.getString("fbbm").equals("23")) { bumen="调度科";}
              if (Rs.getString("fbbm").equals("24")) { bumen="材料科";}
              if (Rs.getString("fbbm").equals("25")) { bumen="质检科";}
              if (Rs.getString("fbbm").equals("41")) { bumen="郑州检修车间";}
              if (Rs.getString("fbbm").equals("42")) { bumen="月山检修车间";}
              if (Rs.getString("fbbm").equals("43")) { bumen="洛阳检修车间";}
              if (Rs.getString("fbbm").equals("44")) { bumen="郑州轮轴车间";}
          %><%=bumen%>:&nbsp;<%=Rs.getString("fbr")%>&nbsp;于&nbsp;<%=Rs.getString("rq").replace("-", ".")%>&nbsp;发布.]
          </font>
         </td>
     </tr>
     <% }
      }
      catch (SQLException e)
           {
            	out.println("!");
           }
           finally
           {
            	Con.close();
           }
        
        }%>
     </table>
    </div>
   </td>
  <td >&nbsp;</td>
  </tr>
  </table>

  <table width="100%" height="50" background="Images/bodybtm.gif">
  <tr><td align="center" width="100%" height="40"><input name="Button" type="button" class="btnblue" onClick="window.close();" value="  - 关 闭 窗 口 - ">
  </td></tr>
  </table>
  
  
   
  </body>
</html>
