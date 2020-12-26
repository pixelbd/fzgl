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
    
    <title>文件电报管理</title>
    
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
   
    if (wdlb.equals("1")) { str="技术文件电报"; tabname="jswd"; }
    if (wdlb.equals("2")) { str="安全文件电报"; tabname="aqwd"; }
    if (wdlb.equals("3")) { str="其他文件电报"; tabname="qtwd"; }

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
                  <tr><td width="100" align="center" height="30"  class="word_white" background="Images/wjdb/jsfw.gif">检索范围</td>
                  <tr align="center"><td height="30" valign="middle" class="word_blue"><%=str%></td><tr>   
                  </tr>
              </table>
          </td>
          <td align="center" border="0"   cellpadding="0" cellspacing="0"  >
                  <table width="100%" align="center"  border="0">
                  <tr><td width="100%" align="center"  class="word_orange">
                       <div>
                      <form action="gzzd/gzzd.jsp" method="post" name="formjs" ><strong>查&nbsp;&nbsp;询&nbsp;&nbsp;条&nbsp;&nbsp;件</strong>
                      <table>
                      <tr>
                          <td height="28">文电类别:&nbsp;</td>
                          <td><input type="radio" name="wdlb" value="1" <%if (wdlb.equals("1")) out.print("checked"); %>> 技术</td>
                          <td><input type="radio" name="wdlb" value="2" <%if (wdlb.equals("2")) out.print("checked"); %>> 安全</td>
                          <td><input type="radio" name="wdlb" value="3" <%if (wdlb.equals("3")) out.print("checked"); %>> 其他</td>
                          <td></td>
                          <td></td>
                      </tr>
                      <tr> 
                          <td colspan="5" height="28">文件号头:&nbsp;&nbsp;&nbsp;部&nbsp;&nbsp;&nbsp;
                          <select name="tdb" class="Sytle_select" >
                          <option value="" <%if (tdb.equals("")) { out.print("selected"); }%>>全部</option>
                          <option value="运装货车" <%if (tdb.equals("运装货车")) out.print("selected");%>>运装货车</option>
                          <option value="运装货车电" <%if (tdb.equals("运装货车电")) out.print("selected");%>>运装货车电</option>
                          <option value="运装管验" <%if (tdb.equals("运装管验")) out.print("selected");%>>运装管验</option>
                          <option value="运装管验电" <%if (tdb.equals("运装管验电")) out.print("selected");%>>运装管验电</option>
                          <option value="运营货管电" <%if (tdb.equals("运营货管电")) out.print("selected");%>>运营货管电</option>
                          <option value="铁科技函" <%if (tdb.equals("铁科技函")) out.print("selected");%>>铁科技函</option>
                          <option value="铁运" <%if (tdb.equals("铁运")) out.print("selected");%>>铁运</option>
                          <option value="铁安监电" <%if (tdb.equals("铁安监电")) out.print("selected");%>>铁安监电</option>
                          </select>&nbsp;&nbsp;&nbsp;
                          <input name="tdbnian" type="text" class="Sytle_text"  size="10">&nbsp;年&nbsp;&nbsp;&nbsp;
                          <input name="tdbhao" type="text" class="Sytle_text"  size="10">&nbsp;号
                          </td>
                      </tr>
                      <tr>
                          <td colspan="5" height="28">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;局&nbsp;&nbsp;&nbsp;
                          <select name="tlj" class="Sytle_select" >
                          <option value="" <%if (tlj.equals("")) out.print("selected");%>>全部&nbsp;&nbsp;&nbsp;</option>
                          <option value="郑辆检" <%if (tlj.equals("郑辆检")) out.print("selected");%>>郑辆检&nbsp;&nbsp;</option>
                          <option value="郑辆检电" <%if (tlj.equals("郑辆检电")) out.print("selected");%>>郑辆检电&nbsp;</option>
                          <option value="郑辆运电" <%if (tlj.equals("郑辆运电")) out.print("selected");%>>郑辆运电&nbsp;</option>
                          <option value="郑辆综电" <%if (tlj.equals("郑辆综电")) out.print("selected");%>>郑辆综电&nbsp;</option>
                          <option value="郑电安" <%if (tlj.equals("郑电安")) out.print("selected");%>>郑电安&nbsp;</option>
                          <option value="郑辆检函" <%if (tlj.equals("郑辆检函")) out.print("selected");%>>郑辆检函&nbsp;</option>
                          <option value="郑辆运函" <%if (tlj.equals("郑辆运函")) out.print("selected");%>>郑辆运函&nbsp;</option>
                          <option value="郑辆办函" <%if (tlj.equals("郑辆办函")) out.print("selected");%>>郑辆办函&nbsp;</option>
                          <option value="郑局车验函" <%if (tlj.equals("郑局车验函")) out.print("selected");%>>郑局车验函</option>
                          <option value="郑铁辆函" <%if (tlj.equals("郑铁辆函")) out.print("selected");%>>郑铁辆函&nbsp;</option>
                          <option value="郑铁财函" <%if (tlj.equals("郑铁财函")) out.print("selected");%>>郑铁财函&nbsp;</option>
                          <option value="郑铁货" <%if (tlj.equals("郑铁货")) out.print("selected");%>>郑铁货&nbsp;</option>
                          <option value="郑铁办" <%if (tlj.equals("郑铁办")) out.print("selected");%>>郑铁办&nbsp;</option>
                          <option value="郑铁技" <%if (tlj.equals("郑铁技")) out.print("selected");%>>郑铁技&nbsp;</option>
                          
                          </select>&nbsp;&nbsp;&nbsp;
                          <input name="tljnian" type="text" class="Sytle_text"  size="10">&nbsp;年&nbsp;&nbsp;&nbsp;
                          <input name="tljhao" type="text" class="Sytle_text"  size="10">&nbsp;号
                          </td>
                      </tr>
                      <tr>
                          <td height="28" align="left">涉及内容:&nbsp;</td>
                          <td><input type="radio" name="bw" value="1" <%if (bw.equals("1")) out.print("checked"); %>> 车体、底体架</td>
                          <td><input type="radio" name="bw" value="2" <%if (bw.equals("2")) out.print("checked"); %>> 转向架</td>
                          <td><input type="radio" name="bw" value="3" <%if (bw.equals("3")) out.print("checked"); %>> 轮轴</td>
                          <td><input type="radio" name="bw" value="4" <%if (bw.equals("4")) out.print("checked"); %>> 钩缓</td>
                          <TD><input type="radio" name="bw" value="5" <%if (bw.equals("5")) out.print("checked"); %>> 基础制动</td>
                      </tr>
                      <tr><td height="28">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                          
                          <td><input type="radio" name="bw" value="6" <%if (bw.equals("6")) out.print("checked"); %>> 空气制动</td>
                          <td><input type="radio" name="bw" value="7" <%if (bw.equals("7")) out.print("checked"); %>> 油漆标记</td>
                          <td> <input type="radio" name="bw" value="8" <%if (bw.equals("8")) out.print("checked"); %>> 技术综合</td>
                          <td> <input type="radio" name="bw" value="8" <%if (bw.equals("9")) out.print("checked"); %>> 事故通报</td>
                          <TD colspan="4"><input type="radio" name="bw" value="" <%if (bw.equals("")) out.print("checked"); %>> 全部</td>
                          
                      </tr>
                      
                      <tr><td colspan="5" height="28">收文时间:&nbsp;&nbsp;&nbsp;从 &nbsp;
                           <input name="sjfrom" type="text" class="Sytle_text"  size="15" onDBLClick="loadCalendar(this)">&nbsp;&nbsp;&nbsp;到 &nbsp;
                           <input name="sjto" type="text" class="Sytle_text"  size="15" onDBLClick="loadCalendar(this)"></td>
                      </tr>
                      <tr><td colspan="5" height="28">模糊查询:&nbsp;&nbsp;&nbsp;标题或摘要所含文字： &nbsp;
                           <input name="wenzi" type="text" class="Sytle_text"  size="45">&nbsp;&nbsp;&nbsp; &nbsp;</td>
                           
                      </tr>
                      <tr><td colspan="5" height="28" align="center">
                           <input name="Button1" type="submit" class="Style_longbutton" value="查&nbsp;&nbsp;&nbsp;&nbsp;询" >
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
            <a href="gzzd/gzzd.jsp?page=1&pgcode=<%=CurrPg%>&wdlb=<%=wdlb%>&tdb=<%=tdb%>&tdbnian=<%=tdbnian%>&tdbhao=<%=tdbhao%>&tlj=<%=tlj%>&tljnian=<%=tljnian%>&tljhao=<%=tljhao%>&bw=<%=bw%>&sjfrom=<%=sjfrom%>&sjto=<%=sjto%>&wenzi=<%=wenzi %>"  onClick="Javascript:window.open('addwd.jsp','','width=620,height=720')">添加文件电报</a>
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
		        <td valign="middle" height="28"  background="Images/wjdb/tabletop.jpg"><img src="Images/wjdb/arrow1.jpg">上级文件电报检索</td>
		    </tr>
		    <tr>
		        <td >
		       
		          <!-- 这里开始进行文件电报的查询 -->
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
                            <td colspan="3" width="17%"><div align="center" class="word_white">部文电号头</div></td>
                            <td colspan="3" width="17%"><div align="center" class="word_white">局文电号头</div></td> 
                            <td width="8%"><div align="center" class="word_white">内容分类</div></td>
                            <td width="8%"><div align="center" class="word_white">收文时间</div></td>
                            <td ><div align="center" class="word_white">文电标题</div></td>
                            <% if((islog) && (((String)session.getAttribute("deptment")).equals("admin"))) {%>
                            <td colspan="2" align="center" class="word_white">操作</td>
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
                            <%=Rs.getString("tdbhao")%>号
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
                            <%=Rs.getString("tljhao")%>号
                            <% } else {%> &nbsp; <% } %>
                            </div></td>
                            <td height="30"  >
                               <div align="center">
                               <% if (Rs.getString("bw").equals("1")) { %> 车体底体架 <%} %>
                               <% if (Rs.getString("bw").equals("2")) { %> 转向架 <%} %>
                               <% if (Rs.getString("bw").equals("3")) { %> 轮轴 <%} %>
                               <% if (Rs.getString("bw").equals("4")) { %> 钩缓 <%} %>
                               <% if (Rs.getString("bw").equals("5")) { %> 基础制动 <%} %>
                               <% if (Rs.getString("bw").equals("6")) { %> 空气制动 <%} %>
                               <% if (Rs.getString("bw").equals("7")) { %> 油漆标记 <%} %>
                               <% if (Rs.getString("bw").equals("8")) { %> 综合要求 <%} %>
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
		          <!-- 显示页码表 -->
		          
		  <table   bgcolor="#ffffff" align="center"  width="100%"> 
          <tr>
          <td nowrap class="word_blue" align="left"><form name="form2" method="post" action="gzzd/gzzd.jsp">[<%=CurrPg%>/<%=CountPg %>] 每页30条 共<%=CountR%>条记录&nbsp;&nbsp;&nbsp;&nbsp; 转到第
            <input name="pgcode" type="text" size="3" >&nbsp;页&nbsp;&nbsp;
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
            <a href="gzzd/gzzd.jsp?page=1&pgcode=<%=CurrPg-1%>&wdlb=<%=wdlb%>&tdb=<%=tdb%>&tdbnian=<%=tdbnian%>&tdbhao=<%=tdbhao%>&tlj=<%=tlj%>&tljnian=<%=tljnian%>&tljhao=<%=tljhao%>&bw=<%=bw%>&sjfrom=<%=sjfrom%>&sjto=<%=sjto%>&wenzi=<%=wenzi %>">上一页</a> 
            <%
          	}
          %>
            <%if (CurrPg<CountPg){%>
            <a href="gzzd/gzzd.jsp?page=1&pgcode=<%=CurrPg+1%>&wdlb=<%=wdlb%>&tdb=<%=tdb%>&tdbnian=<%=tdbnian%>&tdbhao=<%=tdbhao%>&tlj=<%=tlj%>&tljnian=<%=tljnian%>&tljhao=<%=tljhao%>&bw=<%=bw%>&sjfrom=<%=sjfrom%>&sjto=<%=sjto%>&wenzi=<%=wenzi %>">下一页</a> 
            <%
          	}
          %>
            <a href="gzzd/gzzd.jsp?page=1&pgcode=<%=CountPg%>&wdlb=<%=wdlb%>&tdb=<%=tdb%>&tdbnian=<%=tdbnian%>&tdbhao=<%=tdbhao%>&tlj=<%=tlj%>&tljnian=<%=tljnian%>&tljhao=<%=tljhao%>&bw=<%=bw%>&sjfrom=<%=sjfrom%>&sjto=<%=sjto%>&wenzi=<%=wenzi %>">最后一页</a>
            </td>
        </tr>
        </table><% 
				    }
		            }
                   catch (SQLException e)
            		{
            			out.println("未找到符合条件文电!");
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
