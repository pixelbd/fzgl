<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>���ְ��������Ϣ</title>
    
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
{ alert("���������֤�ţ�");form2.id.focus();return;}
if (form2.name.value=="")
{ alert("������ְ��������");form2.name.focus();return;}
if (form2.birthday.value=="")
{ alert("������������ڣ�");form2.birthday.focus();return;}
if (form2.workday.value=="")
{ alert("������μӹ������ڣ�");form2.workday.focus();return;}
if (form2.workcard.value=="")
{ alert("�����빤��֤�ţ�");form2.workcard.focus();return;}
if (form2.yibao.value=="")
{ alert("������ҽ�Ʊ��պţ�");form2.yibao.focus();return;}
if (form2.jg.value=="")
{ alert("�����뼮�ᣡ");form2.workcard.focus();return;}
if (form2.zz.value=="")
{ alert("�������ͥסַ��");form2.zz.focus();return;}

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
                  <option value="" selected>����ѡ�񳵼�:</option>
                  <option value="41" <%if (chej.equals("zz"))  out.print("selected");%>>֣�ݼ��޳���&nbsp;</option>
                  <option value="42" <%if (chej.equals("ys"))  out.print("selected");%>>��ɽ���޳���&nbsp;</option>
                  <option value="43" <%if (chej.equals("ly"))  out.print("selected");%>>�������޳���&nbsp;</option>
                  <option value="44" <%if (chej.equals("zl"))  out.print("selected");%>>֣�����ᳵ��&nbsp;</option>
                </select>&nbsp;*
              <% } else { %>
                <input name="cj" type="hidden" value=<%=chej%>>
               <%  if (chej.equals("zz")) { %> ֣�ݼ��޳��� <% } %>
               <%  if (chej.equals("ys")) { %> ��ɽ���޳��� <% } %>
               <%  if (chej.equals("ly")) { %> �������޳��� <% } %>
               <%  if (chej.equals("zl")) { %> ֣�����ᳵ�� <% } %>
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
      <td align="center" width="60"  class="word_white">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
      <td width="180"><input type="text" name="name" class="Sytle_text"></td>
      <td width="50" align="center" class="word_white">�Ա�</td>
      <td width="100" align="center">
          <select name="sex" class="Sytle_select">
             <option value="��" selected>��&nbsp;</option>
             <option value="Ů" >Ů&nbsp;</option>
          </select>&nbsp;*
      </td>
      <td width="60" align="center" class="word_white">������ò</td>
      <td align="center">
          <select name="mm" class="Sytle_select">
             <option value="��Ա" selected>��Ա&nbsp;</option>
             <option value="��Ա" >��Ա&nbsp;</option>
             <option value="Ⱥ��" >Ⱥ��&nbsp;</option>
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
      <td align="center" width="60" class="word_white">��������</td>
      <td><input name="birthday" type="text" class="Sytle_text" ondblclick="loadCalendar(this)" >*</td>
      <td width="80" class="word_white">�μӹ���ʱ��</td>
      <td><input name="workday" type="text" class="Sytle_text" ondblclick="loadCalendar(this)" >*</td>
   </tr>
   </table>
   </td>
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%" cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" width="60" class="word_white">����֤��</td>
      <td><input type="text" name="workcard" class="Sytle_text">*</td>
      <td width="80" align="center" class="word_white">ҽ�Ʊ��պ�</td>
      <td><input type="text" name="yibao" class="Sytle_text">*</td>
   </tr>
   </table>
   </td>
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%" cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" class="word_white" width="60">���֤��</td>
      <td><input type="text" name="id" class="Sytle_text" size="35">*</td>
   </tr>
   </table>
   </td>
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%"  cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" class="word_white" width="60">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
      <td><input type="text" name="jg" class="Sytle_text">*</td>
      <td width="60" align="center" class="word_white">סַ</td>
      <td><input type="text" name="zz" class="Sytle_text" size="55">*</td>
   </tr>
   </table>
   </td>
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%" cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" class="word_white" width="60">ѧ&nbsp;&nbsp;&nbsp;&nbsp;��</td>
      <td width="180">
      <select name="xl" class="Sytle_select">
             <option value="" selected>��ѡ��ѧ��&nbsp;</option>
             <option value="����" >����&nbsp;</option>
             <option value="ר��" >ר��&nbsp;</option>
             <option value="��ר" >��ר&nbsp;</option>
             <option value="�м�" >�м�&nbsp;</option>
             <option value="����" >����&nbsp;</option>
      </select>
      </td>
      <td class="word_white" width="60" align="center">��ҵԺУ</td>
      <td><input type="text" name="xx" class="Sytle_text"></td>
   </tr>
   </table>
   </td>
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%" cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" class="word_white" width="65">ְ&nbsp;&nbsp;&nbsp;&nbsp;��</td>
      <td width="120">
      <select name="zw" class="Sytle_select">
             <option value="" selected>��ѡ��ְ��</option>
             <option value="����" >����</option>
             <option value="���" >���</option>
             <option value="������" >������</option>
             <option value="����" >����</option>
      </select>
      </td>
      <td class="word_white" width="60" align="center">����</td>
      <td width="110">
      <select name="bz" class="Sytle_select"><option value="" >��</option>
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
      <td class="word_white" width="60" align="center">����</td>
      <td width="80">
      <select name="gz" class="Sytle_select">
      <option value="" >��</option>
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
            		out.println("δ�ҵ�ְ����Ϣ!");
         }
         finally
         { Con.close(); }
         }%>
	  </select>				     
      </td>
      <td align="center" class="word_white" width="80">�ڸ����</td>
      <td width="80">
      <select name="zaig" class="Sytle_select">
             <option value="1" selected>��</option>
             <option value="0" >��</option>
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
      <td align="center" class="word_white" width="60">�����ʸ�</td>
      <td width="180">
      <select name="zg" class="Sytle_select">
             <option value="" selected>��ѡ�����ʸ�&nbsp;</option>
             <option value="�߼�" >�߼�&nbsp;</option>
             <option value="�м�" >�м�&nbsp;</option>
             <option value="����" >����&nbsp;</option>
             <option value="��ʦ" >��ʦ&nbsp;</option>
      </select>
      </td>
      <td class="word_white" width="60" align="center">����ְ��</td>
      <td><select name="zc" class="Sytle_select">
             <option value="" selected>��ѡ����ְ��&nbsp;</option>
             <option value="�߼�����ʦ" >�߼�����ʦ&nbsp;</option>
             <option value="����ʦ" >����ʦ&nbsp;</option>
             <option value="������ʦ" >������ʦ&nbsp;</option>
             <option value="����Ա" >����Ա&nbsp;</option>
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
      <td align="center" class="word_white" width="60">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
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
      <td align="center" class="word_white" width="100">ѡ���ϴ���Ƭ:</td>
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
                <input name="Submit" type="submit" class="Style_button" value="��&nbsp;&nbsp;��" onClick="check()">
                <input name="Submit2" type="reset" class="Style_button" value="��&nbsp;&nbsp;�� ">                
                <input name="myclose" type="button" class="Style_button"  value="��&nbsp;&nbsp;��"
				 onClick="javascrip:window.close()">
                 </td>
          </tr>
         <tr>
  <td align="center" height="30">
  <div><font color="#D43939">��ǰ�������<%  if (chej.equals("41")) { %>��֣�ݼ��޳��䡿<% } %>
               <%  if (chej.equals("42")) { %>����ɽ���޳��䡿<% } %>
               <%  if (chej.equals("43")) { %>���������޳��䡿<% } %>
               <%  if (chej.equals("44")) { %>��֣�����ᳵ�䡿<% } %>ְ����Ϣ.</font> <font color="#15600B">ע����<font color="#ff0080">&nbsp;*</font>&nbsp;�ŵ���ĿΪ���������ʡ�ԡ�</font></div>
  </td>
  </tr> </form>
  </table>
</body>
</html>
