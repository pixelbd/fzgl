<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
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
    
    <title>�ļ��籨����</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<SCRIPT language=javascript src="JS/title.js"></SCRIPT>
   <style type="text/css">
   <!--
   .tableB
   {
	   border: #99CCCC 1px solid;
    }
   -->  
   </style>   
  
  </head>
 
<LINK href="Css/gzzdstyle.css" type=text/css rel=stylesheet>
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
    
    boolean islog=false;
	  try
	  {
	   islog=((String)session.getAttribute("islog")).equals("1");
	  }
	  catch(Exception e)
	  {	    
	  }
	  
 
	  
	String wdlb="1";
	if (request.getParameter("wdlb")!=null) wdlb=new String(request.getParameter("wdlb")); 
    String str="";
    String tabname="";
   
    if (wdlb.equals("1")) { str="�����ļ��籨"; tabname="jswd"; }
    if (wdlb.equals("2")) { str="��ȫ�ļ��籨"; tabname="aqwd"; }
    if (wdlb.equals("3")) { str="�����ļ��籨"; tabname="qtwd"; }

   String tdb="";
    if (request.getParameter("tdb")!=null) tdb=new String(request.getParameter("tdb")); 
   String tdbnian="";
     if (request.getParameter("tdbnian")!=null) tdbnian=new String(request.getParameter("tdbnian")); 
   String tdbhao="";
     if (request.getParameter("tdbhao")!=null) tdbhao=new String(request.getParameter("tdbhao"));
   String tlj="";
     if (request.getParameter("tlj")!=null) tlj=new String(request.getParameter("tlj"));  
   String tljnian="";
     if (request.getParameter("tljnian")!=null) tdbnian=new String(request.getParameter("tljnian")); 
   String tljhao="";
     if (request.getParameter("tljhao")!=null) tljhao=new String(request.getParameter("tljhao"));  
   String bw="";
    if (request.getParameter("bw")!=null) bw=new String(request.getParameter("bw"));  
   String sjfrom="";
     if (request.getParameter("sjfrom")!=null) sjfrom=new String(request.getParameter("sjfrom")); 
   String sjto="";
     if (request.getParameter("sjto")!=null) sjto=new String(request.getParameter("sjto")); 
   String wenzi="";
     if (request.getParameter("wenzi")!=null) wenzi=new String(request.getParameter("wenzi"));
   
   Boolean ifnull=true;
    
   String sql="Select * from "+tabname+" where ";
   
   if  (!tdb.equals("")) { sql=sql+"tdb='"+tdb+"'"; ifnull=false; }
   if  (!tdbnian.equals("")) { if (ifnull) { sql=sql+"tdbnian='"+tdbnian+"'"; ifnull=false;}
                                  else { sql=sql+"and tdbnian='"+tdbnian+"'";}
                             }
   if  (!tdbhao.equals("")) { if (ifnull) { sql=sql+"tdbhao='"+tdbhao+"'"; ifnull=false;}
                                  else { sql=sql+"and tdbhao='"+tdbhao+"'";}
                             } 
   if  (!tlj.equals("")) { if (ifnull) { sql=sql+"tlj='"+tlj+"'"; ifnull=false;}
                                  else { sql=sql+"and tlj='"+tlj+"'";}
                             }   
   if  (!tljnian.equals("")) { if (ifnull) { sql=sql+"tljnian='"+tljnian+"'"; ifnull=false;}
                                  else { sql=sql+"and tljnian='"+tljnian+"'";}
                             }                   
   if  (!tljhao.equals("")) { if (ifnull) { sql=sql+"tljhao='"+tljhao+"'"; ifnull=false;}
                                  else { sql=sql+"and tljhao='"+tljhao+"'";}
                             }   
   if  (!bw.equals("")) { if (ifnull) { sql=sql+"bw='"+bw+"'"; ifnull=false;}
                                  else { sql=sql+"and bw='"+bw+"'";}
                             }
   if  ((!sjfrom.equals(""))&&(!sjto.equals(""))) {  if (ifnull) { sql=sql+"  rq>='"+sjfrom+"'"+" and rq<='"+sjto+"'"; ifnull=false;}
                                  else { sql=sql+" and ((rq>='"+sjfrom+"')"+" and ( rq<='"+sjto+"'))";}
                            }  
   if (!wenzi.equals("")) { if (ifnull) { sql=sql+" ( bt like '"+wenzi+"%'"+") or ( bt like '%"+wenzi+"%') or  (zy like '"+wenzi+"%'"+") or (zy like '%"+wenzi+"%')"; ifnull=false;}
                                  else { sql=sql+" and (bt like '"+wenzi+"%'"+") or ( bt like '%"+wenzi+"%') or  (zy like '"+wenzi+"%'"+") or (zy like '%"+wenzi+"%'))";}                 
                            }
   if (ifnull) sql="Select * from "+tabname;
   
   sql=sql+" order by rq desc";
%>
 
  <table width="100%" align="center"   border="0"   cellpadding="0" cellspacing="0" >
  <tr>
      <td align="right" ><div>
      <table width="95%"  align="center"  border="0"   cellpadding="0" cellspacing="0">
          <tr>
          <td width="100" align="center" border="0">
              <table width="100"  border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                 <td  rowspan="2" width="150" align="center" height="62"><img width="66" height="62" src="Images/wjdb/search.gif">
                 </td>
              </tr>
              </table>
              <table  width="100" border="0" align="center" cellpadding="-2" cellspacing="-2" >
                  <tr><td width="100" align="center" height="30"  class="word_white" background="Images/wjdb/jsfw.gif">������Χ</td>
                  <tr align="center"><td height="30" valign="middle" class="word_blue"><%=str%></td><tr>   
                  </tr>
              </table>
          </td>
          <td align="center" border="0"   cellpadding="0" cellspacing="0"  >
                  <table width="100%" align="center"  border="0">
                  <tr><td width="100%" align="center"  class="word_orange">
                       <div>
                      <form action="gzzd/gzzd.jsp" method="post" name="formjs" ><strong>��&nbsp;&nbsp;ѯ&nbsp;&nbsp;��&nbsp;&nbsp;��</strong>
                      <table>
                      <tr>
                          <td height="28">�ĵ����:&nbsp;</td>
                          <td><input type="radio" name="wdlb" value="1" <%if (wdlb.equals("1")) out.print("checked"); %>> ����</td>
                          <td><input type="radio" name="wdlb" value="2" <%if (wdlb.equals("2")) out.print("checked"); %>> ��ȫ</td>
                          <td><input type="radio" name="wdlb" value="3" <%if (wdlb.equals("3")) out.print("checked"); %>> ����</td>
                          <td></td>
                          <td></td>
                      </tr>
                      <tr> 
                          <td colspan="5" height="28">�ļ���ͷ:&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;
                          <select name="tdb" class="Sytle_select" >
                          <option value="" <%if (tdb.equals("")) { out.print("selected"); }%>>ȫ��</option>
                          <option value="��װ����" <%if (tdb.equals("��װ����")) out.print("selected");%>>��װ����</option>
                          <option value="��װ������" <%if (tdb.equals("��װ������")) out.print("selected");%>>��װ������</option>
                          <option value="��װ����" <%if (tdb.equals("��װ����")) out.print("selected");%>>��װ����</option>
                          <option value="��װ�����" <%if (tdb.equals("��װ�����")) out.print("selected");%>>��װ�����</option>
                          <option value="��Ӫ���ܵ�" <%if (tdb.equals("��Ӫ���ܵ�")) out.print("selected");%>>��Ӫ���ܵ�</option>
                          <option value="���Ƽ���" <%if (tdb.equals("���Ƽ���")) out.print("selected");%>>���Ƽ���</option>
                          <option value="����" <%if (tdb.equals("����")) out.print("selected");%>>����</option>
                          <option value="�������" <%if (tdb.equals("�������")) out.print("selected");%>>�������</option>
                          </select>&nbsp;&nbsp;&nbsp;
                          <input name="tdbnian" type="text" class="Sytle_text"  size="10">&nbsp;��&nbsp;&nbsp;&nbsp;
                          <input name="tdbhao" type="text" class="Sytle_text"  size="10">&nbsp;��
                          </td>
                      </tr>
                      <tr>
                          <td colspan="5" height="28">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;
                          <select name="tlj" class="Sytle_select" >
                          <option value="" <%if (tlj.equals("")) out.print("selected");%>>ȫ��&nbsp;&nbsp;&nbsp;</option>
                          <option value="֣����" <%if (tlj.equals("֣����")) out.print("selected");%>>֣����&nbsp;&nbsp;</option>
                          <option value="֣�����" <%if (tlj.equals("֣�����")) out.print("selected");%>>֣�����&nbsp;</option>
                          <option value="֣���˵�" <%if (tlj.equals("֣���˵�")) out.print("selected");%>>֣���˵�&nbsp;</option>
                          <option value="֣���۵�" <%if (tlj.equals("֣���۵�")) out.print("selected");%>>֣���۵�&nbsp;</option>
                          <option value="֣�簲" <%if (tlj.equals("֣�簲")) out.print("selected");%>>֣�簲&nbsp;</option>
                          <option value="֣���캯" <%if (tlj.equals("֣���캯")) out.print("selected");%>>֣���캯&nbsp;</option>
                          <option value="֣���˺�" <%if (tlj.equals("֣���˺�")) out.print("selected");%>>֣���˺�&nbsp;</option>
                          <option value="֣���캯" <%if (tlj.equals("֣���캯")) out.print("selected");%>>֣���캯&nbsp;</option>
                          <option value="֣�ֳ��麯" <%if (tlj.equals("֣�ֳ��麯")) out.print("selected");%>>֣�ֳ��麯</option>
                          <option value="֣������" <%if (tlj.equals("֣������")) out.print("selected");%>>֣������&nbsp;</option>
                          <option value="֣���ƺ�" <%if (tlj.equals("֣���ƺ�")) out.print("selected");%>>֣���ƺ�&nbsp;</option>
                          <option value="֣����" <%if (tlj.equals("֣����")) out.print("selected");%>>֣����&nbsp;</option>
                          <option value="֣����" <%if (tlj.equals("֣����")) out.print("selected");%>>֣����&nbsp;</option>
                          <option value="֣����" <%if (tlj.equals("֣����")) out.print("selected");%>>֣����&nbsp;</option>
                          
                          </select>&nbsp;&nbsp;&nbsp;
                          <input name="tljnian" type="text" class="Sytle_text"  size="10">&nbsp;��&nbsp;&nbsp;&nbsp;
                          <input name="tljhao" type="text" class="Sytle_text"  size="10">&nbsp;��
                          </td>
                      </tr>
                      <tr>
                          <td height="28" align="left">�漰����:&nbsp;</td>
                          <td><input type="radio" name="bw" value="1" <%if (bw.equals("1")) out.print("checked"); %>> ���塢�����</td>
                          <td><input type="radio" name="bw" value="2" <%if (bw.equals("2")) out.print("checked"); %>> ת���</td>
                          <td><input type="radio" name="bw" value="3" <%if (bw.equals("3")) out.print("checked"); %>> ����</td>
                          <td><input type="radio" name="bw" value="4" <%if (bw.equals("4")) out.print("checked"); %>> ����</td>
                          <TD><input type="radio" name="bw" value="5" <%if (bw.equals("5")) out.print("checked"); %>> �����ƶ�</td>
                      </tr>
                      <tr><td height="28">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                          
                          <td><input type="radio" name="bw" value="6" <%if (bw.equals("6")) out.print("checked"); %>> �����ƶ�</td>
                          <td><input type="radio" name="bw" value="7" <%if (bw.equals("7")) out.print("checked"); %>> ������</td>
                          <td> <input type="radio" name="bw" value="8" <%if (bw.equals("8")) out.print("checked"); %>> �����ۺ�</td>
                          <td> <input type="radio" name="bw" value="8" <%if (bw.equals("9")) out.print("checked"); %>> �¹�ͨ��</td>
                          <TD colspan="4"><input type="radio" name="bw" value="" <%if (bw.equals("")) out.print("checked"); %>> ȫ��</td>
                          
                      </tr>
                      
                      <tr><td colspan="5" height="28">����ʱ��:&nbsp;&nbsp;&nbsp;�� &nbsp;
                           <input name="sjfrom" type="text" class="Sytle_text"  size="15" onDBLClick="loadCalendar(this)">&nbsp;&nbsp;&nbsp;�� &nbsp;
                           <input name="sjto" type="text" class="Sytle_text"  size="15" onDBLClick="loadCalendar(this)"></td>
                      </tr>
                      <tr><td colspan="5" height="28">ģ����ѯ:&nbsp;&nbsp;&nbsp;�����ժҪ�������֣� &nbsp;
                           <input name="wenzi" type="text" class="Sytle_text"  size="45">&nbsp;&nbsp;&nbsp; &nbsp;</td>
                           
                      </tr>
                      <tr><td colspan="5" height="28" align="center">
                           <input name="Button1" type="submit" class="Style_longbutton" value="��&nbsp;&nbsp;&nbsp;&nbsp;ѯ" >
                           </td>
                      </tr>
                      </table>
                      </form>
                    </div>
                   </td>
                   </tr>
                   </table>
          </td>
          </tr>
      </table>    
      </div>  
      </td>
  </tr>
   <% if ((islog) && (((String)session.getAttribute("deptment")).equals("admin")))   { %>
  <tr>
     <td   >
     <table width="100%">
            <tr> 
            <td rowspan="2" align="right" valign="middle" width="100" height="40">
            <img src="Images/edit.ico" width="40" height="40" border="0" >
            </td>
            <td ></td>
            </tr>
            <tr> 
            
            <td  valign="middle" height="25">
            <a href="gzzd/gzzd.jsp?page=1&pgcode=<%=CurrPg%>&wdlb=<%=wdlb%>&tdb=<%=tdb%>&tdbnian=<%=tdbnian%>&tdbhao=<%=tdbhao%>&tlj=<%=tlj%>&tljnian=<%=tljnian%>&tljhao=<%=tljhao%>&bw=<%=bw%>&sjfrom=<%=sjfrom%>&sjto=<%=sjto%>&wenzi=<%=wenzi %>"  onClick="Javascript:window.open('addwd.jsp','','width=620,height=720')">����ļ��籨</a>
            </td>
            </tr>
     </table>
     </td>
  </tr>
  <% } else {}%>
  <tr>
     <td >
		<table width="100%"    border="0"  cellpadding="0" cellspacing="0">
		<tr>
		    <td width="35" valign="top">
		    <table width="100%"  height="133" border="0"  cellpadding="0" cellspacing="0">
		    <tr>
		        <td width="35" valign="top" height="133" align="right"><img src="Images/wjdb/tableleft.jpg"></td>
		    </tr>
		    </table>
		    </td>
		    <td  valign="top">
		    <table width="100%"  border="0"  cellpadding="0" cellspacing="0">
		    <tr>
		        <td valign="middle" height="28"  background="Images/wjdb/tabletop.jpg"><img src="Images/wjdb/arrow1.jpg">�ϼ��ļ��籨����</td>
		    </tr>
		    <tr>
		        <td >
		       
		          <!-- ���￪ʼ�����ļ��籨�Ĳ�ѯ -->
		       <% 
                 Class.forName("org.gjt.mm.mysql.Driver").newInstance();
                 Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/wjdb","root","123"); 

                 String StrPg = request.getParameter("pgcode");
            	if ((StrPg == null)||(StrPg.equals("")))
            	{
            		CurrPg = 1;
            	}
            	else
            	{
            		CurrPg = Integer.parseInt(StrPg);
            	}
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
            			CountPg = (CountR/PgSize);
            			if (CountR%PgSize>0)
            				CountPg++;
            			Rs.first();
            			if (CountR>0)
            			{
            			%>
            			    <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td bgcolor="#fffff"></td>
                            <td colspan="3" width="17%"><div align="center" class="word_white">���ĵ��ͷ</div></td>
                            <td colspan="3" width="17%"><div align="center" class="word_white">���ĵ��ͷ</div></td> 
                            <td width="8%"><div align="center" class="word_white">���ݷ���</div></td>
                            <td width="8%"><div align="center" class="word_white">����ʱ��</div></td>
                            <td ><div align="center" class="word_white">�ĵ����</div></td>
                            <% if((islog) && (((String)session.getAttribute("deptment")).equals("admin"))) {%>
                            <td colspan="2" align="center" class="word_white">����</td>
                            <% } %>
                            </tr>  
                            <%
            				Rs.absolute(CurrPg*PgSize-PgSize+1);
	            			while (i<PgSize && !Rs.isAfterLast())
            			    {     
  	                        %>
            			    <tr border="0" height="30"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#E1EDF9'">
            			    <td width="3" bgcolor="#fffff"><img  id="img1" src="Images/angle.gif" width="3" height="5" ></td>
                            <td height="30"  ><div align="center">
                            <%if ((Rs.getString("tdb")!=null) && (!Rs.getString("tdb").equals(""))) {%>
                            <%=Rs.getString("tdb")%>
                            <% } else {%> &nbsp; <% } %>
                            </div></td>
                            <td height="30" ><div align="center"> 
                            <%if ((Rs.getString("tdbnian")!=null) && (!Rs.getString("tdbnian").equals(""))) {%>
                            [<%=Rs.getString("tdbnian")%>]
                            <% } else {%> &nbsp; <% } %>
                            </div></td> 
                            <td height="30" ><div align="center">
                            <%if ((Rs.getString("tdbhao")!=null) && (!Rs.getString("tdbhao").equals(""))) {%>
                            <%=Rs.getString("tdbhao")%>��
                            <% } else {%> &nbsp; <% } %>
                            </div></td>
                            <td height="30"  ><div align="center">
                            <%if ((Rs.getString("tlj")!=null) && (!Rs.getString("tlj").equals(""))) {%>
                            <%=Rs.getString("tlj")%>
                            <% } else {%> &nbsp; <% } %>
                            </div></td>
                            <td height="26"  ><div align="center">
                            <%if ((Rs.getString("tljnian")!=null) && (!Rs.getString("tljnian").equals(""))) {%>
                            [<%=Rs.getString("tljnian")%>]
                            <% } else {%> &nbsp; <% } %>
                            </div></td>
                            <td height="30"  ><div align="center">
                            <%if ((Rs.getString("tljhao")!=null) && (!Rs.getString("tljhao").equals(""))) {%>
                            <%=Rs.getString("tljhao")%>��
                            <% } else {%> &nbsp; <% } %>
                            </div></td>
                            <td height="30"  >
                               <div align="center">
                               <% if (Rs.getString("bw").equals("1")) { %> �������� <%} %>
                               <% if (Rs.getString("bw").equals("2")) { %> ת��� <%} %>
                               <% if (Rs.getString("bw").equals("3")) { %> ���� <%} %>
                               <% if (Rs.getString("bw").equals("4")) { %> ���� <%} %>
                               <% if (Rs.getString("bw").equals("5")) { %> �����ƶ� <%} %>
                               <% if (Rs.getString("bw").equals("6")) { %> �����ƶ� <%} %>
                               <% if (Rs.getString("bw").equals("7")) { %> ������ <%} %>
                               <% if (Rs.getString("bw").equals("8")) { %> �ۺ�Ҫ�� <%} %>
                               </div>
                            </td>
                            <td height="30"  ><div align="center"><%=Rs.getString("rq")%></div></td> 
                            <td height="30" align="left" ><div >
                            <% String fpath=Rs.getString("filename");
                               if (tabname.equals("jswd")) { fpath="e:/jswd/"+fpath;}
                               if (tabname.equals("aqwd")) { fpath="e:/aqwd/"+fpath;}
                               if (tabname.equals("qtwd")) { fpath="e:/qtwd/"+fpath;}
                            %>
                               <a href="gzzd/download.jsp?path=<%=fpath%>" title="<%=Rs.getString("zy")%>"><%=Rs.getString("bt")%></a></div></td> 
                            <% if((islog) && (((String)session.getAttribute("deptment")).equals("admin"))) {%>
                            <td width="12" align="center" ><div >
                               <a href="gzzd/editwd.jsp?id=<%=Rs.getString("id")%>">
                               <img src="Images/edit.gif" width="12" height="12" border="0" ></a>
                               </div>
                            </td>
                            <td width="20" align="center" ><div>
 <a href="gzzd/gzzd.jsp?page=1&pgcode=<%=CurrPg%>&wdlb=<%=wdlb%>&tdb=<%=tdb%>&tdbnian=<%=tdbnian%>&tdbhao=<%=tdbhao%>&tlj=<%=tlj%>&tljnian=<%=tljnian%>&tljhao=<%=tljhao%>&bw=<%=bw%>&sjfrom=<%=sjfrom%>&sjto=<%=sjto%>&wenzi=<%=wenzi %>"
 onClick="Javascript:window.open('delwd.jsp?ID1=<%=Rs.getString("id")%>&ID2=<%=tabname%>','','width=519,height=155')">
                               
                               <img src="Images/del_file.gif" width="20" height="20" border="0" ></a>
                               </div>
                            </td>
                            
                               <%}%>
                            </tr>  
                           <%
					            Rs.next();
					            i++;
					    }
					 %>   </table> 
				 </td>
		    </tr>
		    <tr>
		          <td>
		          <!-- ��ʾҳ��� -->
		          
		  <table   bgcolor="#ffffff" align="center"  width="100%"> 
          <tr>
          <td nowrap class="word_blue" align="left"><form name="form2" method="post" action="gzzd/gzzd.jsp">[<%=CurrPg%>/<%=CountPg %>] ÿҳ30�� ��<%=CountR%>����¼&nbsp;&nbsp;&nbsp;&nbsp; ת����
            <input name="pgcode" type="text" size="3" >&nbsp;ҳ&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="1">
            <input name="wdlb" type="hidden" value="<%=wdlb%>">
            <input name="tdb" type="hidden" value="<%=tdb%>">
            <input name="tdbnian" type="hidden" value="<%=tdbnian%>">
            <input name="tdbhao" type="hidden" value="<%=tdbhao%>">
            <input name="tlj" type="hidden" value="<%=tlj%>">
            <input name="tljnian" type="hidden" value="<%=tljnian%>">
            <input name="tljhao" type="hidden" value="<%=tljhao%>">
            <input name="bw" type="hidden" value="<%=bw%>">
             <input name="sjfrom" type="hidden" value="<%=sjfrom%>">
             <input name="sjto" type="hidden" value="<%=sjto%>"">
             <input name="wenzi" type="hidden" value="<%=wenzi%>" >
             </form>
           </td>
           
          <td>
           <%if (CurrPg>1){%>
            <a href="gzzd/gzzd.jsp?page=1&pgcode=<%=CurrPg-1%>&wdlb=<%=wdlb%>&tdb=<%=tdb%>&tdbnian=<%=tdbnian%>&tdbhao=<%=tdbhao%>&tlj=<%=tlj%>&tljnian=<%=tljnian%>&tljhao=<%=tljhao%>&bw=<%=bw%>&sjfrom=<%=sjfrom%>&sjto=<%=sjto%>&wenzi=<%=wenzi %>">��һҳ</a> 
            <%
          	}
          %>
            <%if (CurrPg<CountPg){%>
            <a href="gzzd/gzzd.jsp?page=1&pgcode=<%=CurrPg+1%>&wdlb=<%=wdlb%>&tdb=<%=tdb%>&tdbnian=<%=tdbnian%>&tdbhao=<%=tdbhao%>&tlj=<%=tlj%>&tljnian=<%=tljnian%>&tljhao=<%=tljhao%>&bw=<%=bw%>&sjfrom=<%=sjfrom%>&sjto=<%=sjto%>&wenzi=<%=wenzi %>">��һҳ</a> 
            <%
          	}
          %>
            <a href="gzzd/gzzd.jsp?page=1&pgcode=<%=CountPg%>&wdlb=<%=wdlb%>&tdb=<%=tdb%>&tdbnian=<%=tdbnian%>&tdbhao=<%=tdbhao%>&tlj=<%=tlj%>&tljnian=<%=tljnian%>&tljhao=<%=tljhao%>&bw=<%=bw%>&sjfrom=<%=sjfrom%>&sjto=<%=sjto%>&wenzi=<%=wenzi %>">���һҳ</a>
            </td>
        </tr>
        </table><% 
				    }
		            }
                   catch (SQLException e)
            		{
            			out.println("δ�ҵ����������ĵ�!");
            		}
            		finally
            		{
            			Con.close();
            		}	
      }    %> 
		          </td>
		    </tr>
           </table>
		      
		    <td width="31"  valign="top" align="left"  bordercolor="#ffcccc">
		    <table width="100%"  height="133" border="0"   cellpadding="0" cellspacing="0">
		    <tr>
		        <td valign="top" width="11" height="133" ><img src="Images/wjdb/tableright.jpg"></td>
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
