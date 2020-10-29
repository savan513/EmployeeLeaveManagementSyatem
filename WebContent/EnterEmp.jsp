<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.dao.EmployeeDao,com.bean.Employee,java.util.*,java.io.*" isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
InputStream inputstream=null;
String btn=request.getParameter("Edit");
String imgedit=null;
imgedit=request.getParameter("EditEmpDP");
String register=request.getParameter("Register");
if(btn!=null)
{
	String id=request.getParameter("id");
	String fname= request.getParameter("F_Name");
	String lname= request.getParameter("L_Name");
	String Gender = request.getParameter("Gender");
	String Email = request.getParameter("Email");
	String Mobile_NO=request.getParameter("Mobile_No");
	String Pass= request.getParameter("Pass");
	Employee Emp=new Employee(Integer.parseInt(id),fname,lname,Email,Mobile_NO,Gender,Pass);
	int i=EmployeeDao.Edit(Emp);
	if(i>0)  
		response.sendRedirect("Home.jsp");  
}

if(register!=null)
{
	Employee Emp=new Employee();
	Emp.setF_Name(request.getParameter("F_Name"));
	Emp.setL_Name(request.getParameter("L_Name"));
	Emp.setGender(request.getParameter("Gender"));
	Emp.setEmail(request.getParameter("Email"));
	Emp.setMobile_NO(request.getParameter("Mobile_No"));
	Emp.setPass(request.getParameter("Pass"));
	int i=EmployeeDao.Register(Emp);
	if(i>0)  
		response.sendRedirect("index.jsp");  	
}
  
%>  
</body>
</html>