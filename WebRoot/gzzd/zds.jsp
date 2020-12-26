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
ShowTR(img0,OpenRep0)  //设置第1个结点为展开状态
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
 // String zds[]={"厂修","段修","70t级货车段修","X2H、X2K全面检查修","DL1型车段修","转K2提速改造","8B/8AB完善改造"};
  String cdxzds[]={"转向架","现车" ,"制动室","制动梁","配件","钩缓","轮轴"};

  //厂修指导书项目
  int cx[]={29,15,14,10,11,23,10};
  String cxsubmenu[][]={
                  {"转向架清洗","转向架分解","下心盘、心盘磨耗盘分解、组装","承载鞍分解、检测","基础制动装置分解","枕簧、斜楔分解、检测","横跨梁分解、检测",
                   "摆动装置分解、检测","转向架翻转检查","大部件抛丸除锈","大部件探伤","交叉支撑装置分解、检测","交叉支撑装置探伤","交叉支撑装置组装",
                   "摇枕检修","摇枕斜楔摩擦面磨耗板检修","侧架检修","侧架立柱磨耗板检修","滑槽磨耗板检修","承载鞍组装","下旁承组装",
                   "转向架正位检测","基础制动装置组装","弹性下旁承分解检修","下旁承检测","心盘中心销检测","转向架组装及落成","心盘磨耗盘检测"
,"摇动座探伤"},
                  {"整车抛丸除锈","底架及车体调修","底架检修","底架附属配件检修","车辆焊修","现车车钩缓冲装置分解、检修、组装","现车制动装置分解、检修、组装",
                   "罐车清洗","罐车分解","罐车车体（罐体）及附属配件检修","罐体及加温套水压试验","车号标签管理、检修","现车油漆标记","现车落成","单车试验"},
                  {"零部件外部清理","缓解阀、安全阀检修","制动软管总成检查及试验","储风缸检修及试验","塞门检修及试验","单车试验器检修","120、120-1型控制阀检修",
                   "103型分配阀检修","GK型三通阀检修","空重车自动调整装置检修","120、120-1控制阀试验","103型分配阀在705型微机试验台上的试验","GK阀在701验台上的试验",
                   "空重车自动调整装置在试验台上的试验"},
                  {"制动梁抛丸除锈","制动梁修前检查和测量","制动梁焊修","制动梁安全链环焊接","制动梁支柱焊装","制动梁滚子轴探伤","制动梁闸瓦托机加工","制动梁拉力试验",
                   "制动梁检查测量","组合式制动梁检修"},
                  {"制动杠杆、拉杆、固定支点、制动圆销检修","心盘加修前检测","心盘手工焊修","心盘自动焊修","心盘热处理","心盘机加工","心盘检测","心盘中心销检测",
                   "车辆配件焊修","车辆配件磁粉探伤","下心盘分解组装"},
                  {"车钩缓冲装置成套分解","车钩分解","车钩缓冲装置寿命管理","车钩缓冲装置零部件抛丸除锈","车钩检修","钩尾销检修","缓冲器检修","钩舌销检修","钩尾框焊修",
                   "钩舌探伤","钩尾框探伤","车钩探伤","钩舌销、钩尾销探伤","车钩焊修","钩舌焊修","钩舌热处理","钩舌机加工","钩腔内部配件检修","钩耳孔、钩舌销孔洗孔、镶套",
                   "从板检修","从板机加工","车钩组装","车钩缓冲装置成套组装"},
                  {"轮对收入","轴承退卸","轮对除锈","轮对磁粉探伤","微机超探","轮对超声波探","踏面加修","轴承压装","轴承摩合","轮对支出"}
                  };
  //段修指导书项目
  int dx[]={28,21,14,5,3,18,15};
  String dxsubmenu[][]={
                  {"转向架清洗","下心盘、心盘磨耗盘分解、组装","承载鞍分解、检测","下旁承检测","基础制动装置分解","横跨梁分解、检测","枕簧、斜楔分解、检测",
                   "摆动装置分解、检测","转向架翻转检查","摇枕工艺孔、落水孔磁粉探伤","交叉支撑装置分解、检测","交叉支撑装置探伤",
                   "摇枕检修","侧架检修","摇枕斜楔摩擦面磨耗板检修","侧架立柱磨耗板检修","转向架组装及落成","摇枕侧架探伤","侧架滑槽磨耗板检修",
				   "承载鞍组装","下旁承组装", "转向架正位检测","基础制动装置组装","弹性下旁承分解检修","转向架分解","交叉杆组装","心盘磨耗盘检测","摇动座探伤"},
                  {"架落车","底架检修","车体检修","底架和车体调修","底架附属配件检修","车辆焊修","上心盘铆装","上旁承组成检修",
				  "敞车中侧门及下侧门组成检修","罐车清洗","罐车车体（罐体）及附属件检修","罐车分解","罐体、加温套、加温管路水压试验",
				  "拉铆工艺","集装箱锁闭装置检修","车号标签管理、检修","现车油漆标记","现车制动装置分解、检修、组装","现车车钩缓冲装置分解组装",
				  "单车试验","现车落成",},
                  {"零部件外部清理","缓解阀、安全阀检修","制动软管总成检查及试验","储风缸检修及试验","塞门检修及试验","单车试验器检修","120、120-1型控制阀检修","103型分配阀检修",
                   "GK型三通阀检修","空重车自动调整装置检修","120、120-1控制阀试验","103型分配阀在705型微机试验台上的试验","GK阀在701验台上的试验",
                   "空重车自动调整装置在试验台上的试验"},
                  {"制动梁修前检查和测量","制动梁探伤检查","制动梁安全链环焊接制动梁检修、焊修及组装","制动梁拉力试验","制动梁修后检查及标记涂打"},
                  {"JC型弹性旁承检修","JC-1型弹性旁承组装","制动杠杆、拉杆、固定支点、制动圆销检修"},
                  {"车钩缓冲装置成套分解(含寿命管理)","车钩分解","车钩焊修","车钩组装","缓冲器检修","钩尾框检修","钩尾框探伤","钩舌探伤",
				  "钩舌销、钩尾销探伤","钩舌焊修","钩舌热处理","钩舌机加工","钩耳孔、钩舌销孔铣孔、镶套","丛板检修","丛板机加工","车钩缓冲装置配件抛丸除锈",
				  "钩腔内部配件检修","现车车钩缓冲装置分解组装"},
                  {"轮对收入","轴承诊断","轴承外观检查","轴承退卸","轮对除锈","轮对磁粉探伤","微机超探","轮对超声波探","踏面加修","轴承压装",
				  "轴承磨合","轮对支出","超声波探伤仪器、探头性能测试","轴端螺栓清洗、检测","轴承前盖、后挡清洗、检测"}
                  };
  //70t货车检修指导书项目                
  String hc70tzds[]={"转向架","现车","钩缓","防脱装置","制动梁"};
  int hc70t[]={21,14,15,1,5};
  String hc70tmenu[][]={
                  {"转向架清洗","转向架分解","承载鞍及转K6型轴箱橡胶垫检修","下心盘、心盘磨耗盘、中心销检修","摇枕弹簧（减振弹簧）检测及选配",
                   "转K6型转向架交叉支撑装置检修","转K5型转向架摇动装置检修","摇动座探伤","转K5型转向架导框摇动座检修","斜楔检测",
                   "摇枕八字面磨耗板检修","转K5转向架检修","转K右转向架检修","滑槽磨耗板检修","下心盘组装",
                   "承载鞍组装","弹性旁承检修","侧架立柱磨耗板检修及安装","基础制动装置组装","横跨梁组成检修",
                   "转向架组装及落成"},
                  {"车体检修","底架各梁、盖板弯曲调修及补强","车体、底架附属件检修","NSW型手制动机检修","车辆标记喷涂",
                   "车辆落成","上心盘铆装","17型车钩缓冲装置分解、检修、组装","现车制动装置分解、检修、组装","单车试验",
                   "架落车","罐车洗刷","罐体及附属配件检修","罐体及加温套水压试验"},
                  {"17型车钩缓冲装置分解","17型车钩钩舌、钩尾框、钩腔内部配件抛丸除锈","17型车钩钩体检修","17型钩尾框探伤","16型钩舌探伤",
                   "17型车钩舌销、钩尾销探伤","16型钩舌检修","17型钩尾框检修","17型车钩舌销、钩尾销检修","17型钩腔内部配件检修",
                   "MT-2缓冲器检修","17型车钩从板检修","17型车钩其他配件检修","17型车钩组装","17型车钩三态试验"},
                  {"脱轨自动制动装置的检修与试验"},
                  {"制动梁修前检查和测量","制动梁探伤检查","制动梁检修、焊修及组装","制动梁拉力试验","制动梁修后检查及标记涂打"}
                  };
  //k2提速改造指导书项目               
  String k2gz[]={"车辆入段鉴定","底架改造","转向架改造","现车","车辆标签"};
  int k2[]={1,7,12,2,1};
  String k2gzmenu[][]={{"车辆入段鉴定及改造方案确定"},
                   {"底架附属件分解","底架附属件组装","上心盘改造","上旁承改造","车体翻转焊修","风制动装置装配","空重车调整装置组装"},
                   {"支撑座焊装","支撑座与侧架定位划线检查","支撑座探伤","侧架组成组装焊接","摇枕组成组装焊接","固定杠杆改制",
                    "固定杠杆支点修理","转向架套装","交叉支撑装置组装","转向架正位检测","转向架组装","转向架落成及压吨试验"},
                   {"车辆落成","单车试验"},
                   {"标签修改及油漆标记涂打"}};
  //转8B完善改造指导书项目                 
  String z8bgz[]={"车辆入段鉴定","底架改造","转向架改造","现车","车辆标签"};
  int z8b[]={1,7,6,2,1};
  String z8bmenu[][]={{"车辆入段鉴定及改造方案制定"},
                  {"底架附属件分解","底架附属件组装","车体翻转焊修","120阀改造","制动杠杆及控制杠杆改造","风制动装置装配","空重车调整装置组装"},
                  {"侧架组成组装","转向架套装","交叉支撑装置组装","转向架正位检测","转向架组装","转向架落成及压吨试验"},
                  {"车辆落成","单车试验"},
                  {"标签修改及油漆标记涂打"}};
  //X2h X2k指导书项目                
  String x2kx2h[]={"入段鉴定","架落车","车体检修","制动装置检修","17号车钩缓冲装置检修","转K6转向架检修","转K5转向架检修","落成检查","单车试验","油漆与标记涂打"};
  //DL1车指导书项目
  String dl1[]={"入段鉴定","架落车作业","车体检修","支撑装置检修","撑杆及转向盘探伤","车钩缓冲装置检修","转向架检修","制动装置检修","专用车钩缓冲停止器检修","油漆与标记涂打","落成检查"};
  
  int i,j=0;
  int num1=0;
 // int num2=0;
  int temp=100;
  //str:提示性文字，做为主显示区的标题
  String str="";
 
  //zdslb变量:确定指导书类别(厂、段修，70t，K2改造，完善改造，X2h/k，Dl1)
  //zdshtml变量：确定实际指导书Html文件的名称，菜单选择后传递变量，在主显示区直接根据传递的Html文件名显示
  //item变量:确定子选择项
  String zdslb="";
  String zdsno="";
  String zdshtml="";
  String item="";
  if (request.getParameter("page")!=null) zdslb=new String(request.getParameter("page"));
  if (request.getParameter("item")!=null) item=new String(request.getParameter("item"));
  if (request.getParameter("zdsno")!=null) zdsno=new String(request.getParameter("zdsno"));

  if (zdslb.equals("6")) { str="厂修"; }
  if (zdslb.equals("7")) { str="段修"; }  
  if (zdslb.equals("8")) { str="70t货车段修"; }
  if (zdslb.equals("9")) { str="X2H、X2K全面检查修"; }
  if (zdslb.equals("10")) { str="DL1型车段修"; }
  if (zdslb.equals("11")) { str="转K2提速改造"; }
  if (zdslb.equals("12")) { str="8B/8AB完善改造"; }
%> 
<table width="100%" align="center" height="236"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="182" height="182" valign="top"> 
    <!-- 菜单显示区，根据adslb决定显示哪个类别的作业指导书菜单 -->
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
        <!-- 这里是菜单 -->
        <!-- 厂段修指导书项目相同 -->
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
        <!-- 菜单结束 -->
       </td>
      </tr>
    </table>
    <!-- end of left  -->
	</td>
    <td valign="top"> 
    <!-- 主显示区，显示作业指导内容 -->
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
          <!-- 这里开始显示作业指导内容 -->
          <table border="0" cellpadding="0" cellspacing="0" width="100%">
           <tr> 
             <td width="13" height="63" background="Images/zds/left.gif">&nbsp;</td>
             <td height="63" background="Images/zds/zdsbg.gif">指导书内容
             </td>
             <td width="13" height="63" background="Images/zds/right.gif">&nbsp;</td>
          </tr>
          <tr>
             <td width="13" >&nbsp;</td>
             <td><div>
             <!-- 调入作业指导书 -->
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
