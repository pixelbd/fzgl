<%@ page language="java" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�豸�������</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <LINK href="Css/css1.css" type=text/css rel=stylesheet> 
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
  String sbfl1[]={"��������������0�ࣩ"," ��ѹ�����豸��һ�ࣩ" ,"�����豸�����ࣩ","�����豸�����ࣩ","���������豸�����ࣩ","����¯���������豸�����ࣩ","ľ�������豸�����ࣩ","�����豸�����ࣩ","���̻�е�����ࣩ","�����豸�����ࣩ"};//�豸����2������ʹ�÷�,�豸�������
  String sbfl2[]={"ת���","�ֳ�" ,"�ƶ���","�ƶ���","���","����","����"};//�豸����1���豸ʹ�������,�޳�����
  
  //���豸���Է�����Ŀ
  int fl1[]={29,30,15,10,32,3,4,53,1,23};
  String fl1submenu[][]={
                  {"̨ʽ����","��ͨ����","���س��ֳ���","�����ᾱ����","��ʽ�괲","ҡ���괲","�۴�",
                   "���ܹ���ĥ��","��ʽϳ��","��ʽ����ϳ��","������ϳ��������ϻ�","���平β�������ϳ�׻�","ţͷ�ٴ�","բ����ϳ��",
                   "����ϳ��","��־���Զ���Ż�","��ͨ����ĥ��","̨ʽ�괲","��˨��˿��","ɰ�ֻ�","���������",
                   "WTX-2��բ����ϳ��","SG-803/2������Բĥ��","H405B������Բĥ��","���س��ᳵ�����������������ר�û���","����װ���Ŀ�ϳ��","��ʽ����","��Բĥ��","�ᾱ��ĥ��"},
                  {"�綯������","����У��Һѹ��","����ѹ����","΢���������ѹװ����WY��","�����ж��","��в��ֻ�","��ʽ˫������ѹ����",
                   "�������׷ֽ��","����������װ��","�ƶ�ʽ������װ��","Һѹí����","������Һѹí����","Һѹ���í����","�����","���ϼ����","���ŵ�ֱ��","�����ۺϵ�����","�����������λ�",
                   "������ѹ��","�ֶ�Һѹ��","��ǣ����ҺѹС��","����ܷ��ֲ�ж��","��ͨ����װ�ֽ⹤��̨","���Żɷֽ���װ��","������װ����13�ų�����","17�Ź�����װ��",
                   "���������ж����70�֣�","�������ֽ���װѹ�ֻ�","���ѹװ����70�֣�","����ѹװ��"},
                  {"ȼú������¯","ȼ�͹�¯","��¯����ˮ¯","����ʽ����ѹ����","�ϸ˿���ѹ����","���ı�","���ӽ�����",
                   "̫������ˮ��","�����","����ͨ���","�ŷ���","����II��","��Դ�ȱÿյ�ϵͳ��ˮ����",
                   "��Դ�ȱÿյ�ϵͳ(����)","��ѹ��¯"},
                  {"����","�����纸��","ֱ���纸��","�����Զ��������������Ƹۣ�","�����Զ��񻡺���","�����Զ������������㽭��ѧ��","������������","CO2���屣������",
                   "���ӻ����˼��о�","֧�����Զ�����װ��"},
                  {"�綯˫����ʽ���ػ�","�綯������ʽ���ػ����ز٣�","�綯������ʽ���ػ����ղ٣�","ƽ���","��ʽ��","�綯�ܳ���","�綯�ܳ���","�綯Һѹ�ܳ���",
                   "��ȼ�泵","ҡ���ܷ�ת��","���ͻ�","����ƽ̨","�綯��«����������","�����","��ƿ��","��ƿ����","̨��ת��","�ƶ���������","������������",
                   "����������ˮ��","��β�����ͻ�","�綯ת����","�綯ת����"
                   ,"�����","�ƶ���������","������ϵ綯���","�������巭ת��","ת�����ˮ���豸","ת��ܵ����а���װ��","ZZB-800DC��������ϵ綯�������˫��","��ʽ���ػ�","��ƿ�泵"},
                  {"̨������¯","�˻�¯","�͹�¯"},
                  {"˫����������","������������","ѭ������ʽ��ɰ��","ҡ������������"},
                  {"��ͨ��������̽����","΢���������Զ�̽����","DCF-S�͹���ŷ�̽�˻�","DCF-K�͹�β��ŷ�̽�˻�","DCF-L���ƶ�������ŷ�̽�˻�","����ŷ�̽�˻�","ҡ���ܴŷ�̽�˻�",
                  "�ֶ�ӫ��ŷ�̽�˻�","6000����л��μ��ŷ�̽�˻�","΢�����Ƶ���������"
                  ,"�г��Զ��Է�װ��","WLS-II΢���г��Զ��Է�װ��","705��701��΢����������̨","���ˮѹ������","�ֶ�ĥ�ϻ�","��в��ֽ������","�ƶ�������������","120������̨",
                  "�ֶ��Զ����װ��","����Զ����װ��","�ﳵ©������װ��","բ��������̨","�෧����̨","�����ӫ��ŷ�̽�˻�","�ƶ����Զ�����",
                  "Բ����ӫ��ŷ�̽�˻�","����������̨","�ƶ�������ŷ�̽�˻�(��ˮ��)�豸","�������̽�˻��豸","���س��Զ�����װ������̨�豸"
                  ,"�޳����򷧣�����̨�豸","ͨ��ʽ����ŷ�̽�˻��豸","TDH-2��΢�ص���������","΢���ֶ�ĥ�ϻ�(ZMIIB-600)",
                  "ת���ѹ�������","תK2��λ�����װ̨","CJW-H��ҡ���ܴŷ�̽�˻�","WSDC-III��΢�ص���������","��β��ŷ�̽�˻���CJW-4000���豸","600����й��Ӵŷ�̽�˻�"
                  ,"��������ȱ�ݼ��װ��","���������","����ӫ��ŷ�̽�˻�","�ֶԶ�ƽ�����鼰ȥ���豸","�ᾱ�ŷ�̽�˻�","��������ת������","�������䴸�����",
                  "���ˣ���������","�Գ������","���ˮѹ���飨RGJ-1����"
                  ,"�ƶ����Զ���������JC-2000��","����ھ�������","������ܴ�ȡ���豸"},
                  {"��ȼװ�ػ�"},
                  {"���ע֬��","���Լ������ͻ�","�����֬�����","��ͨ����ϴ��","��г�����ϴ��","�ֶԳ�����ϴ��","��ˮ����ϵͳ","������","��ҵ��ˮ�����","ת�����ϴ��"
                  ,"��ͨ����������ϴ��","��ͨ����ϴ̨","�����̳����������ն���","������������","������Ϳ��","�ƶ������ᶨλ��","���Գ����װ��","TD-�����ƶ��������ߺͶ����Զ������",
                  "��Լо�","��β����������","��β����������","ͨ����ת�����װ̥��","�ƶ�����������"}
                  };
  //���豸ʹ�ô���������Ŀ

  int fl2[]={28,21,14,5,3,18,15};
  String fl2submenu[][]={
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

  int i,j=0;
  int num1=0;
  int temp=100;
  //str:��ʾ�����֣���Ϊ����ʾ���ı���
  String str="";
 
  //czgclb����:ȷ���ǰ����Է��࣬���ǰ�ʹ�ô�������
  //czgzhtml������ȷ��ʵ�ʲ������Html�ļ������ƣ��˵�ѡ��󴫵ݱ�����������ʾ��ֱ�Ӹ��ݴ��ݵ�Html�ļ�����ʾ
  //item����:ȷ����ѡ����
  String czgclb="1";
  String czgcno="1";
  String czgchtml="";
  String item="";
  if (request.getParameter("item")!=null) item=new String(request.getParameter("item"));
  if (request.getParameter("czgcno")!=null) czgcno=new String(request.getParameter("czgcno"));

  if (czgclb.equals("1")) { str="���豸���Է���"; }
  if (czgclb.equals("2")) { str="�豸����2"; }  

%> 
<table width="100%" align="center"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td width="182"  valign="top"> 
    <!-- �˵���ʾ��������czgclb������ʾ�ĸ����Ĳ�����̲˵� -->
	<table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td   height="80" valign="middle" align="center" background="Images/czgc/menutitle.gif" width="182">
        <table border="0" cellpadding="0" cellspacing="0">
        <tr><td width="40" ><td   class="word_orange" align="right"><%=str%> </td></tr>
        <tr><td height="20" colspan="2"></td></tr>
        </table>
        </td>
      </tr>
      <tr>
        <td  width="100%" valign="top" align="center">
        <!-- �����ǲ˵� -->
        <% if (czgclb.equals("1"))  
        {   num1=10;
        %>
          <table  width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
          <% for(i=0;i<num1;i++) {
         %><tr height="25">
           <td width="10"></td>
           <td align="left" width="182"><a href="Javascript:ShowTR(img<%=i%>,OpenRep<%=i%>)">
                <img src="Images/jia.gif" border="0"  id="img<%=i%>"></a>
               <a href="sbgl/sbgl.jsp?page=3&item=<%=i%>" onclick="Javascript:ShowTR(img<%=i%>,OpenRep<%=i%>)"><%=sbfl1[i]%></a>
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
                   <% for(j=0;j<fl1[i];j++){ %>
                   <tr height="25" align="left" >
                      <td width="16" align="center"><img src="Images/folder.gif" width="16" height="16" border="0"></td>
                      <td width="156" onMouseOver="this.style.background='#EEEEEE'" onMouseOut="this.style.background=''">
                      <%
                      if (i>0) 
                      {
                        
                          czgchtml=(i+1)*100+(j+1)+".htm"; 
                           
                          
                      }
                      else { czgchtml=(j+1)+".htm"; }
                      %> 
                      
                      <a href="sbgl/sbgl.jsp?page=3&item=<%=i%>&czgcno=<%=czgchtml%>"><%=fl1submenu[i][j]%></a>
                      </td>
                   </tr>
                   <% }%> 
                   </table>
                   </td>
              </tr>
              </table>
           </td>
           </tr>
           <% } %>
          </table>
         <%}%>
        <% if (czgclb.equals("2")) {
          num1=5;
        %>
          <table  width="200" border="0" align="center" cellpadding="0" cellspacing="0">
          <% for(i=0;i<num1;i++) { %> 
          <tr height="25">
              <td width="10"></td>
              <td align="left" width="182"><a href="Javascript:ShowTR(img<%=i%>,OpenRep<%=i%>)">
              <img src="Images/jia.gif" border="0"  id="img<%=i%>"></a>
              <a href="Javascript:ShowTR(img<%=i%>,OpenRep<%=i%>)"><%=sbfl2[i]%></a>  
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
                    <%  for(j=0;j<fl2[i];j++){%>
                       <tr height="25" align="left" >
                          <td align="center" width="16"><img src="Images/folder.gif" width="16" height="16" border="0"></td>
                          <td width="156" onMouseOver="this.style.background='#EEEEEE'" onMouseOut="this.style.background=''"><a href="a.jsp">
                           <%  czgchtml="hc70t"+i+(j+1)+".htm";%> 
                           <a href="sbgl/sbgl.jsp?page=3&item=<%=i%>&czgcno=<%=czgchtml%>"><%=fl2submenu[i][j]%></a></td>
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
        <!-- �˵����� -->
       </td>
      </tr>
    </table>
    <!-- end of left  -->
	</td>
    <td valign="top"> 
    <!-- ����ʾ������ʾ����������� -->
       <table width="100%"  border="0" cellpadding="0" cellspacing="0">
          <tr>
          <td>
           <table width="100%" border="0" cellpadding="0" cellspacing="0">
           <tr> 
             <td width="93" height="50" background="Images/czgc/zdst1.gif">&nbsp;</td>
             <td align="left"  background="Images/czgc/zdst2.gif" class="blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=str%></td>
             <td  width="8" background="Images/czgc/zdst2right.gif"></td> 
           </tr>
           </table>
           </td>
          </tr>
          <tr>
          <td>
          <!-- ���￪ʼ��ʾ����������� -->
          <table border="0" cellpadding="0" cellspacing="0" width="100%">
           <tr> 
             <td width="13" height="63" background="Images/czgc/left.gif">&nbsp;</td>
             <td height="63" background="Images/czgc/zdsbg.gif">�豸�����������
             </td>
             <td width="13" height="63" background="Images/czgc/right.gif">&nbsp;</td>
          </tr>
          <tr>
             <td width="13" >&nbsp;</td>
             <td><div>
             <!-- ������ҵָ���� -->
             <% if (request.getParameter("czgcno")!=null) {
             String  filepath="../sbczgc/"+czgcno;
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
