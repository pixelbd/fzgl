
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<HTML>
  <HEAD>
    <title>WEBҳ�浼��ΪEXCEL�ĵ��ķ���
    </title>
  </HEAD>
<body>
<BR>
<table id = "PrintA" width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor = "#61FF13">
<TR style="text-align : center;">
 <TD>��Ԫ��A</TD>
 <TD>��Ԫ��A</TD>
 <TD>��Ԫ��A</TD>
 <TD>��Ԫ��A</TD>
</TR>
<TR>
 <TD colSpan=4 style="text-align : center;"><font color="BLUE" face="Verdana">��Ԫ��ϲ���A</FONT></TD>
</TR>
</TABLE>
<BR>
<table id = "PrintB" width="100%" border="1" cellspacing="0" cellpadding="0">
<TR style="text-align : center;">
 <TD>��Ԫ��B</TD>
 <TD>��Ԫ��B</TD>
 <TD>��Ԫ��B</TD>
 <TD>��Ԫ��B</TD>
</TR>
<TR>
 <TD colSpan=4 style="text-align : center;">��Ԫ��ϲ���B</TD>
</TR>
</TABLE>
<br><br><br>
<input type="button" onclick="javascript:AllAreaWord();" value="����ҳ��ָ���������ݵ�Word">
<input type="button" onclick="javascript:AllAreaExcel();" value="����ҳ��ָ���������ݵ�Excel">
<input type="button" onclick="javascript:CellAreaExcel();" value="��������Ԫ�����ݵ�Excel">
<SCRIPT LANGUAGE="javascript">
 //ָ��ҳ���������ݵ���Excel
 function AllAreaExcel() 
 {
  var oXL = new ActiveXObject("Excel.Application"); 
  var oWB = oXL.Workbooks.Add(); 
  var oSheet = oWB.ActiveSheet;  
  var sel=document.body.createTextRange();
  sel.moveToElementText(PrintA);
  sel.select();
  sel.execCommand("Copy");
  oSheet.Paste();
  oXL.Visible = true;
 }
 //ָ��ҳ�����򡰵�Ԫ�����ݵ���Excel
 function CellAreaExcel() 
 {
  var oXL = new ActiveXObject("Excel.Application"); 
  var oWB = oXL.Workbooks.Add(); 
  var oSheet = oWB.ActiveSheet; 
  var Lenr = PrintA.rows.length;
  for (i=0;i<Lenr;i++) 
  { 
   var Lenc = PrintA.rows(i).cells.length; 
   for (j=0;j<Lenc;j++) 
   { 
    oSheet.Cells(i+1,j+1).value = PrintA.rows(i).cells(j).innerText; 
   } 
  } 
  oXL.Visible = true; 
 }

 //ָ��ҳ���������ݵ���Word
 function AllAreaWord()
 {
  var oWD = new ActiveXObject("Word.Application");
  var oDC = oWD.Documents.Add("",0,1);
  var oRange =oDC.Range(0,1);
  var sel = document.body.createTextRange();
  sel.moveToElementText(PrintA);
  sel.select();
  sel.execCommand("Copy");
  oRange.Paste();
  oWD.Application.Visible = true;
  //window.close();
 }
</SCRIPT>
</body></html>

��������:http://www.knowsky.com/302647.html