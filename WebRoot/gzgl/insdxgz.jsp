<%@ page language="java"  import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��ӵ��͹��ϼ�¼...</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link href="Css/stylerjhinsert.css" rel="stylesheet">
<script language="javascript">
function Mycheck()
{
if (form1.bt.value=="")
{ alert("��������Ϣ���⣡");form1.bt.focus();return;}
if (form1.nr.value=="")
{ alert("�����붯̬��Ϣ�����");form1.nr.focus();return;}
form1.submit();
}
function changebz()
{ formbz.submit();}
function changefxr()
   { formfxr.submit();}
function changebw1()
{ formbw1.submit();}
function changebw2()
{ formbw2.submit();}
</script>
<style type="text/css">
<!--
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

<body background="Images/bg2.gif">
  <%        
  request.setCharacterEncoding("gb2312");
         
  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
  java.util.Date today=new java.util.Date();
  String now = formatter.format(today); 
      
  boolean islog=false;
  String fxrname="";
  String fxr="";
  if (request.getParameter("fxr")!=null) fxr = new String(request.getParameter("fxr"));
  
  //bzΪ�������Ĳ���,bzcodeΪ������ǹ���Ҫѡ��İ���
  String bz="";
  if (request.getParameter("bz")!=null) bz = new String(request.getParameter("bz"));
  String bzcode="";
  if (request.getParameter("bzcode")!=null) bzcode = new String(request.getParameter("bzcode"));
  String cj="";
  if (request.getParameter("cj")!=null) cj = new String(request.getParameter("cj"));
  String sqlbz="select bz,code from banzu where cj='"+cj+"' and code<>''";
  String tab="";
  if (cj.equals("41")) tab="zhigongzz";
  if (cj.equals("42")) tab="zhigongys";
  if (cj.equals("43")) tab="zhigongly";
  if (cj.equals("44")) tab="zhigongzl"; 
  String sqlfxr="";
  if (!bz.equals("")) sqlfxr="select name,id from "+tab+" where bz='"+bz+"'";
  else if(!bzcode.equals("")) sqlfxr="select name,id from "+tab+" where bz='"+bzcode+"'";
  String sqlbw1=" select distinct bw1 from dxgzfl ";
  String bw1="";
  if (request.getParameter("bw1")!=null) bw1=new String(request.getParameter("bw1"));
  String sqlbw2="";
  if (!bw1.equals("")||(bw1!=null)) sqlbw2=" select bw2 from dxgzfl where bw1='"+bw1+"'";
  String bw2="";
  if (request.getParameter("bw2")!=null) bw2=new String(request.getParameter("bw2"));
  
   Class.forName("org.gjt.mm.mysql.Driver").newInstance();
  Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
  Statement Smts; 
  ResultSet Rs;
  Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);     
 
 
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
  if (islog)
  { }
  %>

<table align="center" width="557" height="400" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td width="557" height="70" valign="top">
    <div>
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/tjdxgz.gif">
      <tr>
        <td></td>
      </tr>
    </table> </div><div>
     <table  border="0" width="100%" align="center" cellpadding="-2" cellspacing="-2">
       <tr align="left">
      <td  height="28" class="style1" align="left">&nbsp;��&nbsp;��&nbsp;��:</td>
      <%if (bz.equals("")) { %>
      <td><form ACTION="gzgl/insdxgz.jsp" METHOD="POST" name="formbz">
      <input name="bz" type="hidden" value=<%=bz%> >
      <input name="cj" type="hidden" value=<%=cj%> >
      <input name="fxr" type="hidden" value=<%=fxr%> >
      <input name="bw1" type="hidden" value=<%=bw1%> >
      <input name="bw2" type="hidden" value=<%=bw2%> >
       <select name="bzcode"   class="Sytle_select" onchange="changebz()">
      <option value="">��ѡ�����˰���</option>
      <%
       if (Con!= null)
       {
           try
           {
           int CountR=0;
           Rs = Smts.executeQuery(sqlbz);
           Rs.last();
           int i = 0;
           CountR = Rs.getRow();
           Rs.first();
           if (CountR>0)
           {
               while (!Rs.isAfterLast())
               {      
               %>
               <option  <%if (bzcode.equals(Rs.getString("code"))) out.print("selected"); %> value="<%=Rs.getString("code")%>"><%=Rs.getString("bz")%>&nbsp;</option>
               <% 
				Rs.next();
				i++;
			    } 
			}
		}
        catch (SQLException e)
        {
            out.println("error!");
        }
        finally { }
    }
    }//end of if bz=""      
	%>
    </select></form></td>
      <td ><form ACTION="gzgl/insdxgz.jsp" METHOD="POST" name="formfxr">
      <input name="bz" type="hidden" value=<%=bz%> >
      <input name="cj" type="hidden" value=<%=cj%> >
      <input name="bzcode" type="hidden" value=<%=bzcode%> >
      <input name="bw1" type="hidden" value=<%=bw1%> >
      <input name="bw2" type="hidden" value=<%=bw2%> >
      <select name="fxr"   class="Sytle_select" onchange="changefxr()">
      <option value="">��ѡ������</option>
      <%
       if (Con!= null)
       {
           try
           {
           int CountR=0;
           Rs = Smts.executeQuery(sqlfxr);
           Rs.last();
           int j = 0;
           CountR = Rs.getRow();
           Rs.first();
           if (CountR>0)
           {
               while (!Rs.isAfterLast())
               {    
               %>
               <option  <%
               if (fxr.equals(Rs.getString("id"))) 
               {
               out.print("selected"); 
               fxrname=Rs.getString("name");               
               }
               %> value="<%=Rs.getString("id")%>"><%=Rs.getString("name")%>&nbsp;                         
               </option>
               <% 
				Rs.next();
				j++;
			    } 
			}
		}
        catch (SQLException e)
        {
            out.println("error!");
        }
        finally {   }
        }  
	%>
    </select></form></td></tr>
    <tr><td height="25" align="left"><font color="#003366">���Ϸ���ѡ��:&nbsp;</font></td>
       <td>
       <form  ACTION="gzgl/insdxgz.jsp"  METHOD="POST" name="formbw1"> 
          <input type="hidden" name="cj" value="<%=cj%>">
          <input type="hidden" name="bz" value="<%=bz%>">
          <input name="bzcode" type="hidden" value=<%=bzcode%> >
          <input name="fxr" type="hidden" value=<%=fxr%> >
           <select name="bw1"   class="Sytle_select" onchange="changebw1()">
           <option value=""  >ѡ����ϲ�λ����&nbsp;</option>
         <% if (Con!= null)
         {
           try
           {
           int CountR=0;
           Rs = Smts.executeQuery(sqlbw1);
           Rs.last();
           int i = 0;
           CountR = Rs.getRow();
           Rs.first();
           if (CountR>0)
           {
               while (!Rs.isAfterLast())
               {      
               %>
           <option  <%if (bw1.equals(Rs.getString("bw1"))) out.print("selected"); %> value="<%=Rs.getString("bw1")%>"><%=Rs.getString("bw1")%>&nbsp;</option>
               <% 
				Rs.next();
				i++;
			    } 
			}
			}
        catch (SQLException e)
        {
            out.println("error!");
        }
        finally {   }
        }%>
        </select>
          </form>
          </td>
          <td>
          <form ACTION="gzgl/insdxgz.jsp" name=formbw2 METHOD="POST"> 
          <input type="hidden" name="cj" value="<%=cj%>">
          <input type="hidden" name="bz" value="<%=bz%>">
          <input name="bzcode" type="hidden" value=<%=bzcode%> >
          <input name="fxr" type="hidden" value=<%=fxr%> >
          <input name="bw1" type="hidden" value=<%=bw1%> >
          <select name="bw2"   class="Sytle_select" onchange="changebw2()">
          <option value="" >ѡ����ϸ��λ&nbsp;</option>
         <%
         
         if (Con!= null)
         {
           try
           {
           int CountR=0;
           Rs = Smts.executeQuery(sqlbw2);
           Rs.last();
           int i = 0;
           CountR = Rs.getRow();
           Rs.first();
           if (CountR>0)
           {
               while (!Rs.isAfterLast())
               {      
               %>
           <option  <%if (bw2.equals(Rs.getString("bw2"))) out.print("selected"); %> value="<%=Rs.getString("bw2")%>"><%=Rs.getString("bw2")%>&nbsp;</option>
               <% 
				Rs.next();
				i++;
			    } 
			}
			}
        catch (SQLException e)
        {
            out.println("error!");
        }
        finally {  Con.close(); }
    }
	     %>
         </select> </form>&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
    </tr>    
    </table></div><div>
      <table width="600" height="250"  border="0" align="center" cellpadding="-2" cellspacing="0">
      <form ACTION="gzgl/insdxgztj.jsp" METHOD="POST" enctype="multipart/form-data" name="formup">
      <input name="fxrid" type="hidden" value=<%=fxr%> >
      <input name="fxrname" type="hidden" value=<%=fxrname%> >
      <input name="bzcode" type="hidden" value=<%=bzcode%> >
      <input name="bz" type="hidden" value=<%=bz%> >
      <input name="cj" type="hidden" value=<%=cj%> >
      <input name="bw1" type="hidden" value=<%=bw1%> >
      <input name="bw2" type="hidden" value=<%=bw2%> >
          <tr>
            <td   height="28" class="style1" align="left">&nbsp;����:</td>
            <td  align="left" class="style1"><input type="text" name="rq" value=<%=now %>></td>
         </tr>
         <tr>
            <td  height="28" class="style1" align="left">&nbsp;����:</td>
            <td  align="left" class="style1"><input name="cx" type="text" size="10">
            &nbsp;����:<input name="ch" type="text" >
            </td>
        </tr>
	  	  <tr>
	  	    <td  height="28" class="style1" align="left">&nbsp;�������:</td>
            <td align="left" colspan="5"  class="wordtitle"><input type="text" name="gzms" class="Sytle_text" id="bt" size="80" >&nbsp;������</td>
          </tr>
          
          <tr>
            <td height="28" class="style1" align="left">&nbsp;ͼƬ1:&nbsp;</td>
            <td colspan="5" ><input type="file" name="pic1"></td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;ͼƬ1˵��:</td>
            <td colspan="5"  class="wordtitle"><input type="text" name="tpjs1" class="Sytle_text"  size="40" >&nbsp;��ѡ��</td>
          </tr>
          
          <tr>
            <td height="28" class="style1" align="left">&nbsp;ͼƬ2:&nbsp;</td>
            <td colspan="5" class="wordtitle"><input type="file" name="pic2">&nbsp;��ѡ��</td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;ͼƬ2˵��:</td>
            <td colspan="5"  class="wordtitle"><input type="text" name="tpjs2" class="Sytle_text"  size="40" >&nbsp;��ѡ��</td>
          </tr>
          <tr>
            <td colspan="6" height="40"  align="center" valign="middle"> 
                <input name="Submit" type="submit"  class="Style_button" value="��&nbsp;&nbsp;��" onClick="Mycheck()">
                <input name="myclose" type="button" class="Style_button" id="myclose" value="��&nbsp;&nbsp;��"
				 onClick="javascrip:window.close()">
                 </td>
          </tr></form>
        </table>
      </div>
      
     </td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">��ǰ������ӹ�����Ϣ��¼.</font> <font color="#15600B">ע��1.ֻ���ϴ�GIF��JPG��BMP��ʽͼƬ,���ļ����в��������֡�</font></div>
  </td>
  </tr>
</table>

  </body>
</html>

