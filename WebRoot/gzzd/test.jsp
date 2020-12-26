<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
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
  String zds[]={"厂修","段修","70t级货车段修","X2H、X2K全面检查修","DL1型车段修","转K2提速改造","8B/8AB完善改造"};
  String cdxzds[]={"转向架","现车" ,"制动室","制动梁","配件","钩缓","轮轴"};
  int cx[]={27,15,14,10,11,23,10};
  String cxsubmenu[][]={
                  {"转向架清洗","转向架分解","下心盘、心盘磨耗盘分解、组装","承载鞍分解、检测","基础制动装置分解","枕簧、斜楔分解、检测","横跨梁分解、检测",
                   "摆动装置分解、检测","转向架翻转检查","大部件抛丸除锈","大部件探伤","交叉支撑装置分解、检测","交叉支撑装置探伤","交叉支撑装置组装",
                   "摇枕检修","摇枕斜楔摩擦面磨耗板检修","侧架检修","侧架立柱磨耗板检修","滑槽磨耗板检修","承载鞍组装","下旁承组装",
                   "转向架正位检测","基础制动装置组装","弹性下旁承分解检修","下旁承检测","心盘中心销检测","转向架组装及落成"},
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
  int dx[]={26,11,13,5,12,18,8};
  String dxsubmenu[][]={
                  {"转向架清洗","转向架分解","下心盘、心盘磨耗盘分解、组装","承载鞍分解、检测","基础制动装置分解","枕簧、斜楔分解、检测","横跨梁分解、检测",
                   "摆动装置分解、检测","转向架翻转检查","大部件抛丸除锈","大部件探伤","交叉支撑装置分解、检测","交叉支撑装置探伤","交叉支撑装置组装",
                   "摇枕检修","摇枕斜楔摩擦面磨耗板检修","侧架检修","侧架立柱磨耗板检修","滑槽磨耗板检修","承载鞍组装","下旁承组装",
                   "转向架正位检测","基础制动装置组装","弹性下旁承分解检修","下旁承检测","心盘中心销检测","转向架组装及落成"},
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
                  {"制动梁修前检查和测量","制动梁探伤检查","制动梁检修、焊修及组装","制动梁拉力试验","制动梁闸瓦托机加工","制动梁修后检查及标记涂打"}
                  };
                  
  String k2gz[]={"车辆入段鉴定","底架改造","转向架改造","现车","车辆标签"};
  String z8Bgz[]={"车辆入段鉴定","底架改造","转向架改造","现车","车辆标签"};
  String x2kx2h[]={"入段鉴定","架落车","车体检修","制动装置检修","17号车钩缓冲装置检修","转K6转向架检修","转K5转向架检修","落成检查","单车试验","油漆与标记涂打"};
  String dl1[]={"入段鉴定","架落车作业","车体检修","支撑装置检修","撑杆及转向盘探伤","车钩缓冲装置检修","转向架检修","制动装置检修","专用车钩缓冲停止器检修","油漆与标记涂打","落成检查"};
  
  
  int k2[]={1,7,12,2,1};
  int z8B[]={1,7,6,2,1};
  
  int i,j=0;
  int num1=7;
  int num2=0;
  String zdslb="";
  String str="";
  
  if (request.getParameter("page")!=null) zdslb=new String(request.getParameter("page"));
  
  if ((zdslb.equals("6"))||(zdslb.equals("7"))) 
  {
   num1=7;
  %>
  <table  width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <% for(i=0;i<num1;i++) {
  %> <tr  >
      <td align="left" width="200"><a href="Javascript:ShowTR(img<%=i%>,OpenRep<%=i%>)">
          <img src="Images/jia.gif" border="0"  id="img<%=i%>"></a>
          <a href="Javascript:ShowTR(img<%=i%>,OpenRep<%=i%>)"><%=cdxzds[i]%></a>  
      </td>
   </tr>
   <tr id="OpenRep<%=i%>" style="display:none;">
   <td>
         <table>
         <tr>
            <td   align="center">
            <table width="90%" border=0 cellspacing=0 cellpadding=0>
            <%  if (zdslb.equals("6")) { 
            for(j=0;j<cx[i];j++){ %>
            <tr height="25" align="left" >
                 <td width="8%" align="center"><img src="Images/folder.gif" width="16" height="16" border="0"></td>
                 <td width="92%" onMouseOver="this.style.background='#EEEEEE'" onMouseOut="this.style.background=''">
                    <a href="a.jsp"><%=cxsubmenu[i][j]%></a>
                 </td>
            </tr>
            <% }}%> 
            <%  if (zdslb.equals("7")) { 
            for(j=0;j<dx[i];j++){ %>
            <tr height="25" align="left" >
                 <td width="8%" align="center"><img src="Images/folder.gif" width="16" height="16" border="0"></td>
                 <td width="92%" onMouseOver="this.style.background='#EEEEEE'" onMouseOut="this.style.background=''">
                    <a href="a.jsp"><%=dxsubmenu[i][j]%></a>
                 </td>
            </tr>
            <% }}%> 
            </table>
            </td>
         </tr>
         </table>
   
   </td>
   </tr>
   <%}%>
  </table>
  <% }  
  if (zdslb.equals("8")) {
      num1=5;
  %>
  <table  width="200" border="0" align="center" cellpadding="0" cellspacing="0">
  <% for(i=0;i<num1;i++) {
  %> <tr  >
      <td align="left" width="200"><a href="Javascript:ShowTR(img<%=i%>,OpenRep<%=i%>)">
          <img src="Images/jia.gif" border="0"  id="img<%=i%>"></a>
          <a href="Javascript:ShowTR(img<%=i%>,OpenRep<%=i%>)"><%=cdxzds[i]%></a>  
      </td>
   </tr>
   <tr id="OpenRep<%=i%>" style="display:none;">
   <td>
         <table>
         <tr>
            <td   align="center">
            <table width="90%" border=0 cellspacing=0 cellpadding=0>
            <% 
            for(j=0;j<hc70t[i];j++){%>
            <tr height="25" align="left" >
                 <td width="8%" align="center"><img src="Images/folder.gif" width="16" height="16" border="0"></td>
                 <td width="92%" onMouseOver="this.style.background='#EEEEEE'" onMouseOut="this.style.background=''"><a href="a.jsp">
                 <%=hc70tmenu[i][j]%></a></td>
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
  </body>
</html>
