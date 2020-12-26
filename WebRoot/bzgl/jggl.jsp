<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  
    int CountPgbz = 0;
	int CurrPgbz = 0;
	int CountPgzg = 0;
	int CurrPgzg = 0;
	int PgSizebz = 20;
	int PgSizezg = 30;
	int CountR = 0;
	int CountRzg = 0;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body valign="top">
     <script language="javascript">
   function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
   }
   function changebz()
   { formbz.submit();}
   function changecj()
   { formcj.submit();}
   </script>
     <%
     request.setCharacterEncoding("gb2312");
      Class.forName("org.gjt.mm.mysql.Driver").newInstance();
      Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
      Statement Smts; 
      ResultSet Rs;
      Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
      
      
      String chej="";
      String str="";
       String bz="";
      String bzxxsql="";
      String zgxxsql="";
      String zgtab="";
      String zgtitle="班组管理";
      String sqlbz="";
      Boolean iszg=false;
     
      String submenu="1";
      if (request.getParameter("submenu")!=null) submenu=new String(request.getParameter("submenu"));
     
      String searchstr="";
      request.setCharacterEncoding("GB2312");
      if (request.getParameter("searchstr")!=null) searchstr=new String(request.getParameter("searchstr").getBytes("ISO-8859-1"));
      zgtitle=str+zgtitle;
      boolean islog=false;
      try
      { islog=((String)session.getAttribute("islog")).equals("1");
      }
      catch(Exception e)
      { //out.println(e);
      }
      
      if (islog) { 
      if  (((String)session.getAttribute("deptment")).equals("41")
             ||((String)session.getAttribute("deptment")).equals("42")
             ||((String)session.getAttribute("deptment")).equals("43")
             ||((String)session.getAttribute("deptment")).equals("44"))
      {   String userid=(String)session.getAttribute("userid");
          chej=(String)session.getAttribute("deptment"); 
          if (chej.equals("41")) zgtab="zhigongzz";
          if (chej.equals("42")) zgtab="zhigongys";
          if (chej.equals("43")) zgtab="zhigongly";
          if (chej.equals("44")) zgtab="zhigongzl";
          
          if (((String)session.getAttribute("zw")).equals("8")
             ||((String)session.getAttribute("zw")).equals("9")
             ||((String)session.getAttribute("zw")).equals("10")
             ||((String)session.getAttribute("zw")).equals(""))
          {
          iszg=true; 
            zgxxsql="select a.name,c.bz,a.sex,a.birthday,a.workcard,a.id,a.yibao,a.zw,a.zc,a.gz,a.mm,a.xl,a.xx,a.jg,a.zz from banzu as c,"+zgtab+" as a,(select * from "+ zgtab+" where id='"+userid+"') as b where a.bz=b.bz and c.code=b.bz";
          }else {sqlbz=" select bz,code from banzu where cj='"+chej+"' order by bz";
          }
      }
      else { 
       if (request.getParameter("cj")!=null)
       { chej=new String(request.getParameter("cj"));
         String chejcode="";
         if (chej.equals("zz")) chejcode="41";
         if (chej.equals("ys")) chejcode="42";
         if (chej.equals("ly")) chejcode="43";
         if (chej.equals("zl")) chejcode="44";
         zgtab="zhigong"+chej;
         if (request.getParameter("bz")!=null)
         { bz=new String(request.getParameter("bz"));
         sqlbz=" select bz,code from banzu where cj='"+chejcode+"' order by bz";
         zgxxsql="select a.name,c.bz,a.sex,a.birthday,a.workcard,a.id,a.yibao,a.zw,a.zc,a.gz,a.mm,a.xl,a.xx,a.jg,a.zz from banzu as c,"+zgtab+" as a  where a.bz='"+bz+"' and c.code=a.bz"; 
         }else{
         sqlbz=" select bz,code from banzu where cj='"+chejcode+"' order by bz";
         }
       }
      }
      }
      
      
      
      if (islog) 
      { 
      %>
      <table align="center"  valign="top" width="100%" cellpadding=-1 cellspacing=-1 bgcolor="#FFFFFF">
      <tr><td  width="100%">
          <div>
          <table align="center">
          <tr>
              <td  rowspan="3" align="right"><img  width="43" height="43" src="Images/rsgl.gif"></td>
              <td  height="20"></td>
          </tr>
          <tr><td  align="left"><font color="#800040">&nbsp;<%=str%>班组管理&nbsp;</font></td></tr>
          <tr><td  height="10"></td></tr>
          </table>
          </div>
          </td>
      </tr>

      <tr><td  width="100%" align="left">
      <div>
      <table width="100%">
      <tr>  <%
      if( (!((String)session.getAttribute("deptment")).equals("41"))
             &&(!((String)session.getAttribute("deptment")).equals("42"))
             &&(!((String)session.getAttribute("deptment")).equals("43"))
             &&( !((String)session.getAttribute("deptment")).equals("44")) )
      { %>
            <td  height="30" width="40%" class="style1" align="right"></td>
            <td> <form ACTION="bzgl/bzgl.jsp" METHOD="POST" name="formcj">
                 <select name="cj" class="Sytle_select" onchange="changecj()">
                 <option value="" >请选择检修车间&nbsp;</option>
                  <option value="zz" <%if (chej.equals("zz"))  out.print("selected");%>>郑州检修车间&nbsp;</option>
                  <option value="ys" <%if (chej.equals("ys"))  out.print("selected");%>>月山检修车间&nbsp;</option>
                  <option value="ly" <%if (chej.equals("ly"))  out.print("selected");%>>洛阳检修车间&nbsp;</option>
                  <option value="zl" <%if (chej.equals("zl"))  out.print("selected");%>>郑州轮轴车间&nbsp;</option>
                </select></form> 
            </td>
       <% } %>
     <% if (!iszg)  {%>
            <td width="60%" class="style1" >  <form ACTION="bzgl/bzgl.jsp" METHOD="POST" name="formbz">
                 <input type="hidden" name="cj" value="<%=chej %>">
                 <input name="submenu" type="hidden" value="<%=submenu %>">
                 
                 <select name="bz" class="Sytle_select" onchange="changebz()">
                 <option value="" >请选择<%=str%>车间班组&nbsp;</option>
                  <%    
       
       if (Con!= null)
       {
           try
           {
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
      <option  <%if (bz.equals(Rs.getString("code"))) out.print("selected"); %> value="<%=Rs.getString("code")%>"><%=Rs.getString("bz")%>&nbsp;</option>
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
       }
       }
	%>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
      </td>
      </tr>
           
      </table>
      </div>
      </td></tr>
     
      <tr><td width="100%" bgcolor="#6699CC" height="28">
          <!-- 功能菜单 -->
          <div>
          <table align="left"  valign="top"  cellpadding=-1 cellspacing=-1>
           <tr >
            <td><img  width="20" height="20" src="Images/GArrow.gif"></td>
            <td  align="center" height="26" bgcolor="#6699CC" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#6699CC'">
            &nbsp;<a href="bzgl/bzgl.jsp?page=1&submenu=1&cj=<%=chej%>&bz=<%=bz%>">班组人员信息</a>&nbsp;
            </td>
            <td style="color:#ffffff;">|</td>
            <td  align="center" height="26" bgcolor="#6699CC" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#6699CC'">
            &nbsp;<a href="bzgl/bzgl.jsp?page=1&submenu=2&cj=<%=chej%>">班组考勤信息</a>&nbsp;
            </td>
           </tr>
          </table>
          </div>
          </td>
     </tr>
      </table>
      <%    } %>
      
      <% if (submenu.equals("1")) { %>
      <table align="center"  width="100%"   cellpadding=-2 cellspacing=-2 bgcolor="#FFFFFF">
      <tr>
         <td width="100%"   align="left" >
         <table width="100%" cellpadding=-2 cellspacing=-2>
         <tr>
             <td colspan="2" width="100%" height="30" bgcolor="#FFEF99">
             <img  width="16" height="16" src="Images/enter.gif"><font color="#374295">&nbsp;<%=str%>班组职工信息&nbsp;</font>
             </td>
         </tr>
         <tr>
         <form action="bzgl/bzgl.jsp" method="post" name="formzgsearch1">
             <td width="80%" align="center"><font color="#4E759C">职工查询:</font>
               <input name="searchstr" type="text" size="20" <%if (!searchstr.equals("")) { %>value="<%=searchstr%>" <% } %>>
               <input name="page" type="hidden" value="1">
               <input name="submenu" type="hidden" value="1">
               <input name="cj"  type="hidden" value="<%=chej%>">
               <input name="bz"  type="hidden" value="<%=bz%>">
               <input type="submit" name="Submit" value=" 查 询 " class="Style_btn">
             </td>
             </form>
             <td valign="top" align="left" width="20%">
             <!-- 
             <img   width="16" height="16" src="Images/excel.jpg" >
             <a href="bzgl/bzgl.jsp?page=1&submenu=1&bz=<%=bz %>cj=<%=chej%>&searchstr=<%=searchstr%>" onClick="outExcel();">导出Excel编辑</a>
             -->
             </td>
             
         </tr>
         </table>
         </td>
      </tr>
      <tr>
          <td>
          <div>
    <script language="javascript">
    function outExcel(){
	var table=document.all.zgtab;
	row=table.rows.length;
	column=table.rows(1).cells.length;
	var excelapp=new ActiveXObject("Excel.Application");
	excelapp.visible=true;
	objBook=excelapp.Workbooks.Add(); //添加新的工作簿
	var objSheet = objBook.ActiveSheet;

	title=objSheet.Range("H1").MergeArea;  //合并单元格
	title.Cells(1,1).Value ="<%=zgtitle%>";
	title.Cells(1,1).Font.Size =16;
	
	for(i=1;i<row+1;i++){
		for(j=0;j<column;j++){
		  objSheet.Cells(i+1,j+1).value=table.rows(i-1).cells(j).innerHTML.replace("&nbsp;","");
		}
	}

	excelapp.UserControl = true;
    }
   </script>
          <!-- 这里开始进行职工信息的查询 -->
          <% 
          String StrPgzg = request.getParameter("pgcodezg");
          
            	if ((StrPgzg == null)||(StrPgzg.equals("")))
            	{
            		CurrPgzg = 1;
            	}
            	else
            	{
            		CurrPgzg = Integer.parseInt(StrPgzg);
            	}
                Statement Smtszg; 
                ResultSet Rszg;
                
                if (Con!= null)
            	{
            		try
            		{
            		
						Smtszg = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
                        Rszg = Smtszg.executeQuery(zgxxsql);
            			
                        Rszg.last();
                        int j = 0;
            			CountRzg = Rszg.getRow();
            			CountPgzg = (CountRzg/PgSizezg);
            			if (CountRzg%PgSizezg>0)
            				CountPgzg++;
            			Rszg.first();
            			if (CountRzg>0)
            			{
            			%><table id="zgtab" width="98%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="5%" align="center" class="word_white">序号</td>
                            <td width="10%" align="center" class="word_white">姓名</td>
                            <td width="5%" align="center" class="word_white">性别</td>
                            <td width="10%" align="center" class="word_white">出生日期</td>
                            <td width="10%" align="center" class="word_white">身份证号</td> 
                            <td width="10%" align="center" class="word_white">工作证号</td>
                            <td style="display:none;">医保号</td>
                            <td width="10%" align="center" class="word_white">班组</td>
                            <td width="10%" align="center" class="word_white">职务</td>
                            <td style="display:none;">职称</td>
                            <td width="10%" align="center" class="word_white">工种</td>
                            <td width="10%" align="center" class="word_white">政治面貌</td>
                            <td width="10%" align="center" class="word_white">学历</td>
                            <td style="display:none;">毕业院校</td>
                            <td style="display:none;">籍贯</td>
                            <td style="display:none;">住址</td>
                            </tr>  
                            <%
            				Rszg.absolute(CurrPgzg*PgSizezg-PgSizezg+1);
	            			while (j<PgSizezg && !Rszg.isAfterLast())
            			    {     
  	                        %>
  	                        <tr border="0" height="30"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9"  onMouseOver="this.style.cursor='hand';this.style.background='#FDFCD9'" onMouseOut="this.style.background='#E1EDF9'">
            			    <a href="bzgl/bzgl.jsp?page=1&submenu=1&cj=<%=chej%>&bz=<%=bz%>&searchstr=<%=searchstr%>&pgcodezg=<%=CurrPgzg%>"
  	                         onClick="Javascript:window.open('showzg.jsp?cj=<%=chej%>&id=<%=Rszg.getString("id")%>','','width=580,height=490')" title="点击看详情">
            			    <td  align="center"><%=(CurrPgzg-1)*PgSizezg+j+1%></td>
                            <td align="center"><%=Rszg.getString("name")%></td>
                            <td  align="center" ><%=Rszg.getString("sex")%></td>
                            <td  align="center" ><%=Rszg.getString("birthday")%></td>
                            <td  align="center" >
                           <% if (((String)session.getAttribute("zw")).equals("8")) { %>
                            [<%=Rszg.getString("id")%>] 
                            <% } else { %><font color="#cccccc">工长可见</font><%} %></td>
                            <td  align="center" >[<%=Rszg.getString("workcard")%>]</td>
                            <td style="display:none;"><%=Rszg.getString("yibao")%></td>
                            <td  align="center" ><%=Rszg.getString("bz")%></td>
                            <td  align="center" ><%=Rszg.getString("zw")%></td>
                            <td style="display:none;"><%=Rszg.getString("zc")%></td>
                            <td  align="center" ><%=Rszg.getString("gz")%></td>
                            <td  align="center" ><%=Rszg.getString("mm")%></td>
                            <td align="center" ><%=Rszg.getString("xl")%></td>
                            <td style="display:none;"><%=Rszg.getString("xx")%></td>
                            <td style="display:none;"><%=Rszg.getString("jg")%></td>
                            <td style="display:none;"><%=Rszg.getString("zz")%></td>
                           </a></tr>
                            <%
					            Rszg.next();
					            j++;
					    }
					 %>  
		      </table>    
		  </div>
		  </td>
	</tr>
	<!-- 显示页码表 -->
	<tr>
	     <td>
		 <div>
		  <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" >
          <tr>
          <td nowrap class="word_blue" align="left">
          <form name="formzg1" method="post" action="bzgl/bzgl.jsp">[<%=CurrPgzg%>/<%=CountPgzg %>] 每页30条 共<%=CountRzg%>条记录&nbsp;&nbsp;&nbsp;&nbsp; 转到第
            <input name="pgcodezg" type="text" size="3" >&nbsp;页&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="1">
            <input name="submenu" type="hidden" value="1">
            <input name="cj" type="hidden" value="<%=chej%>">
            </form>
          </td>
          <td>
          <a href="bzgl/bzgl.jsp?page=1&submenu=1&cj=<%=chej%>&bz=<%=bz%>&searchstr=<%=searchstr%>&pgcodezg=1">首页</a>
           <%if (CurrPgzg>1){%>
            <a href="bzgl/bzgl.jsp?page=1&submenu=1&cj=<%=chej%>&bz=<%=bz%>&searchstr=<%=searchstr%>&pgcodezg=<%=CurrPgzg-1%>">上一页</a> 
            <% }  %>
            <%if (CurrPgzg<CountPgzg){%>
            <a href="bzgl/bzgl.jsp?page=1&submenu=1&cj=<%=chej%>&bz=<%=bz%>&searchstr=<%=searchstr%>&pgcodezg=<%=CurrPgzg+1%>">下一页</a> 
            <% } %>
            <a href="bzgl/bzgl.jsp?page=1&submenu=1&cj=<%=chej%>&bz=<%=bz%>&searchstr=<%=searchstr%>&pgcodezg=<%=CountPgzg%>">最后一页</a>
          </td>
          </tr>
        </table>
        </div>
          </td>
      </tr><% 
				    }
		            }
                   catch (SQLException e)
            		{
            			out.println("未找到符合条件职工信息!");
            		}
            		finally
            		{
            			Con.close();
            		}	
      }    
     %>
      </table>
      <% } %>

  </body>
</html>
