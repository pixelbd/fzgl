<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:directive.page import="java.io.FileReader"/>
<jsp:directive.page import="java.io.FileWriter"/>
<jsp:directive.page import="java.io.File"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>main page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link href="Css/style.css" rel="stylesheet">
<style type="text/css">
    <!--
      .word_yellow {
	 	font-size: 9pt;
	  	color: #ffffff; 
	  	}
	  .word_blue{
	  font-size: 9pt;
	  	color: #363E67;
	  }
	  .word_gray{
	  font-size: 9pt;
	  	color: #CCCCCC;
	  }
	  .title{
	  	font-size: 14px;
		color: #000000;
		font-family:����;}
     INPUT.Style_button {
	  BORDER-RIGHT: #4E759C 1px solid; BORDER-TOP: #4E759C 1px solid; FONT-SIZE: 9pt; 
	  BACKGROUND: #EFEFEF; BORDER-LEFT: #4E759C 1px solid; COLOR: #4E759C; BORDER-BOTTOM: #4E759C 1px solid;HEIGHT: 20px;width: 60px
       }
.STYLE2 {color: #FFFFFF}
    -->  
     </style>  
    
<SCRIPT LANGUAGE="javaScript">

var bsYear;
var bsDate;
var bsWeek;
var arrLen=10;	//���鳤��
var sValue=0;	//���������
var dayiy=0;	//����ڼ���
var miy=0;	//�·ݵ��±�
var iyear=0;	//��ݱ��
var dayim=0;	//���µڼ���
var spd=86400;	//ÿ�������
var year1999="30;29;29;30;29;29;30;29;30;30;30;29";	//354
var year2000="30;30;29;29;30;29;29;30;29;30;30;29";	//354
var year2001="30;30;29;30;29;30;29;29;30;29;30;29;30";	//384
var year2002="30;30;29;30;29;30;29;29;30;29;30;29";	//354
var year2003="30;30;29;30;30;29;30;29;29;30;29;30";	//355
var year2004="29;30;29;30;30;29;30;29;30;29;30;29;30";	//384
var year2005="29;30;29;30;29;30;30;29;30;29;30;29";	//354
var year2006="30;29;30;29;30;30;29;29;30;30;29;29;30";
var year2007="30;29;30;29;30;30;29;29;30;30;29;29;30";
var year2008="30;29;30;29;30;30;29;29;30;30;29;29;30";
var month1999="����;����;����;����;����;����;����;����;����;ʮ��;ʮһ��;ʮ����";
var month2001="����;����;����;����;������;����;����;����;����;����;ʮ��;ʮһ��;ʮ����";
var month2004="����;����;�����;����;����;����;����;����;����;����;ʮ��;ʮһ��;ʮ����";
var month2006="����;����;����;����;����;����;����;������;����;����;ʮ��;ʮһ��;ʮ����";
var month2007="����;����;����;����;����;����;����;����;����;ʮ��;ʮһ��;ʮ����";
var month2008="����;����;����;����;����;����;����;������;������;����;����;ʮ��;ʮһ��;ʮ����";
var Dn="��һ;����;����;����;����;����;����;����;����;��ʮ;ʮһ;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;��ʮ;إһ;إ��;إ��;إ��;إ��;إ��;إ��;إ��;إ��;��ʮ";
var Ys=new Array(arrLen);
var Yn=new Array(arrLen); 

Ys[0]=919094400;Ys[1]=949680000;Ys[2]=980265600;
Ys[3]=1013443200;Ys[4]=1044028800;Ys[5]=1074700800;
Ys[6]=1107878400;Ys[7]=1138464000;
  
//ũ���������
Yn[0]="��î��";Yn[1]="������";Yn[2]="������";
Yn[3]="������";Yn[4]="��δ��";Yn[5]="������";
Yn[6]="������";Yn[7]="������";Yn[8]="������";Yn[9]="������";

var D=new Date();
var yy=D.getYear();
var mm=D.getMonth()+1;
var dd=D.getDate();
var ww=D.getDay();

if (ww==0) ww="<font color=RED>������</font>";
if (ww==1) ww="����һ";
if (ww==2) ww="���ڶ�";
if (ww==3) ww="������";
if (ww==4) ww="������";
if (ww==5) ww="������";
if (ww==6) ww="<font color=green>������</font>";
    ww=ww;
var ss=parseInt(D.getTime() / 1000);

if (yy<100) yy="19"+yy;

for (i=0;i<arrLen;i++)
if (ss>=Ys[i]) {
	iyear=i;
	sValue=ss-Ys[i];    //���������
	}
	
dayiy=parseInt(sValue/spd)+1;    //���������

var dpm=year1999;

if (iyear==1) dpm=year2000;
if (iyear==2) dpm=year2001;
if (iyear==3) dpm=year2002;
if (iyear==4) dpm=year2003;
if (iyear==5) dpm=year2004;
if (iyear==6) dpm=year2005;
if (iyear==7) dpm=year2006;
if (iyear==8) dpm=year2008;
if (iyear==9) dpm=year2009;

dpm=dpm.split(";");

var Mn=month1999;

if (iyear==2) Mn=month2001;
if (iyear==5) Mn=month2004;
if (iyear==7) Mn=month2008;

Mn=Mn.split(";");
Dn=Dn.split(";");
dayim=dayiy;

var total=new Array(13);

total[0]=parseInt(dpm[0]);
for (i=1;i<dpm.length-1;i++) total[i]=parseInt(dpm[i])+total[i-1];
for (i=dpm.length-1;i>0;i--)
if (dayim>total[i-1]){
	dayim=dayim-total[i-1];
	miy=i;
	}
	
bsWeek=ww;
bsDate=yy+"��"+mm+"��";
bsDate2=dd;
bsYear="ũ��"+Yn[iyear];
bsYear2=Mn[miy]+Dn[dayim-1];
if (ss>=Ys[7]||ss<Ys[0]) bsYear=Yn[7];
function time(){
document.write("<table border='1' style='font-size:9pt; font-family:Tahoma;' cellspacing='0' width='100' bordercolor='#DFE1EB'  height='103' cellpadding='0'");
document.write("<tr><td align='center' style='border: 0 solid #9DAFE4;padding-top:4px'><b><font style='font-family: Verdana;color:#0979C4'>"+bsDate+"</font><div style='font-family: Arial Black;font-size:18pt;color:#FF8040'>"+bsDate2+"</div><div style='FONT-SIZE: 10.5pt;color:#ff0000'>");
document.write(bsWeek+"</div>"+"</b><font color=#9342B5>");
document.write(bsYear+"</div>");
document.write("</table>");
}
</script>   
  </head>
<%!long count;%>
<%
File file=new File(getServletContext().getRealPath("count"));
FileReader reader=new FileReader(file);
char[] cbuf=new char[(int)file.length()];
reader.read(cbuf);
reader.close();
count=Long.valueOf(new String(cbuf)).longValue()+1;
FileWriter writer=new FileWriter(file);
writer.write(new String(count+""));
writer.close();
%> 
  <body class="body" bgcolor="#ffffff">
  <%
  boolean islog=false;
  
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
 %>
  <table width="871" border="0" cellpadding="-2" cellspacing="-2"   >
  <!-- ���� ���� �û����� -->
  <tr height="133">
      <td align="center" width="101" height="133" bgcolor="#ffffff">
      <table width="100%" border="0" cellpadding="-2" cellspacing="-2" >
      <tr height="30"><td bgcolor="#0075C0" align="center" class="tableBorder">
      <div ><img src="Images/wnl.gif" width="16" height="16">&nbsp;<a href="#" onClick="Javascript:window.open('a.htm','','width=780,height=450')" >�鿴������</a>&nbsp;</div></td>
      <tr height="103"><td  bgcolor="#ffffff" >
      <div ><SCRIPT LANGUAGE="JavaScript">time()</SCRIPT></div></td></tr>
      </table>
      </td>
      <td height="133" width="651" align="center" bgcolor="#ffffff" >
      <jsp:include page="weather.jsp"/>
      </td> 
      <td  width="119" height="133"  valign="top" align="center" bgcolor="#ffffff">
      <div>
      <table width="119" height="133" background="Images/userset.gif" class="tableBorder" cellpadding="-2" cellspacing="-2" bgcolor="#ffffff">
      <tr><td width="119" height="54" align="left" valign="bottom" ><marquee scrollamount="1" scrolldelay="7" direction="left" onMouseOver="this.stop();" onMouseOut="this.start();">
            <img src="Images/run.gif" border="0">��������ϵͳ�������û�ע��,Ҫ������û�����ϵͳ����Ա��ϵ,053-42564 ��־.
            </marquee></td></tr> 
      <tr> <% if (islog) { %>
          <td width="119" height="29" align="center" valign="center" ><img src="Images/thaw.gif" border="0">�û���<a href="updatekey.jsp" class="word_blue">�޸�����</a></td> <% }
          else { %> <td width="110" height="29" align="center" valign="center" class="word_gray"><img src="Images/thaw1.gif" border="0" >�û����޸�����</td> <% } %></tr>
      <tr> <% 
          if ((islog) && (((String)session.getAttribute("deptment")).equals("admin")||((String)session.getAttribute("zw")).equals("cjadmin")))
          { %><td width="119" height="25" align="center" valign="center" ><img src="Images/enforce.gif" border="0">ϵͳ��
          <a href="index.jsp" onClick="Javascript:window.open('insertuser.jsp?','','width=562,height=335')"  class="word_blue">����û�</a></td> <% }
          else { %> <td width="110" height="25" align="center" valign="center" class="word_gray"><img src="Images/enforce1.gif" border="0" >ϵͳ������û�</td> <% } %>
            </tr>
      <tr height="31"></tr>
      </table></div>
      </td>
      
  </tr>
  <tr>
      <td colspan="3" width="871" align="center" bgcolor="#ffffff">
      <hr width="99%" color="#F1F1F1">
      </td>
  </tr>
  </table>
  <!-- ���� ���� �û����� ���� -->
   <!-- ����֪ͨ -->
   <table class="tableBorder_LR" align="center" width="871" border="0" cellpadding="-2" cellspacing="-2" bgcolor="#FFFFFF">
   <tr>
      <td >
      <div>
      <jsp:include flush="true" page="notice.jsp"></jsp:include>
      </div>
      </td>
   </tr>

  </table>
  <!-- վ��ˢ��ͳ�� -->
  <%
        String backstr="";
		String strnum=Long.toString(count);
 		int length=strnum.length();
		int i=0;
 		while(i<length){
 			backstr+="<img src='Images\\num\\"+strnum.charAt(i)+".gif'/>";
 			i++;
 		}
		backstr="���Ǳ�վ�� "+backstr+" λ�ÿͣ�";
  
   %>
  <table width="871" border="0" cellpadding="-2" cellspacing="-2" bgcolor="#ffffff">
  <tr> <td height="25" align="center" valign="middle" class=word_blue ><%=backstr%></td></tr>
  </table>
  <!-- ͳ�ƽ��� -->
  </body>
</html>
