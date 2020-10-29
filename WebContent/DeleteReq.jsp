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
if(session.getAttribute("Id")==null)
{
    response.sendRedirect("index.jsp");
    
}
Integer Id;
Id=Integer.parseInt(request.getParameter("IdR"));
int i= LeaveRequestDao.deleteReq(Id);
if(i>0)
	response.sendRedirect("Home.jsp");

%>
</body>
</html>