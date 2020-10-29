<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.*,com.bean.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
	.desk
	{
		background-image:url('image/AdminPanel.jpg');width:100%;height:400px;
		background-size:cover;
		background-repeat:no-repeat;
	}
	.filterable {
    margin-top: 15px;
}
.filterable .panel-heading .pull-right {
    margin-top: -20px;
}
.filterable .filters input[disabled] {
    background-color: transparent;
    border: none;
    cursor: auto;
    box-shadow: none;
    padding: 0;
    height: auto;
}
.filterable .filters input[disabled]::-webkit-input-placeholder {
    color: #333;
}
.filterable .filters input[disabled]::-moz-placeholder {
    color: #333;
}
.filterable .filters input[disabled]:-ms-input-placeholder {
    color: #333;
}
	
</style>
</head>
<body>
<%
          response.addHeader("Cache-Control","no-cache,no-store,must-revalidate");//prevent back button
          if(session.getAttribute("AdminId")==null)
          {
              response.sendRedirect("index.jsp");
              
          }
         
          
     %>
        
	<div class="desk" >
		<div class="row" style="float:right;margin:20px;">
			<a href="AdminLogout.jsp"><button class="btn btn-warning"  style="font-weight:bold;width:150px;height:50px;">LogOut</button></a>
		</div>
		<div class="row">
				
				
				<div class="col-md-3"><button id="Re" class="btn btn-success" style="margin-top:100px;width:300px;height:100px;font-weight:bold;margin-left:260px;"><i class="fa fa-table" aria-hidden="true"></i> Leave Request</button></div>
				<button id="ME" class="col-md-3 btn btn-primary" style="margin-top:100px;width:250px;height:100px;font-weight:bold;margin-left:560px;"><i class="fa fa-user" aria-hidden="true"></i> My Employee</button>
		</div>
	</div>
	<div class="container">
		
   
    <div class="row">
    	
        <div style="display:none;" class="panel panel-primary filterable" id="EmpTable">
        		<%
			List<Employee> le=EmployeeDao.fetchemp();
			
			%>
            <div class="panel-heading">
                <h3 class="panel-title">Employees</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                </div>
            </div>
            <table class="table">
                <thead>
                    <tr class="filters">
                        <th><input type="text" class="form-control" placeholder="Id" disabled></th>
                        <th><input type="text" class="form-control" placeholder="First Name" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Last Name" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Email" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Mobile No" disabled></th>
                        <th><input type="text" class="form-control" placeholder="About Salary" disabled></th>
                    </tr>
                </thead>
                <tbody>
                	 <%
        	for(Employee e: le)
        	{
        		int EID= e.getId();
        		request.setAttribute("EID", EID);
        %>
            <tr>
                <td><%=e.getId() %></td>
                <td><%=e.getF_Name() %></td>
                <td><%=e.getL_Name() %></td>
                <td><%=e.getEmail() %></td>
                <td><%=e.getMobile_NO() %></td>
                <td><a href="SalaryCount.jsp?EID=${EID }"><button class="btn btn-warning"><i class="fa fa-file" aria-hidden="true"></i> Salary Slip </button></a></td>
                
            </tr>
          <%} %>      
                </tbody>
            </table>
        </div>
        <div style="margin-top:5px;" id="Emprequest" class="panel panel-primary filterable">
        	<%
			List<LeaveRequest> lr=LeaveRequestDao.ShowAllData();
			
			%>
            <div class="panel-heading">
                <h3 class="panel-title">Leaves</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                </div>
            </div>
            <table class="table">
                <thead>
                    <tr class="filters">
                        <th><input type="text" class="form-control" placeholder="A_No" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Emp_Id" disabled></th>
                        <th><input type="text" class="form-control" placeholder="First Name" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Last Name" disabled></th>
                       <!--  <th><input type="text" class="form-control" placeholder="Email" disabled></th> -->
                        <th><input type="text" class="form-control" placeholder="From" disabled></th>
                        <th><input type="text" class="form-control" placeholder="To" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Type" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Reason" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Action" disabled></th>
                    </tr>
                </thead>
                <tbody>
                	 <%
        	for(LeaveRequest l: lr)
        	{
        		int Id = l.getNo();
        		request.setAttribute("Id", Id);
        %>
            <tr>
            	<td><%=l.getNo() %></td>
                <td><%=l.getE_id() %></td>
                <td><%=l.getF_Name() %></td>
                <td><%=l.getL_Name() %></td>
               <!--  <td></td> -->
                <td><%=l.getFrom_Date()%></td>
                <td><%=l.getTo_Date() %></td>
                <td><%=l.getType() %></td>
                <td><%=l.getReason() %></td>
                <td><a href="ActionOnReq.jsp?IdA=${Id }" class="btn btn-success" id="Approve"><i class="fa fa-check" aria-hidden="true"></i></a> <a href="ActionOnReq.jsp?IdC=${Id }" class="btn btn-danger" id="Cancel" name="Cancel"><i class="fa fa-times" aria-hidden="true"></i> </a></td>
                
            </tr>
          <%} %>      
                </tbody>
            </table>
        </div>
    </div>
	</div>
	<script src="js/jquery.js"></script>
	<script>
	
	$(document).ready(function(){
	    $('.filterable .btn-filter').click(function(){
	        var $panel = $(this).parents('.filterable'),
	        $filters = $panel.find('.filters input'),
	        $tbody = $panel.find('.table tbody');
	        if ($filters.prop('disabled') == true) {
	            $filters.prop('disabled', false);
	            $filters.first().focus();
	        } else {
	            $filters.val('').prop('disabled', true);
	            $tbody.find('.no-result').remove();
	            $tbody.find('tr').show();
	        }
	    });

	    $('.filterable .filters input').keyup(function(e){
	        /* Ignore tab key */
	        var code = e.keyCode || e.which;
	        if (code == '9') return;
	        /* Useful DOM data and selectors */
	        var $input = $(this),
	        inputContent = $input.val().toLowerCase(),
	        $panel = $input.parents('.filterable'),
	        column = $panel.find('.filters th').index($input.parents('th')),
	        $table = $panel.find('.table'),
	        $rows = $table.find('tbody tr');
	        /* Dirtiest filter function ever ;) */
	        var $filteredRows = $rows.filter(function(){
	            var value = $(this).find('td').eq(column).text().toLowerCase();
	            return value.indexOf(inputContent) === -1;
	        });
	        /* Clean previous no-result if exist */
	        $table.find('tbody .no-result').remove();
	        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
	        $rows.show();
	        $filteredRows.hide();
	        /* Prepend no-result row if all rows are filtered */
	        if ($filteredRows.length === $rows.length) {
	            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
	        }
	    });
	});
	$("#Re").click(function(){
		$("#Emprequest").show();
		$("#EmpTable").hide();
	});
	$("#ME").click(function(){
		$("#Emprequest").hide();
		$("#EmpTable").show();
	});
	</script>
</body>
</html>