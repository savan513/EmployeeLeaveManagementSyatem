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
         Project p=new Project();
      	 p.setTitle(request.getParameter("Title"));
      	 p.setTechnology(request.getParameter("Technology"));
      	 p.setDescription(request.getParameter("Descriiption"));
      	 p.setE_id(Id);
      	 int i=ProjectDao.EnterProject(p);
      	 if(i>0)
      		 out.print("Success");
          
     %>
        
</body>
</html>