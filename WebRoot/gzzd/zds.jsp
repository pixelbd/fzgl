<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'zds.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <LINK href="Css/gzzdstyle.css" type=text/css rel=stylesheet> 
  <body>
  <script language="javascript">
ShowTR(img0,OpenRep0)  //���õ�1�����Ϊչ��״̬
function ShowTR(objImg,objTr){
	if(objTr.style.display == ""){
		objTr.style.display = "none";
		objImg.src = "Images/jia.gif";
	}else{
		objTr.style.display = "";
		objImg.src = "Images/jian.gif";
	}
}
</script>
<%
 // String zds[]={"����","����","70t����������","X2H��X2Kȫ������","DL1�ͳ�����","תK2���ٸ���","8B/8AB���Ƹ���"};
  String cdxzds[]={"ת���","�ֳ�" ,"�ƶ���","�ƶ���","���","����","����"};

  //����ָ������Ŀ
  int cx[]={29,15,14,10,11,23,10};
  String cxsubmenu[][]={
                  {"ת�����ϴ","ת��ֽܷ�","�����̡�����ĥ���̷ֽ⡢��װ","���ذ��ֽ⡢���","�����ƶ�װ�÷ֽ�","��ɡ�бШ�ֽ⡢���","������ֽ⡢���",
                   "�ڶ�װ�÷ֽ⡢���","ת��ܷ�ת���","�󲿼��������","�󲿼�̽��","����֧��װ�÷ֽ⡢���","����֧��װ��̽��","����֧��װ����װ",
                   "ҡ�����","ҡ��бШĦ����ĥ�İ����","��ܼ���","�������ĥ�İ����","����ĥ�İ����","���ذ���װ","���Գ���װ",
                   "ת�����λ���","�����ƶ�װ����װ","�������Գзֽ����","���Գм��","�������������","ת�����װ�����","����ĥ���̼��"
,"ҡ����̽��"},
                  {"�����������","�׼ܼ��������","�׼ܼ���","�׼ܸ����������","��������","�ֳ���������װ�÷ֽ⡢���ޡ���װ","�ֳ��ƶ�װ�÷ֽ⡢���ޡ���װ",
                   "�޳���ϴ","�޳��ֽ�","�޳����壨���壩�������������","���弰������ˮѹ����","���ű�ǩ��������","�ֳ�������","�ֳ����","��������"},
                  {"�㲿���ⲿ����","���ⷧ����ȫ������","�ƶ�����ܳɼ�鼰����","����׼��޼�����","���ż��޼�����","��������������","120��120-1�Ϳ��Ʒ�����",
                   "103�ͷ��䷧����","GK����ͨ������","���س��Զ�����װ�ü���","120��120-1���Ʒ�����","103�ͷ��䷧��705��΢������̨�ϵ�����","GK����701��̨�ϵ�����",
                   "���س��Զ�����װ��������̨�ϵ�����"},
                  {"�ƶ����������","�ƶ�����ǰ���Ͳ���","�ƶ�������","�ƶ�����ȫ��������","�ƶ���֧����װ","�ƶ���������̽��","�ƶ���բ���л��ӹ�","�ƶ�����������",
                   "�ƶ���������","���ʽ�ƶ�������"},
                  {"�ƶ��ܸˡ����ˡ��̶�֧�㡢�ƶ�Բ������","���̼���ǰ���","�����ֹ�����","�����Զ�����","�����ȴ���","���̻��ӹ�","���̼��","�������������",
                   "�����������","��������ŷ�̽��","�����̷ֽ���װ"},
                  {"��������װ�ó��׷ֽ�","�����ֽ�","��������װ����������","��������װ���㲿���������","��������","��β������","����������","����������","��β����",
                   "����̽��","��β��̽��","����̽��","����������β��̽��","��������","���ຸ��","�����ȴ���","������ӹ�","��ǻ�ڲ��������","�����ס���������ϴ�ס�����",
                   "�Ӱ����","�Ӱ���ӹ�","������װ","��������װ�ó�����װ"},
                  {"�ֶ�����","�����ж","�ֶԳ���","�ֶԴŷ�̽��","΢����̽","�ֶԳ�����̽","̤�����","���ѹװ","���Ħ��","�ֶ�֧��"}
                  };
  //����ָ������Ŀ
  int dx[]={28,21,14,5,3,18,15};
  String dxsubmenu[][]={
                  {"ת�����ϴ","�����̡�����ĥ���̷ֽ⡢��װ","���ذ��ֽ⡢���","���Գм��","�����ƶ�װ�÷ֽ�","������ֽ⡢���","��ɡ�бШ�ֽ⡢���",
                   "�ڶ�װ�÷ֽ⡢���","ת��ܷ�ת���","ҡ���տס���ˮ�״ŷ�̽��","����֧��װ�÷ֽ⡢���","����֧��װ��̽��",
                   "ҡ�����","��ܼ���","ҡ��бШĦ����ĥ�İ����","�������ĥ�İ����","ת�����װ�����","ҡ����̽��","��ܻ���ĥ�İ����",
				   "���ذ���װ","���Գ���װ", "ת�����λ���","�����ƶ�װ����װ","�������Գзֽ����","ת��ֽܷ�","�������װ","����ĥ���̼��","ҡ����̽��"},
                  {"���䳵","�׼ܼ���","�������","�׼ܺͳ������","�׼ܸ����������","��������","������íװ","���Գ���ɼ���",
				  "�����в��ż��²�����ɼ���","�޳���ϴ","�޳����壨���壩������������","�޳��ֽ�","���塢�����ס����¹�·ˮѹ����",
				  "��í����","��װ������װ�ü���","���ű�ǩ��������","�ֳ�������","�ֳ��ƶ�װ�÷ֽ⡢���ޡ���װ","�ֳ���������װ�÷ֽ���װ",
				  "��������","�ֳ����",},
                  {"�㲿���ⲿ����","���ⷧ����ȫ������","�ƶ�����ܳɼ�鼰����","����׼��޼�����","���ż��޼�����","��������������","120��120-1�Ϳ��Ʒ�����","103�ͷ��䷧����",
                   "GK����ͨ������","���س��Զ�����װ�ü���","120��120-1���Ʒ�����","103�ͷ��䷧��705��΢������̨�ϵ�����","GK����701��̨�ϵ�����",
                   "���س��Զ�����װ��������̨�ϵ�����"},
                  {"�ƶ�����ǰ���Ͳ���","�ƶ���̽�˼��","�ƶ�����ȫ���������ƶ������ޡ����޼���װ","�ƶ�����������","�ƶ����޺��鼰���Ϳ��"},
                  {"JC�͵����Գм���","JC-1�͵����Գ���װ","�ƶ��ܸˡ����ˡ��̶�֧�㡢�ƶ�Բ������"},
                  {"��������װ�ó��׷ֽ�(����������)","�����ֽ�","��������","������װ","����������","��β�����","��β��̽��","����̽��",
				  "����������β��̽��","���ຸ��","�����ȴ���","������ӹ�","�����ס���������ϳ�ס�����","�԰����","�԰���ӹ�","��������װ������������",
				  "��ǻ�ڲ��������","�ֳ���������װ�÷ֽ���װ"},
                  {"�ֶ�����","������","�����ۼ��","�����ж","�ֶԳ���","�ֶԴŷ�̽��","΢����̽","�ֶԳ�����̽","̤�����","���ѹװ",
				  "���ĥ��","�ֶ�֧��","������̽��������̽ͷ���ܲ���","�����˨��ϴ�����","���ǰ�ǡ�����ϴ�����"}
                  };
  //70t��������ָ������Ŀ                
  String hc70tzds[]={"ת���","�ֳ�","����","����װ��","�ƶ���"};
  int hc70t[]={21,14,15,1,5};
  String hc70tmenu[][]={
                  {"ת�����ϴ","ת��ֽܷ�","���ذ���תK6�������𽺵����","�����̡�����ĥ���̡�����������","ҡ���ɣ����񵯻ɣ���⼰ѡ��",
                   "תK6��ת��ܽ���֧��װ�ü���","תK5��ת���ҡ��װ�ü���","ҡ����̽��","תK5��ת��ܵ���ҡ��������","бШ���",
                   "ҡ�������ĥ�İ����","תK5ת��ܼ���","תK��ת��ܼ���","����ĥ�İ����","��������װ",
                   "���ذ���װ","�����Գм���","�������ĥ�İ���޼���װ","�����ƶ�װ����װ","�������ɼ���",
                   "ת�����װ�����"},
                  {"�������","�׼ܸ������ǰ��������޼���ǿ","���塢�׼ܸ���������","NSW�����ƶ�������","���������Ϳ",
                   "�������","������íװ","17�ͳ�������װ�÷ֽ⡢���ޡ���װ","�ֳ��ƶ�װ�÷ֽ⡢���ޡ���װ","��������",
                   "���䳵","�޳�ϴˢ","���弰�����������","���弰������ˮѹ����"},
                  {"17�ͳ�������װ�÷ֽ�","17�ͳ������ࡢ��β�򡢹�ǻ�ڲ�����������","17�ͳ����������","17�͹�β��̽��","16�͹���̽��",
                   "17�ͳ�����������β��̽��","16�͹������","17�͹�β�����","17�ͳ�����������β������","17�͹�ǻ�ڲ��������",
                   "MT-2����������","17�ͳ����Ӱ����","17�ͳ��������������","17�ͳ�����װ","17�ͳ�����̬����"},
                  {"�ѹ��Զ��ƶ�װ�õļ���������"},
                  {"�ƶ�����ǰ���Ͳ���","�ƶ���̽�˼��","�ƶ������ޡ����޼���װ","�ƶ�����������","�ƶ����޺��鼰���Ϳ��"}
                  };
  //k2���ٸ���ָ������Ŀ               
  String k2gz[]={"������μ���","�׼ܸ���","ת��ܸ���","�ֳ�","������ǩ"};
  int k2[]={1,7,12,2,1};
  String k2gzmenu[][]={{"������μ��������췽��ȷ��"},
                   {"�׼ܸ������ֽ�","�׼ܸ�������װ","�����̸���","���Գи���","���巭ת����","���ƶ�װ��װ��","���س�����װ����װ"},
                   {"֧������װ","֧�������ܶ�λ���߼��","֧����̽��","��������װ����","ҡ�������װ����","�̶��ܸ˸���",
                    "�̶��ܸ�֧������","ת�����װ","����֧��װ����װ","ת�����λ���","ת�����װ","ת�����ɼ�ѹ������"},
                   {"�������","��������"},
                   {"��ǩ�޸ļ�������Ϳ��"}};
  //ת8B���Ƹ���ָ������Ŀ                 
  String z8bgz[]={"������μ���","�׼ܸ���","ת��ܸ���","�ֳ�","������ǩ"};
  int z8b[]={1,7,6,2,1};
  String z8bmenu[][]={{"������μ��������췽���ƶ�"},
                  {"�׼ܸ������ֽ�","�׼ܸ�������װ","���巭ת����","120������","�ƶ��ܸ˼����Ƹܸ˸���","���ƶ�װ��װ��","���س�����װ����װ"},
                  {"��������װ","ת�����װ","����֧��װ����װ","ת�����λ���","ת�����װ","ת�����ɼ�ѹ������"},
                  {"�������","��������"},
                  {"��ǩ�޸ļ�������Ϳ��"}};
  //X2h X2kָ������Ŀ                
  String x2kx2h[]={"��μ���","���䳵","�������","�ƶ�װ�ü���","17�ų�������װ�ü���","תK6ת��ܼ���","תK5ת��ܼ���","��ɼ��","��������","��������Ϳ��"};
  //DL1��ָ������Ŀ
  String dl1[]={"��μ���","���䳵��ҵ","�������","֧��װ�ü���","�Ÿ˼�ת����̽��","��������װ�ü���","ת��ܼ���","�ƶ�װ�ü���","ר�ó�������ֹͣ������","��������Ϳ��","��ɼ��"};
  
  int i,j=0;
  int num1=0;
 // int num2=0;
  int temp=100;
  //str:��ʾ�����֣���Ϊ����ʾ���ı���
  String str="";
 
  //zdslb����:ȷ��ָ�������(�������ޣ�70t��K2���죬���Ƹ��죬X2h/k��Dl1)
  //zdshtml������ȷ��ʵ��ָ����Html�ļ������ƣ��˵�ѡ��󴫵ݱ�����������ʾ��ֱ�Ӹ��ݴ��ݵ�Html�ļ�����ʾ
  //item����:ȷ����ѡ����
  String zdslb="";
  String zdsno="";
  String zdshtml="";
  String item="";
  if (request.getParameter("page")!=null) zdslb=new String(request.getParameter("page"));
  if (request.getParameter("item")!=null) item=new String(request.getParameter("item"));
  if (request.getParameter("zdsno")!=null) zdsno=new String(request.getParameter("zdsno"));

  if (zdslb.equals("6")) { str="����"; }
  if (zdslb.equals("7")) { str="����"; }  
  if (zdslb.equals("8")) { str="70t��������"; }
  if (zdslb.equals("9")) { str="X2H��X2Kȫ������"; }
  if (zdslb.equals("10")) { str="DL1�ͳ�����"; }
  if (zdslb.equals("11")) { str="תK2���ٸ���"; }
  if (zdslb.equals("12")) { str="8B/8AB���Ƹ���"; }
%> 
<table width="100%" align="center" height="236"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="182" height="182" valign="top"> 
    <!-- �˵���ʾ��������adslb������ʾ�ĸ�������ҵָ����˵� -->
	<table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td   height="80" valign="middle" align="center" background="Images/zds/menutitle.gif" width="182">
        <table border="0" cellpadding="0" cellspacing="0">
        <tr><td width="40" ><td   class="word_orange" align="right"><%=str%> </td></tr>
        <tr><td height="20" colspan="2"></td></tr>
        </table>
        </td>
      </tr>
      <tr>
        
        <td  width="100%" valign="top" align="center">
        <!-- �����ǲ˵� -->
        <!-- ������ָ������Ŀ��ͬ -->
        <% if ((zdslb.equals("6")) || (zdslb.equals("7"))) 
        {   num1=7;
        %>
          <table  width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <% for(i=0;i<num1;i++) {
         %><tr height="25">
           <td width="10"></td>
           <td align="left" width="182"><a href="Javascript:ShowTR(img<%=i%>,OpenRep<%=i%>)">
                <img src="Images/jia.gif" border="0"  id="img<%=i%>"></a>
              <%if (zdslb.equals("6"))
               { %> <a href="gzzd/gzzd.jsp?page=6&item=<%=i%>" onclick="Javascript:ShowTR(img<%=i%>,OpenRep<%=i%>)"><%=cdxzds[i]%></a>
               <% } else 
               { %><a href="gzzd/gzzd.jsp?page=7&item=<%=i%>" onclick="Javascript:ShowTR(img<%=i%>,OpenRep<%=i%>)"><%=cdxzds[i]%></a>
               <% } %>
                
           </td>
           </tr> 
           <tr id="OpenRep<%=i%>" <% if (!item.equals("")) temp=Integer.valueOf(item).intValue() ;
                  if ( temp!=i) {  %> style="display:none;"  <% } else {%> style="display:'';" <% } %>>
           <td width="10"></td>
           <td >
               <table>
               <tr>
                   <td   align="center">
                   <table width="100%" border=0 cellspacing=0 cellpadding=0>
                   <%  if (zdslb.equals("6")) { for(j=0;j<cx[i];j++){ %>
                   <tr height="25" align="left" >
                      <td width="16" align="center"><img src="Images/folder.gif" width="16" height="16" border="0"></td>
                      <td width="156" onMouseOver="this.style.background='#EEEEEE'" onMouseOut="this.style.background=''">
                      <%  zdshtml="cx"+i+(j+1)+".htm";%> 
                      <a href="gzzd/gzzd.jsp?page=6&item=<%=i%>&zdsno=<%=zdshtml%>"><%=cxsubmenu[i][j]%></a>
                      
                     </td>
                   </tr>
                   <% }}%> 
                   <%  if (zdslb.equals("7")) {  for(j=0;j<dx[i];j++){ %>
                   <tr height="25" align="left" >
                      <td width="16" align="center"><img src="Images/folder.gif" width="16" height="16" border="0"></td>
                      <td width="156" onMouseOver="this.style.background='#EEEEEE'" onMouseOut="this.style.background=''">
                      <%  zdshtml="dx"+i+(j+1)+".htm";%> 
                      <a href="gzzd/gzzd.jsp?page=7&item=<%=i%>&zdsno=<%=zdshtml%>"><%=dxsubmenu[i][j]%></a>
                      </td>
                   </tr>
                   <% }}%> 
                   </table>
                   </td>
              </tr>
              </table>
           </td>
           </tr>
           <% } %>
          </table>
         <%}%>
        <% if (zdslb.equals("8")) {
          num1=5;
        %>
          <table  width="200" border="0" align="center" cellpadding="0" cellspacing="0">
          <% for(i=0;i<num1;i++) { %> 
          <tr height="25">
              <td width="10"></td>
              <td align="left" width="182"><a href="Javascript:ShowTR(img<%=i%>,OpenRep<%=i%>)">
              <img src="Images/jia.gif" border="0"  id="img<%=i%>"></a>
              <a href="Javascript:ShowTR(img<%=i%>,OpenRep<%=i%>)"><%=hc70tzds[i]%></a>  
              </td>
          </tr>
          <tr id="OpenRep<%=i%>" <% if (!item.equals("")) temp=Integer.valueOf(item).intValue() ;
                  if ( temp!=i) {  %> style="display:none;"  <% } else {%> style="display:'';" <% } %>>
              <td width="10"></td>
              <td>
                <table>
                <tr>
                    <td   align="center">
                    <table width="100%" border=0 cellspacing=0 cellpadding=0>
                    <%  for(j=0;j<hc70t[i];j++){%>
                       <tr height="25" align="left" >
                          <td align="center" width="16"><img src="Images/folder.gif" width="16" height="16" border="0"></td>
                          <td width="156" onMouseOver="this.style.background='#EEEEEE'" onMouseOut="this.style.background=''"><a href="a.jsp">
                           <%  zdshtml="hc70t"+i+(j+1)+".htm";%> 
                           <a href="gzzd/gzzd.jsp?page=8&item=<%=i%>&zdsno=<%=zdshtml%>"><%=hc70tmenu[i][j]%></a></td>
                      </tr>
                    <%}%> 
                    </table>
                    </td>
                </tr>
                </table>
             </td>
          </tr>
          <%}%>
          </table>
         <% } %>
         <% if (zdslb.equals("9")) {
          num1=10;
        %>
          <table  width="200" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr >
              <td width="10"></td>
              <td>
                <table>
                <tr>
                    <td   align="center">
                    <table width="100%" border=0 cellspacing=0 cellpadding=0>
                    <% for(i=0;i<num1;i++) { %> 
                       <tr height="25" align="left" >
                          <td align="center" width="16"><img src="Images/folder.gif" width="16" height="16" border="0"></td>
                          <td width="156" onMouseOver="this.style.background='#EEEEEE'" onMouseOut="this.style.background=''">
                          <%  zdshtml="x2hk"+i+".htm";%>
                          <a href="gzzd/gzzd.jsp?page=9&zdsno=<%=zdshtml%>"><%=x2kx2h[i]%></a></td>
                      </tr>
                    <%}%> 
                    </table>
                    </td>
                </tr>
                </table>
             </td>
          </tr>
         </table>
         <% } %>
          <% if (zdslb.equals("10")) {
          num1=11;
        %>
          <table  width="200" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr >
              <td width="10"></td>
              <td>
                <table>
                <tr>
                    <td   align="center">
                    <table width="100%" border=0 cellspacing=0 cellpadding=0>
                    <% for(i=0;i<num1;i++) { %> 
                       <tr height="25" align="left" >
                          <td align="center" width="16"><img src="Images/folder.gif" width="16" height="16" border="0"></td>
                          <td width="156" onMouseOver="this.style.background='#EEEEEE'" onMouseOut="this.style.background=''"><a href="a.jsp">
                          <%  zdshtml="dl"+i+".htm";%>
                          <a href="gzzd/gzzd.jsp?page=10&zdsno=<%=zdshtml%>"><%=dl1[i]%></a></td>
                      </tr>
                    <%}%> 
                    </table>
                    </td>
                </tr>
                </table>
             </td>
          </tr>
         </table>
         <% } %>
        <% if (zdslb.equals("12")) {
          num1=5;
        %>
          <table  width="200" border="0" align="center" cellpadding="0" cellspacing="0">
          <% for(i=0;i<num1;i++) { %> 
          <tr height="25">
              <td width="10"></td>
              <td align="left" width="182"><a href="Javascript:ShowTR(img<%=i%>,OpenRep<%=i%>)">
              <img src="Images/jia.gif" border="0"  id="img<%=i%>"></a>
              <a href="Javascript:ShowTR(img<%=i%>,OpenRep<%=i%>)"><%=z8bgz[i]%></a>  
              </td>
          </tr>
          <tr id="OpenRep<%=i%>" <% if (!item.equals("")) temp=Integer.valueOf(item).intValue() ;
                  if ( temp!=i) {  %> style="display:none;"  <% } else {%> style="display:'';" <% } %>>
              <td width="10"></td>
              <td>
                <table>
                <tr>
                    <td   align="center">
                    <table width="100%" border=0 cellspacing=0 cellpadding=0>
                    <%  for(j=0;j<z8b[i];j++){%>
                       <tr height="25" align="left" >
                          <td align="center" width="16"><img src="Images/folder.gif" width="16" height="16" border="0"></td>
                          <td width="156" onMouseOver="this.style.background='#EEEEEE'" onMouseOut="this.style.background=''"><a href="a.jsp">
                          <%  zdshtml="z8b"+i+(j+1)+".htm";%>
                          <a href="gzzd/gzzd.jsp?page=12&item=<%=i%>&zdsno=<%=zdshtml%>"><%=z8bmenu[i][j]%></a></td>
                      </tr>
                    <%}%> 
                    </table>
                    </td>
                </tr>
                </table>
             </td>
          </tr>
          <%}%>
          </table>
         <% } %> 
        <% if (zdslb.equals("11")) {
          num1=5;
        %>
          <table  width="200" border="0" align="center" cellpadding="0" cellspacing="0">
          <% for(i=0;i<num1;i++) { %> 
          <tr height="25">
              <td width="10"></td>
              <td align="left" width="182"><a href="Javascript:ShowTR(img<%=i%>,OpenRep<%=i%>)">
              <img src="Images/jia.gif" border="0"  id="img<%=i%>"></a>
              <a href="Javascript:ShowTR(img<%=i%>,OpenRep<%=i%>)"><%=k2gz[i]%></a>  
              </td>
          </tr>
          <tr id="OpenRep<%=i%>" <% if (!item.equals("")) temp=Integer.valueOf(item).intValue() ;
                  if ( temp!=i) {  %> style="display:none;"  <% } else {%> style="display:'';" <% } %>>
              <td width="10"></td>
              <td>
                <table>
                <tr>
                    <td   align="center">
                    <table width="100%" border=0 cellspacing=0 cellpadding=0>
                    <%  for(j=0;j<k2[i];j++){%>
                       <tr height="25" align="left" >
                          <td align="center" width="16"><img src="Images/folder.gif" width="16" height="16" border="0"></td>
                          <td width="156" onMouseOver="this.style.background='#EEEEEE'" onMouseOut="this.style.background=''">
                          <%zdshtml="k2"+i+(j+1)+".htm";%>
                          <a href="gzzd/gzzd.jsp?page=11&item=<%=i%>&zdsno=<%=zdshtml%>"><%=k2gzmenu[i][j]%></a></td>
                      </tr>
                    <%}%> 
                    </table>
                    </td>
                </tr>
                </table>
             </td>
          </tr>
          <% } %> 
          </table>
         <% } %> 
        <!-- �˵����� -->
       </td>
      </tr>
    </table>
    <!-- end of left  -->
	</td>
    <td valign="top"> 
    <!-- ����ʾ������ʾ��ҵָ������ -->
       <table width="100%"  border="0" cellpadding="0" cellspacing="0">
          <tr>
          <td>
           <table width="100%" border="0" cellpadding="0" cellspacing="0">
           <tr> 
             <td width="93" height="50" background="Images/zds/zdst1.gif">&nbsp;</td>
             <td align="left"  background="Images/zds/zdst2.gif" class="blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=str%></td>
             <td  width="8" background="Images/zds/zdst2right.gif"></td> 
           </tr>
           </table>
           </td>
          </tr>
          <tr>
          <td>
          <!-- ���￪ʼ��ʾ��ҵָ������ -->
          <table border="0" cellpadding="0" cellspacing="0" width="100%">
           <tr> 
             <td width="13" height="63" background="Images/zds/left.gif">&nbsp;</td>
             <td height="63" background="Images/zds/zdsbg.gif">ָ��������
             </td>
             <td width="13" height="63" background="Images/zds/right.gif">&nbsp;</td>
          </tr>
          <tr>
             <td width="13" >&nbsp;</td>
             <td><div>
             <!-- ������ҵָ���� -->
             <% if (request.getParameter("zdsno")!=null) {
             String  filepath="../zyzds/"+zdsno;
             %>
             <jsp:include flush="true" page="<%=filepath%>"></jsp:include> <% } %>
             </div>
             </td>
             <td width="13" >&nbsp;</td>
          </tr>
          </table>
          </td>
        </table>
    </td>
  </tr>
</table>
</body>
</html>
