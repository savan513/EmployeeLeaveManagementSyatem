<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.*,com.bean.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Salary Count</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%
          response.addHeader("Cache-Control","no-cache,no-store,must-revalidate");//prevent back button
          if(session.getAttribute("AdminId")==null)
          {
              response.sendRedirect("index.jsp");
              
          }
         int e_id = Integer.parseInt(request.getParameter("EID"));
         Employee E = EmployeeDao.checkit(e_id);
         
         Cookie c=new Cookie("E_id",request.getParameter("EID"));
         c.setMaxAge(60*60*24);
         response.addCookie(c);
	     Long urgent=LeaveRequestDao.CountLeave(e_id, "Urgent");
	     request.setAttribute("Urgent", urgent);
	     Long noramlleave=LeaveRequestDao.CountLeave(e_id, "Normal Leave");
	     request.setAttribute("Normal",noramlleave);
         
     %>
     <div class="container">
     	<div>
     			<h1 style="color:red;text-align:center">Employee  Salary Management </h1>
     	</div>
     	<div style="width:900px;height:150px;padding:30px;border:2px solid green;margin-left:100px;">
     			<h3 style="float:left;color:green;">Employee Name : </h3> <h4 style="margin-left:260px;margin-top:5px;color:purple;"><%=E.getF_Name() %> <%=E.getL_Name() %></h4>
     			<h3 style="float:left;color:green;">Employee Mobile No : </h3> <h4 style="margin-left:300px;margin-top:11px;color:purple;"><%=E.getMobile_NO() %></h4>
     			
     	</div>
     	<form  action="SaveSalary.jsp?" method="Post">
     		<table style="margin-left:180px;margin-top:10px;">
     				<tr>
     					<td><h3 style="float:left;color:orange;">Employee Actual Salary : </h3></td>
     					<td><input type="text" name="ASalary" id="ASal" style="border-radius:5px;color:blue;padding:5px;font-weight:bold;"></td>
     				</tr>
     				<tr>
     					<td><h3 style="float:left;color:orange;">Employee Urgent Leave : </h3></td>
     					<td><input type="text" name="Urgent" id="Urgent" value="${Urgent }" style="border-radius:5px;font-weight:bold;color:blue;padding:5px;"></td>
     				</tr>
     				<tr>
     					<td><h3 style="float:left;color:orange;">Employee Normal Leave : </h3></td>
     					<td><input type="text" name="Normal" id="Normal" value="${Normal }" style="border-radius:5px;color:blue;font-weight:bold;padding:5px;"></td>
     				</tr>
     				
     				
     			</table>
				
				<h3 style="float:left;color:blue;margin-left:130px;margin-top:10px;">Employee Total Salary : </h3><input type="text" id="Ts" name="TSalary" style="margin-top:16px;margin-left:60px;font-size:22px;color:maroon;font-weight:bold;padding:10px;"></input><b style="font-size:20px;color:purple;">Rs.</b>
     		
     		<input type="Submit" value="Save" class="btn btn-primary">
     	</form>
				
     </div>
     <script src="js/jquery.js"></script>
     <script>
     	$("#ASal").focusout(function(){
     		var As= parseFloat(document.getElementById("ASal").value);
     		
     		var Ul= parseFloat(document.getElementById("Urgent").value);
     		
     		var Nl= parseFloat(document.getElementById("Normal").value);
     		
     		var TS=As-200*Ul-100*Nl;
     		
     		document.getElementById("Ts").value=TS;
     	});
     </script>
</body>
</html>
