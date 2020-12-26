<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'frist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    	<% String str="欢迎您，"+(String)session.getAttribute("usertrue");
    	if (((String)session.getAttribute("deptment")).equals("1"))  { str=str+"，段领导";}
        if (((String)session.getAttribute("deptment")).equals("21")) { str=str+"，部门：验收室";}
        if (((String)session.getAttribute("deptment")).equals("22")) { str=str+"，部门：技术科";}
        if (((String)session.getAttribute("deptment")).equals("23")) { str=str+"，部门：调度科";}
        if (((String)session.getAttribute("deptment")).equals("24")) { str=str+"，部门：材料科";}
        if (((String)session.getAttribute("deptment")).equals("25")) { str=str+"，部门：质检科";}
        if (((String)session.getAttribute("deptment")).equals("41")) { str=str+"，部门：郑州检修车间";}
        if (((String)session.getAttribute("deptment")).equals("42")) { str=str+"，部门：月山检修车间";}
        if (((String)session.getAttribute("deptment")).equals("43")) { str=str+"，部门：洛阳检修车间";}
        if (((String)session.getAttribute("deptment")).equals("admin")) { str=str+"，系统管理员";}
        if (((String)session.getAttribute("zw")).equals("1"))  str=str+"，车间领导。"; 
        else { 	if (((String)session.getAttribute("zw")).equals("2"))  str=str+"，计工员。";
                else  { if(((String)session.getAttribute("zw")).equals("3"))  str=str+"，安全员。";
                         else { if(((String)session.getAttribute("zw")).equals("4"))  str=str+"，技教员。";
                                else {if (((String)session.getAttribute("zw")).equals("5"))  str=str+"，材料员。";
                                      else { if (((String)session.getAttribute("zw")).equals("6"))  str=str+"，技术专职。";
                                            else {if (((String)session.getAttribute("zw")).equals("7"))  str=str+"，生产调度。";
                                                  else {if (((String)session.getAttribute("zw")).equals("8"))  str=str+"，工长。";
                                                        else str=str+"。";
                                                        }
                                                 }
                                            }
                                      }
                              }
                       }
              }
    	
    	out.print(str);

    	 %>

  </body>
</html>
