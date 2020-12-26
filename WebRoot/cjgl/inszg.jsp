<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加职工人事信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <style type="text/css">
 <!--   .dottedtab1 {
   BORDER-RIGHT: #FF9933 1px dotted; 
   BORDER-TOP: #FF9933 1px dotted; 
   BORDER-LEFT: #FF9933 1px dotted; 
   BORDER-BOTTOM: #FF9933 1px dotted
    }
    .dottedtab2 {
   BORDER-RIGHT: #6699CC 1px dotted; 
   BORDER-TOP: #6699CC 1px dotted; 
   BORDER-LEFT: #6699CC 1px dotted; 
   BORDER-BOTTOM: #6699CC 1px dotted
    }
   body {
	margin-left: 0px; 
	margin-top: 0px;
      }
   .style1 { color: #334094 }
   .style2 { color: #669999 }
   .wordtitle{color: #E54743}
-->
</style>
  </head>
  <LINK href="Css/css1.css" type=text/css rel=stylesheet>
  <body background="Images/bg2.gif">
  <script language="javascript">
   function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
   }

  function Mycheck()
{
form1.submit();
}
function check()
{
if (form2.id.value=="")
{ alert("请输入身份证号！");form2.id.focus();return;}
if (form2.name.value=="")
{ alert("请输入职工姓名！");form2.name.focus();return;}
if (form2.birthday.value=="")
{ alert("请输入出生日期！");form2.birthday.focus();return;}
if (form2.workday.value=="")
{ alert("请输入参加工作日期！");form2.workday.focus();return;}
if (form2.workcard.value=="")
{ alert("请输入工作证号！");form2.workcard.focus();return;}
if (form2.yibao.value=="")
{ alert("请输入医疗保险号！");form2.yibao.focus();return;}
if (form2.jg.value=="")
{ alert("请输入籍贯！");form2.workcard.focus();return;}
if (form2.zz.value=="")
{ alert("请输入家庭住址！");form2.zz.focus();return;}

form2.submit();}
</script>

  <%        
         request.setCharacterEncoding("gb2312");
          
          String chej="";
          String tabname="zhigong";
          
          if ((request.getParameter("cj") != null)) chej =request.getParameter("cj"); 
          if (!(chej.equals(""))) tabname=tabname+chej;
          if (chej.equals("zz")) chej="41";
          if (chej.equals("ys")) chej="42";
          if (chej.equals("ly")) chej="43";
          if (chej.equals("zl")) chej="44";
          if ((request.getParameter("cj2") != null)) chej =request.getParameter("cj2");
          if (chej.equals("41")) tabname="zhigongzz";
          if (chej.equals("42")) tabname="zhigongys";
          if (chej.equals("43")) tabname="zhigongly";
          if (chej.equals("44")) tabname="zhigongzl";
         %>

<table align="center" width="600" height="260" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
    <td width="600" height="70" valign="top">
    <table  border="0"  cellpadding="-2" cellspacing="-2" >
      <tr>
        <td><img width="557" height="70"  class=pic src="Images/tjrsxx.gif"/></td>
      </tr>
    </table>      
      
      <table width="600"   border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr>  
          <form ACTION="cjgl/inszg.jsp" name=form1 METHOD="POST">
            <td  height="30" width="45%" class="style1" align="right"></td>
            <td>
            <% if (chej.equals("")) { %>
              <select name="cj2" class="Sytle_select" onchange="Mycheck()">
                  <option value="" selected>请先选择车间:</option>
                  <option value="41" <%if (chej.equals("zz"))  out.print("selected");%>>郑州检修车间&nbsp;</option>
                  <option value="42" <%if (chej.equals("ys"))  out.print("selected");%>>月山检修车间&nbsp;</option>
                  <option value="43" <%if (chej.equals("ly"))  out.print("selected");%>>洛阳检修车间&nbsp;</option>
                  <option value="44" <%if (chej.equals("zl"))  out.print("selected");%>>郑州轮轴车间&nbsp;</option>
                </select>&nbsp;*
              <% } else { %>
                <input name="cj" type="hidden" value=<%=chej%>>
               <%  if (chej.equals("zz")) { %> 郑州检修车间 <% } %>
               <%  if (chej.equals("ys")) { %> 月山检修车间 <% } %>
               <%  if (chej.equals("ly")) { %> 洛阳检修车间 <% } %>
               <%  if (chej.equals("zl")) { %> 郑州轮轴车间 <% } %>
              <% } %>
           </td>
           </form>
          </tr>
   <form ACTION="cjgl/inszgtl.jsp" METHOD="POST" name="form2" enctype="multipart/form-data" onsubmit="return Mycheck(form1)" >
   <input type="hidden" name="tabname" value=<%=tabname %>>
   
   <tr>  
            <td colspan="2"  class="style1" align="center">
            <div>
            <table width="100%"   cellpadding="1" cellspacing="1" >
       <tr height="25" bgcolor="#6699CC">
      <td align="center" width="60"  class="word_white">姓&nbsp;&nbsp;&nbsp;&nbsp;名</td>
      <td width="180"><input type="text" name="name" class="Sytle_text"></td>
      <td width="50" align="center" class="word_white">性别</td>
      <td width="100" align="center">
          <select name="sex" class="Sytle_select">
             <option value="男" selected>男&nbsp;</option>
             <option value="女" >女&nbsp;</option>
          </select>&nbsp;*
      </td>
      <td width="60" align="center" class="word_white">政治面貌</td>
      <td align="center">
          <select name="mm" class="Sytle_select">
             <option value="党员" selected>党员&nbsp;</option>
             <option value="团员" >团员&nbsp;</option>
             <option value="群众" >群众&nbsp;</option>
          </select>*
      </td>
   </tr>
            </table>
            </div>
            </td>
   </tr>
   <tr>
   <td height="25" colspan="2">
   <table width="100%"  cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" width="60" class="word_white">出生日期</td>
      <td><input name="birthday" type="text" class="Sytle_text" ondblclick="loadCalendar(this)" >*</td>
      <td width="80" class="word_white">参加工作时间</td>
      <td><input name="workday" type="text" class="Sytle_text" ondblclick="loadCalendar(this)" >*</td>
   </tr>
   </table>
   </td>
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%" cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" width="60" class="word_white">工作证号</td>
      <td><input type="text" name="workcard" class="Sytle_text">*</td>
      <td width="80" align="center" class="word_white">医疗保险号</td>
      <td><input type="text" name="yibao" class="Sytle_text">*</td>
   </tr>
   </table>
   </td>
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%" cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" class="word_white" width="60">身份证号</td>
      <td><input type="text" name="id" class="Sytle_text" size="35">*</td>
   </tr>
   </table>
   </td>
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%"  cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" class="word_white" width="60">籍&nbsp;&nbsp;&nbsp;&nbsp;贯</td>
      <td><input type="text" name="jg" class="Sytle_text">*</td>
      <td width="60" align="center" class="word_white">住址</td>
      <td><input type="text" name="zz" class="Sytle_text" size="55">*</td>
   </tr>
   </table>
   </td>
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%" cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" class="word_white" width="60">学&nbsp;&nbsp;&nbsp;&nbsp;历</td>
      <td width="180">
      <select name="xl" class="Sytle_select">
             <option value="" selected>请选择学历&nbsp;</option>
             <option value="本科" >本科&nbsp;</option>
             <option value="专科" >专科&nbsp;</option>
             <option value="中专" >中专&nbsp;</option>
             <option value="中技" >中技&nbsp;</option>
             <option value="高中" >高中&nbsp;</option>
      </select>
      </td>
      <td class="word_white" width="60" align="center">毕业院校</td>
      <td><input type="text" name="xx" class="Sytle_text"></td>
   </tr>
   </table>
   </td>
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%" cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" class="word_white" width="65">职&nbsp;&nbsp;&nbsp;&nbsp;务</td>
      <td width="120">
      <select name="zw" class="Sytle_select">
             <option value="" selected>请选择职务</option>
             <option value="主任" >主任</option>
             <option value="书记" >书记</option>
             <option value="副主任" >副主任</option>
             <option value="工长" >工长</option>
      </select>
      </td>
      <td class="word_white" width="60" align="center">班组</td>
      <td width="110">
      <select name="bz" class="Sytle_select"><option value="" >无</option>
     <%
       String sql="select * from banzu where cj="+chej;
       int CountR = 0;
       Class.forName("org.gjt.mm.mysql.Driver").newInstance();
       Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123");  
       Statement Smts; 
                ResultSet Rs;
                if (Con!= null)
            	{
            		try
            		{
            		
					 Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                     Rs = Smts.executeQuery(sql);
                        Rs.last();
                        int i = 0;
            			CountR = Rs.getRow();
            			
            			Rs.first();
            			if (CountR>0)
            			{
            			while (!Rs.isAfterLast())
            			    {     
            			    
            			 %> <option value="<%=Rs.getString("code") %>" ><%=Rs.getString("bz")%></option>
                         <% 
					            Rs.next();
					            i++;
					        } 
					        
					     }
		            %>  
      </select>
      </td>
      <td class="word_white" width="60" align="center">工种</td>
      <td width="80">
      <select name="gz" class="Sytle_select">
      <option value="" >无</option>
      <%  sql="select gz from gongzhong"; 
          Rs = Smts.executeQuery(sql);
          Rs.last();
          i = 0;
          CountR = Rs.getRow();
          Rs.first();
          if (CountR>0)
          {
            while (!Rs.isAfterLast())
            {     
            %> <option value="<%=Rs.getString("gz") %>" ><%=Rs.getString("gz") %></option>
            <% 
			Rs.next();
			i++;
			} 
		  }
		  }
          catch (SQLException e)
         {
            		out.println("未找到职工信息!");
         }
         finally
         { Con.close(); }
         }%>
	  </select>				     
      </td>
      <td align="center" class="word_white" width="80">在岗情况</td>
      <td width="80">
      <select name="zaig" class="Sytle_select">
             <option value="1" selected>是</option>
             <option value="0" >否</option>
      </select>
      </td>
   </tr>
   </table>
   </td>
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%" cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" class="word_white" width="60">技术资格</td>
      <td width="180">
      <select name="zg" class="Sytle_select">
             <option value="" selected>请选择技术资格&nbsp;</option>
             <option value="高级" >高级&nbsp;</option>
             <option value="中级" >中级&nbsp;</option>
             <option value="初级" >初级&nbsp;</option>
             <option value="技师" >技师&nbsp;</option>
      </select>
      </td>
      <td class="word_white" width="60" align="center">技术职称</td>
      <td><select name="zc" class="Sytle_select">
             <option value="" selected>请选择技术职称&nbsp;</option>
             <option value="高级工程师" >高级工程师&nbsp;</option>
             <option value="工程师" >工程师&nbsp;</option>
             <option value="助理工程师" >助理工程师&nbsp;</option>
             <option value="技术员" >技术员&nbsp;</option>
      </select>
      </td>
   </tr>
   </table>
   </td>
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%" cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" class="word_white" width="60">简&nbsp;&nbsp;&nbsp;&nbsp;历</td>
      <td align="center">
      <textarea  name="jl"  class="Sytle_text"  cols="100" rows="15"></textarea></td>
   </tr>
   </table>
   </td>
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%" cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" class="word_white" width="100">选择上传照片:</td>
      <td align="center">
      <input size="70" type="file" name="pic"></td>
   </tr>
   </table>
   </td>
</tr>
</table>
            
            </td>
          </tr>
          <tr>
            <td colspan="2" height="50"  align="center" valign="middle"> 
            <input name="cj" type="hidden" class="Style_text" value="<%=chej%>">
                <input name="Submit" type="submit" class="Style_button" value="保&nbsp;&nbsp;存" onClick="check()">
                <input name="Submit2" type="reset" class="Style_button" value="重&nbsp;&nbsp;置 ">                
                <input name="myclose" type="button" class="Style_button"  value="关&nbsp;&nbsp;闭"
				 onClick="javascrip:window.close()">
                 </td>
          </tr>
         <tr>
  <td align="center" height="30">
  <div><font color="#D43939">当前正在添加<%  if (chej.equals("41")) { %>【郑州检修车间】<% } %>
               <%  if (chej.equals("42")) { %>【月山检修车间】<% } %>
               <%  if (chej.equals("43")) { %>【洛阳检修车间】<% } %>
               <%  if (chej.equals("44")) { %>【郑州轮轴车间】<% } %>职工信息.</font> <font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr> </form>
  </table>
</body>
</html>
