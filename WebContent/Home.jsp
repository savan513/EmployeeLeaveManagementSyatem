<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dao.EmployeeDao,com.bean.Employee"%>

<%@page import="com.dao.*,com.bean.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<script>
  function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
              $('#img')
                  .attr('src', e.target.result)
                  .width(300)
                  .height(230);
              document.getElementById("sv").disabled = false;
          };

          reader.readAsDataURL(input.files[0]);
      }
  }
  function Display()
  {
	  document.getElementById("divimg").style.visibility="visible";
  }
  function closeit()
  {
	  document.getElementById("divimg").style.visibility="hidden";
  }
  </script>
<title>Home </title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="styleSheet" href="css/EditForm.css">
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
          Employee e = EmployeeDao.checkit(Id);
          
     %>
        
      <div style="background-image:url('image/BackImg.jpg');background-repeat:no-repeat;background-size:cover;width:100%;height:650px;padding:20px;">
      		<div style="display:inline;">
      			<h1 style="color:orange;padding:5px;font-weight:bold;text-align:center;">Hi <%=e.getF_Name()+" "+ e.getL_Name() %></h1>
      		<a href="Logout.jsp" ><button class="btn btn-success" style="float:right;width:150px;height:50px;">Logout</button></a>
      		</div>
      		<div class="row" style="width:1000px;height:500px;border:2px solid;box-shadow: 5px 10px red;background-color:white;margin-left:160px;padding:10px;">
      		<!-- Form -->
      			
      			<form action="EnterEmp.jsp?id=<%=e.getId() %>" method="POST" onsubmit="return fun1()" style="margin-top:60px;margin-left:200px;">
                        			<h2 style="color:blue;padding:5px;font-weight:bold;">Edit Profile Details</h2>
                        			
                        			<div style="float:right">
                        				<img src="image/ImageInsert.png" width="200px" height="200px" style="border:2px solid;box-shdow: 3px 2px green;">
                        				<h3 style="color:purple;font-weight:bold;">Employee</h3>
                        			</div>
                        			 <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="First Name *" value="<%=e.getF_Name() %>" name="F_Name" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Last Name *" value="<%=e.getL_Name() %>" name="L_Name"/>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Password *" value="<%=e.getPass() %>" name="Pass"/>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control"  placeholder="Confirm Password *" value="<%=e.getPass()%>" name="Pass"/>
                                        </div>
                                        
                                    <%
                                    	String g=e.getGender();
                                    %>
                                  <div class="form-group">
                                            <div class="maxl">
                                            	<%if(g.equals("male")) {%>
                                                <label class="radio inline"> 
                                                    <input type="radio" name="Gender" value="male" checked>
                                                    <span> Male </span> 
                                                </label>
                                                <label class="radio inline"> 
                                                    <input type="radio" name="Gender" value="female">
                                                    <span>Female </span> 
                                                </label>
                                                <%} %>
                                                <%if(g.equals("female")) {%>
                                                <label class="radio inline"> 
                                                    <input type="radio" name="Gender" value="male">
                                                    <span> Male </span> 
                                                </label>
                                                <label class="radio inline"> 
                                                    <input type="radio" name="Gender" value="female" checked>
                                                    <span>Female </span> 
                                                </label>
                                                <%} %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="email" class="form-control" placeholder="Your Email *" value="<%=e.getEmail() %>" name="Email" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" minlength="10" maxlength="10" name="Mobile_No" class="form-control" placeholder="Your Phone *" value="<%=e.getMobile_NO() %>" />
                                        </div>
                                        
                                        <input type="submit" class="btnRegister"  value="Edit" name="Edit"/>
                                    </div>
                                </div>
                        		</form>
      		<!-- End Form -->
      		
      </div>
      </div>
      
	<div class="container" style="margin-top:20px;">
		<div class="row">
			<div class="md-4">
				<button class="btn btn-primary" id="apply" style="width:300px;margin-left:70px;height:80px;font-weight:bold;font-size:30;"><i class="fa fa-id-card" style="font-size:20px"></i> Apply For Leave</button>
			</div>
			<div class="md-4">
				<button class="btn btn-warning" id="showleave" style="width:300px;margin-left:60px;height:80px;font-weight:bold;font-size:30;"><i class="fa fa-list" aria-hidden="true" style="font-size:20px"></i> My Leaves</button>
			</div>
			<div class="md-4">
				<button class="btn btn-info" id="Salary" style="width:300px;margin-left:60px;height:80px;font-weight:bold;font-size:30;"><i class="fa fa-money" style="font-size:20px"></i> My Salary</button>
			</div>
		</div>
		<div class="md-10" style="margin-top:10px;">
		<div id="leaveform">
		<div class="page-wrapper bg-red p-t-180 p-b-100 font-robo">
        <div class="wrapper wrapper--w960">
            <div class="card card-2">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title">Apply For Leave</h2>
                    <form method="POST" action="ApplyLeave.jsp">
                       
                        <div class="row row-space">
                            <div class="col-3">
                                <div class="input-group">
                                    <input class="input--style-2 js-datepicker" type="text" placeholder="From" name="From_Date">
                                    <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="input-group">
                                    <input class="input--style-2 js-datepicker" type="text" placeholder="To" name="To_Date">
                                    <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                </div>
                            </div>
                           
                        </div>
                        <div class="input-group">
                            <div class="rs-select2 js-select-simple select--no-search" style="width:100px;">
                                <select name="LType">
                                    <option disabled="disabled" selected="selected">Type</option>
                                    <option>Urgent</option>
                                    
                                    <option>Normal Leave</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group">
                                   
               					 <textarea id="form_message" name="LeaveDescriiption" class="form-control" placeholder="Enter Reason *" rows="4" required data-error="Please,leave us a message."></textarea>
                					
                                </div>
                            </div>
                            <br/>
                        </div>
                         <div class="">
                            <button class="btn btn-primary" id="project">Add Current Project</button>
                       	 </div>
                        <!-- Project Form -->
           <div style="margin-top:10px;margin-top:20px;display:none;" id="projdsc">
  				<h3 style="color:green;font-weight:bold;">Enter Current Project Details</h3>
  		        <div class="messages"></div>
			        <div class="controls">        
            <div class="col-md-8">
              <div class="form-group">
                <label for="form_name">Title *</label>
                <input id="form_name" type="text" name="Title" class="form-control" placeholder="Please enter your Project Name *" required="required" data-error="Firstname is required.">
                <div class="help-block with-errors"></div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="form-group">
                <label for="form_lastname">Technology *</label>
                <input id="form_lastname" type="text" name="Technology" class="form-control" placeholder="Please enter Technology*" required="required" data-error="Lastname is required.">
                <div class="help-block with-errors"></div>
              </div>
            </div>
          </div>
          
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="form_message">Description *</label>
                <textarea id="form_message" name="Descriiption" class="form-control" placeholder="Message for me *" rows="4" required data-error="Please,leave us a message."></textarea>
                <div class="help-block with-errors"></div>
              </div>
            </div>
           
          </div>
 
      		</div>
         				<!-- End Form -->
                        <div class="p-t-30">
                            <button class="btn btn-success" type="submit">Send</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
			
			</div>
		<div style="display:none;"  id="leavetable">
			<%
			List <LeaveRequest> lr= LeaveRequestDao.ShowData(Id);
			
			%>
	 <table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>No</th>
                <th>First_Name</th>
                <th>Last_Name</th>
                <th>From</th>
                <th>To</th>
                <th>Type</th>
                <th>Reason</th>
                <th>Status</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
        <%
        	for(LeaveRequest l:lr)
        	{
        		int Id1=l.getNo();
        		request.setAttribute("Id1",Id1);
        %>
            <tr>
                <td><%=l.getNo() %></td>
                <td><%=l.getF_Name() %></td>
                <td><%=l.getL_Name() %></td>
                <td><%=l.getFrom_Date() %></td>
                <td><%=l.getTo_Date() %></td>
                <td><%=l.getType() %></td>
                <td><%=l.getReason() %></td>
                <%if(l.getStatus().equals("0")){ %>
                <td style="color:orange;font-weight:bold">Pending</td>
                <%} %>
                <%if(l.getStatus().equals("1")){ %>
                <td style="color:red;font-weight:bold">Not Approved</td>
                <%} %>
                <%if(l.getStatus().equals("2")){ %>
                <td style="color:green;font-weight:bold">Approved</td>
                <%} %>
                <td><a href="DeleteReq.jsp?IdR=${Id1 }" class="btn btn-danger" id="Cancel" name="Cancel"><i class="fa fa-times" aria-hidden="true"></i> </a></td>
            </tr>
          <%} %>  
            </tbody>
         </table>
            
		</div>
		<div style="display:none;" id="SalaryDetails">
			<%
			List<SalaryDetails>Sd=SalaryDetailsDao.ShowMySalary(Id);
			
			%>
	 <table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>Emp No</th>
                <th>Normal Leaves</th>
                <th>Urgent Leaves</th>
                <th>Actual Salary</th>
                <th>Total Salary</th>
              
            </tr>
        </thead>
        <% if(Sd.equals(null))
        {
        	%>
        <h3>No Records Found or No Slip Generated</h3>
        <%}else{ %>
        
        <tbody>
        <%
           
        	for(SalaryDetails s:Sd)
        	{
        %>
            <tr>
                <td><%=s.getId() %></td>
                <td><%=s.getNormal_Leaves() %></td>
                <td><%=s.getUrgent_Leaves() %></td>
                <td><%=s.getActual_Salary()%> Rs.</td>
                <td><%=s.getTotal_Salary() %> Rs.</td>
               
                
            </tr>
          <%} }%>  
            </tbody>
         </table>
		</div>
		</div>
	</div>
    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>
	
	<script src="js/jquery.js"></script>
	<script>
		$("#project").click(function(){
			$("#projdsc").toggle();
		});
		$("#showleave").click(function(){
			$("#leaveform").hide();
			$("#leavetable").show();
			$("#SalaryDetails").hide();
		});
		$("#apply").click(function(){
			$("#leavetable").hide();
			$("#leaveform").show();
			$("#SalaryDetails").hide();
		});
		$("#Salary").click(function(){
			$("#leavetable").hide();
			$("#leaveform").hide();
			$("#SalaryDetails").show();
		});
		$(document).ready(function() {
		    $('#example').DataTable();
		} );
	</script>
	
</body>
</html>