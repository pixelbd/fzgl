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
    	<% String str="��ӭ����"+(String)session.getAttribute("usertrue");
    	if (((String)session.getAttribute("deptment")).equals("1"))  { str=str+"�����쵼";}
        if (((String)session.getAttribute("deptment")).equals("21")) { str=str+"�����ţ�������";}
        if (((String)session.getAttribute("deptment")).equals("22")) { str=str+"�����ţ�������";}
        if (((String)session.getAttribute("deptment")).equals("23")) { str=str+"�����ţ����ȿ�";}
        if (((String)session.getAttribute("deptment")).equals("24")) { str=str+"�����ţ����Ͽ�";}
        if (((String)session.getAttribute("deptment")).equals("25")) { str=str+"�����ţ��ʼ��";}
        if (((String)session.getAttribute("deptment")).equals("41")) { str=str+"�����ţ�֣�ݼ��޳���";}
        if (((String)session.getAttribute("deptment")).equals("42")) { str=str+"�����ţ���ɽ���޳���";}
        if (((String)session.getAttribute("deptment")).equals("43")) { str=str+"�����ţ��������޳���";}
        if (((String)session.getAttribute("deptment")).equals("admin")) { str=str+"��ϵͳ����Ա";}
        if (((String)session.getAttribute("zw")).equals("1"))  str=str+"�������쵼��"; 
        else { 	if (((String)session.getAttribute("zw")).equals("2"))  str=str+"���ƹ�Ա��";
                else  { if(((String)session.getAttribute("zw")).equals("3"))  str=str+"����ȫԱ��";
                         else { if(((String)session.getAttribute("zw")).equals("4"))  str=str+"������Ա��";
                                else {if (((String)session.getAttribute("zw")).equals("5"))  str=str+"������Ա��";
                                      else { if (((String)session.getAttribute("zw")).equals("6"))  str=str+"������רְ��";
                                            else {if (((String)session.getAttribute("zw")).equals("7"))  str=str+"���������ȡ�";
                                                  else {if (((String)session.getAttribute("zw")).equals("8"))  str=str+"��������";
                                                        else str=str+"��";
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
