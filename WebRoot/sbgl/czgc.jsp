<%@ page language="java" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>设备操作规程</title>
    
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
  // String zds[]={"厂修","段修","70t级货车段修","X2H、X2K全面检查修","DL1型车段修","转K2提速改造","8B/8AB完善改造"};
  String sbfl1[]={"金属切削机床（0类）"," 锻压剪冲设备（一类）" ,"动力设备（二类）","电气设备（三类）","起重运输设备（四类）","工作炉金属处理设备（五类）","木工铸工设备（六类）","试验设备（七类）","工程机械（八类）","杂项设备（九类）"};//设备分类2按属性使用分,设备本身类别
  String sbfl2[]={"转向架","现车" ,"制动室","制动梁","配件","钩缓","轮轴"};//设备分类1按设备使用情况分,修车工艺
  
  //按设备属性分类项目
  int fl1[]={29,30,15,10,32,3,4,53,1,23};
  String fl1submenu[][]={
                  {"台式车床","普通车床","数控车轮车床","数控轴颈车床","立式钻床","摇臂钻床","镗床",
                   "万能工具磨床","立式铣床","卧式万能铣床","钩耳孔铣孔镶套组合机","钩体钩尾框扁销孔铣孔机","牛头刨床","闸瓦托铣床",
                   "钩舌铣床","标志牌自动打号机","三通阀研磨机","台式钻床","螺栓套丝机","砂轮机","金属弓锯机",
                   "WTX-2型闸瓦托铣床","SG-803/2数控外圆磨床","H405B数控外圆磨床","数控车轴车床、车轴轴端面三孔专用机床","钩缓装置四孔铣床","立式车床","外圆磨床","轴颈车磨床"},
                  {"电动空气锤","单柱校正液压机","四柱压力机","微机控制轴承压装机（WY）","轴承退卸机","轴承拆罩机","开式双柱可倾压力机",
                   "钩缓成套分解机","钩缓成套组装机","移动式钩缓拆装机","液压铆钉机","上心盘液压铆钉机","液压侧架铆钉机","剪板机","联合剪冲机","龙门调直器","货车综合调梁机","货车车辆整形机",
                   "弹簧试压机","手动液压机","调牵引梁液压小车","轴承密封罩拆卸机","三通阀组装分解工作台","二号簧分解组装机","钩缓组装机（13号车钩）","17号钩缓组装机",
                   "滚动轴承退卸机（70吨）","缓冲器分解组装压吨机","轴承压装机（70吨）","轮轴压装机"},
                  {"燃煤蒸汽锅炉","燃油锅炉","茶炉、开水炉","活塞式空气压缩机","蜗杆空气压缩机","离心泵","离子交换器",
                   "太阳能热水器","储风缸","离心通风机","排风扇","特利II气","地源热泵空调系统（水井）",
                   "地源热泵空调系统(地埋)","常压锅炉"},
                  {"充电机","交流电焊机","直流电焊机","心盘自动保护焊机（连云港）","钩舌自动埋弧焊机","心盘自动保护焊机（浙江大学）","硅整流弧焊机","CO2气体保护焊机",
                   "焊接机器人及夹具","支撑座自动焊接装置"},
                  {"电动双梁桥式起重机","电动单梁桥式起重机（地操）","电动单梁桥式起重机（空操）","平衡吊","柱式吊","风动架车机","电动架车机","电动液压架车机",
                   "内燃叉车","摇枕侧架翻转机","输送机","升降平台","电动葫芦（提升机）","轨道车","电瓶车","电瓶机车","台车转盘","制动梁检修线","缓冲器传送线",
                   "车钩检修流水线","钩尾框输送机","风动转轮器","电动转轮器"
                   ,"卷扬机","制动阀传送线","智能组合电动扳机","货车车体翻转机","转向架流水线设备","转向架弹簧托板拆分装置","ZZB-800DC型智能组合电动扳机单柜双机","门式起重机","电瓶叉车"},
                  {"台车电阻炉","焖火炉","锻工炉"},
                  {"双钩抛丸除锈机","单钩抛丸除锈机","循环回收式喷砂机","摇枕侧架抛丸除锈机"},
                  {"多通道超声波探伤仪","微机超声波自动探伤仪","DCF-S型钩舌磁粉探伤机","DCF-K型钩尾框磁粉探伤机","DCF-L型制动梁端轴磁粉探伤机","钩舌磁粉探伤机","摇枕侧架磁粉探伤机",
                  "轮对荧光磁粉探伤机","6000型轴承环形件磁粉探伤机","微机控制单车试验器"
                  ,"列车自动试风装置","WLS-II微控列车自动试风装置","705（701）微机控制试验台","软管水压试验器","轮对磨合机","轴承不分解诊断仪","制动梁拉力试验器","120阀试验台",
                  "轮对自动检测装置","枕簧自动检测装置","棚车漏雨试验装置","闸调器试验台","多阀试验台","交叉杆荧光磁粉探伤机","制动梁自动检测机",
                  "圆扁销荧光磁粉探伤机","呼吸阀试验台","制动梁端轴磁粉探伤机(流水线)设备","车钩零件探伤机设备","空重车自动调整装置试验台设备"
                  ,"罐车（球阀）试验台设备","通过式钩舌磁粉探伤机设备","TDH-2型微控单车试验器","微控轮对磨合机(ZMIIB-600)",
                  "转向架压吨试验机","转K2正位检测组装台","CJW-H型摇枕侧架磁粉探伤机","WSDC-III型微控单车试验器","钩尾框磁粉探伤机（CJW-4000）设备","600型轴承滚子磁粉探伤机"
                  ,"车轮轮辋缺陷检测装置","车轴测量机","车轴荧光磁粉探伤机","轮对动平衡试验及去重设备","轴颈磁粉探伤机","缓冲器翻转测量机","缓冲器落锤试验机",
                  "拉杆（链）检测机","旁承试验机","软管水压试验（RGJ-1）器"
                  ,"制动梁自动测量机（JC-2000）","轴承内径测量仪","轴承智能存取库设备"},
                  {"内燃装载机"},
                  {"轴承注脂机","电脑计量加油机","轴承脱脂除锈机","三通阀清洗机","轴承成套清洗机","轮对除锈清洗机","污水处理系统","气浮机","工业废水处理机","转向架清洗机"
                  ,"三通阀超声波清洗机","三通阀清洗台","焊接烟尘净化器（赫尔）","车体抛丸除锈机","无气喷涂机","制动梁端轴定位机","上旁承组对装置","TD-Ⅱ型制动梁检修线和端轴自动除锈机",
                  "组对夹具","钩尾框喷漆烘干室","钩尾框抛丸除锈机","通用型转向架组装胎具","制动梁抛丸除锈机"}
                  };
  //按设备使用处所分类项目

  int fl2[]={28,21,14,5,3,18,15};
  String fl2submenu[][]={
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

  int i,j=0;
  int num1=0;
  int temp=100;
  //str:提示性文字，做为主显示区的标题
  String str="";
 
  //czgclb变量:确定是按属性分类，还是按使用处所分类
  //czgzhtml变量：确定实际操作规程Html文件的名称，菜单选择后传递变量，在主显示区直接根据传递的Html文件名显示
  //item变量:确定子选择项
  String czgclb="1";
  String czgcno="1";
  String czgchtml="";
  String item="";
  if (request.getParameter("item")!=null) item=new String(request.getParameter("item"));
  if (request.getParameter("czgcno")!=null) czgcno=new String(request.getParameter("czgcno"));

  if (czgclb.equals("1")) { str="按设备属性分类"; }
  if (czgclb.equals("2")) { str="设备分类2"; }  

%> 
<table width="100%" align="center"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td width="182"  valign="top"> 
    <!-- 菜单显示区，根据czgclb决定显示哪个类别的操作规程菜单 -->
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
        <!-- 这里是菜单 -->
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
        <!-- 菜单结束 -->
       </td>
      </tr>
    </table>
    <!-- end of left  -->
	</td>
    <td valign="top"> 
    <!-- 主显示区，显示操作规程内容 -->
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
          <!-- 这里开始显示操作规程内容 -->
          <table border="0" cellpadding="0" cellspacing="0" width="100%">
           <tr> 
             <td width="13" height="63" background="Images/czgc/left.gif">&nbsp;</td>
             <td height="63" background="Images/czgc/zdsbg.gif">设备操作规程内容
             </td>
             <td width="13" height="63" background="Images/czgc/right.gif">&nbsp;</td>
          </tr>
          <tr>
             <td width="13" >&nbsp;</td>
             <td><div>
             <!-- 调入作业指导书 -->
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
