<%@ page language="java" import="java.util.*,java.io.*"
	pageEncoding="GB18030"%>
<%
	String path=request.getParameter("path");
	path=new String(path.getBytes("iso-8859-1"));
	File file = new File(path);
	InputStream in = new FileInputStream(file);
	OutputStream os = response.getOutputStream();
	response.addHeader("Content-Disposition", "attachment;filename="
			+ new String(file.getName().getBytes("gbk"),"iso-8859-1"));
	response.addHeader("Content-Length", file.length() + "");
	response.setCharacterEncoding("utf-8");
	response.setContentType("application/octet-stream");
	int data = 0;
	while ((data = in.read()) != -1) {
		os.write(data);
	}
	os.close();
	in.close();
%>
