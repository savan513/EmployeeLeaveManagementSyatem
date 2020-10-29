<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.*,com.bean.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Saving Salary</title>
</head>
<body>
	<%
	 response.addHeader("Cache-Control","no-cache,no-store,must-revalidate");//prevent back button
     if(session.getAttribute("AdminId")==null)
     {
        response.sendRedirect("index.jsp");
     	
     }
     Cookie cookie = null;
     Cookie[] cookies = null;
     
  
     cookies = request.getCookies();
     String EmployeeId="";
     if( cookies != null ) {
        
   
           cookie = cookies[1];
           String Name= cookie.getName( );
           EmployeeId=cookie.getValue();
           
     } else {
        out.println("<h2>No cookies founds</h2>");
     }
     SalaryDetails Sd=new SalaryDetails();
     Sd.setE_Id(Integer.parseInt(EmployeeId));
     Sd.setUrgent_Leaves(Integer.parseInt(request.getParameter("Urgent")));
     Sd.setNormal_Leaves(Integer.parseInt(request.getParameter("Normal")));
     Sd.setActual_Salary(Double.parseDouble(request.getParameter("ASalary")));
     Sd.setTotal_Salary(Double.parseDouble(request.getParameter("TSalary")));
     int i=SalaryDetailsDao.Save_Salary(Sd);
     if(i>0)
    	 response.sendRedirect("AdminPanel.jsp");
	%>
</body>
</html>