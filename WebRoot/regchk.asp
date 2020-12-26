<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="conn/conn.asp"-->
<!--#include file="md5.asp"-->
<%
   username=request.Form("username")
   pass1=request.Form("pass1")
   pass1=md5(pass1)
   truename=request.Form("truename")
   sex=request.Form("sex")
   birthday=request.Form("birthday")
   tel=request.Form("tel")
   qq=request.Form("qq")
   question=request.Form("question")
   answer=request.Form("answer")
   email=request.Form("email")
   address=request.Form("address")
   set rs=server.CreateObject("adodb.recordset")
		'锁定指定记录通过with(updlock)完成。
		sql="select id from guest with(updlock)"
		rs.open sql,conn,1,3
		'将日期转换为YYYYMMDD格式的字符串
		if len(month(date()))=1 then
			cmonth="0"& cstr(month(date()))
		else
			cmonth=cstr(month(date()))
		end if
		if len(day(date()))=1 then
		cday="0"& cstr(day(date()))
		else
		cday=cstr(day(date()))
		end if
		if not rs.eof then 
			set rs_M=server.CreateObject("adodb.recordset")
			sql1="select max(id) as id from guest"
			rs_M.open sql1,conn,1,3
			str=rs_M("id")
			cno = right(cstr(int(mid(str,11,5))+100001),5)
			intno=cstr(year(date()))&cmonth&cday&cno '组成新的数据编号
			id=intno
		else
			id = cstr(year(date()))&cmonth&cday&"00000"
		end if
		
		on error resume next				'启动错误处理程序

if username<>"" then
	set rs=server.createobject("adodb.recordset")
	rs1="select * from guest where name='"&username&"'"
	rs.open rs1,conn,1,3
	if rs.eof and rs.bof then 
		rs1="insert into guest (id,name,pwd) values('"&id&"','"&username&"','"&pass1&"',)"
		conn.execute(rs1)
		%>
			<script language="javascript">
				alert("用户注册成功！！");
                   session("name") = name;
				window.location.href="main.asp";
			</script>
		   <%
	   else%>
				<script language="javascript">
		        alert("此用户已存在！！");
		         window.location.href="register_1.asp";
		</script>	   
	  <% end if 
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
</head>

<body>

</body>
</html>
