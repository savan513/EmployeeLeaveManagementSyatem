<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="com.dao.*,com.bean.*" %>
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
Id=(Integer)session.getAttribute("Id");
Employee E =EmployeeDao.checkit(Id);

LeaveRequest l=new LeaveRequest();
l.setF_Name(E.getF_Name());
l.setL_Name(E.getL_Name());
l.setE_id(Id);
l.setType(request.getParameter("LType"));
l.setFrom_Date(request.getParameter("From_Date"));
l.setTo_Date(request.getParameter("To_Date"));
l.setReason(request.getParameter("LeaveDescriiption"));
l.setStatus("0");
int j=LeaveRequestDao.Apply(l);
if(j>0){
System.out.println("In");
Project p=new Project();
 p.setTitle(request.getParameter("Title"));
 p.setTechnology(request.getParameter("Technology"));
 p.setDescription(request.getParameter("Descriiption"));
 p.setE_id(Id);
 int i=ProjectDao.EnterProject(p);
 if(i>0)
	 response.sendRedirect("Home.jsp");
 }
%>
</body>
</html>