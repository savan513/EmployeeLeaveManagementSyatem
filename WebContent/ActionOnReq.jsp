<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.*,com.bean.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

response.addHeader("Cache-Control","no-cache,no-store,must-revalidate");//prevent back button
if(session.getAttribute("AdminId")==null)
{
    response.sendRedirect("index.jsp");
    
}
	String IDA=request.getParameter("IdA");
	String IDC=request.getParameter("IdC");
	
	if(IDA!=null)
	{
		int i=LeaveRequestDao.Approve(Integer.parseInt(IDA));
		if(i>0)
			response.sendRedirect("AdminPanel.jsp");
	}
	else if(IDC!=null)
	{
		int i=LeaveRequestDao.Cancel(Integer.parseInt(IDC));
		if(i>0)
			response.sendRedirect("AdminPanel.jsp");
	}
%>
</body>
</html>