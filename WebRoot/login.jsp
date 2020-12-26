<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录辅助管理系统...</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
    <!--
INPUT.Style_button {
	  BORDER-RIGHT: #4E759C 1px solid; BORDER-TOP: #4E759C 1px solid; FONT-SIZE: 9pt; 
	  BACKGROUND: #EFEFEF; BORDER-LEFT: #4E759C 1px solid; COLOR: #4E759C; BORDER-BOTTOM: #4E759C 1px solid;HEIGHT: 20px;width: 60px
       }
.word{
font-family: "宋体";
	font-size: 10pt;
	color:#4E759C;
}
.input {
	font-family: "宋体";
	font-size: 9pt;
	color: #333333;
	width:150;
	border: 1px solid #999999;
}
.body {
	margin-left: 0px;
	margin-top: 0px;
}
    -->  
     </style>

  </head>

  <body class="body">
   
 <form name="form1" method="post" action="check2.jsp">
 <table border="0" cellpadding="0" cellspacing="0" align="center" valign="center" width="454" height="334" background="Images/logbg.gif">
            <tr height="200" valign="bottom">
            <td width="167" align="right"><div  ><span ><br></span></div></td>
            <td  valign="bottom" align="right"><span class="word">用户名</span></td>
            <td  colspan="2" align="left"><div ><input name="usrname" type="text" id="name" size="16"  class="input">
              </div></td>
            </tr>
            <tr>
            <td width="167" align="right"><div ><span class=""><br></span></div></td>
             <td valign="middle" align="right"><span class="word">密&nbsp;&nbsp;码</span></td>
             <td align="left" valign="middle" colspan="2"><div><input name="psword" type="password" id="psw" size="16" class="input">
                    </div></td>
             </tr>
             <tr>  <td width="167" align="right"><div  ><span class="STYLE2"><br></span></div></td>
                  <td  valign="top" align="right"><input type="submit" name="button"  class="Style_button" value="登  录"></td>
                  <td valign="top" align="center"><input type="reset" name="button2"  class="Style_button" value="重  填"></td>
                  <td valign="top" align="left"><input name="myclose" type="button" class="Style_button"  value="关&nbsp;&nbsp;闭"
				 onClick="javascrip:window.close()"></td>
           </tr>
           </table >
    </form>
    
  </body>
</html>
