<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dao.EmployeeDao,com.bean.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Proccessing</title>
</head>
<body>
<%
		String button1 = request.getParameter("emp");
		String button2 = request.getParameter("admin");
		if(button1!= null)
		{
			int i=EmployeeDao.login(request.getParameter("E_Email"), request.getParameter("E_Pass"));
					 
			if(i==0)
			{
				request.setAttribute("errorMessage", "Invalid user or password or Make Sure You have Registred");
	             RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
	             rd.forward(request, response); 

			}
			else
			{

				HttpSession ss =request.getSession();
				ss.setAttribute("Id", i);
				response.sendRedirect("Home.jsp"); 
				
			}
		}
		else if(button2!=null)
		{
			
		}

%>
</body>
</html>