<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.ProcessBuilder.Redirect" %>
<%@ page import="javax.swing.*" %>

<html>
<HEAD>
    <TITLE>Admin dash </TITLE>
    <link rel=stylesheet href="adminstyle.css">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</HEAD>
<Body style="font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">
<br>

<%    
        session = request.getSession();
        if((Integer)session.getAttribute("utype")==(Integer)0)
        {
%>
<h2>You are accessing with customer account, <a href="http://localhost:8080/project/adminlogin.jsp">login to admin</a> account<h2>

<%
            return;

        }
        if ( session.getAttribute("alogin") == null){

            RequestDispatcher rd = request.getRequestDispatcher("/adminlogin.jsp");
            rd.forward(request,response);

        }
%>
<h1 class="text-center mb-3">Admin Dashboard</h1>
<div class="p-2">
    <h2> Orders <h2>
    <jsp:include page="allorders"/>
</div>

<div class="p-5 ">
    <h2>Parts<h2>
    <jsp:include page="allparts"/>
</div>
<div class="p-5 ">
    <h2>Customers<h2>
    <jsp:include page="allusers"/>
</div>
            <div class="d-flex justify-content-evenly mt-5">
                <div class="text-center">
                    <h2>Change Order Status<h2>
                    <form action=changestatus action=post>
                        <input type=text name=orderid placeholder="Order id" class="form-control">
                        <input type=text name=status placeholder="New status " class="form-control">
                        <input type=submit value="Change Status" class="btn btn-primary mt-3">
                    </form><br>
                </div>
                <div class="text-center">
                    <h2>Complete Order<h2>
                    <form action=completeorder action=post>
                        <input type=text name=orderid placeholder="Order id" class="form-control">
                        <input type=submit value="Change Status" class="btn btn-primary mt-3">
                    </form><br>
                </div>
            </div>
            <div class="d-flex justify-content-evenly">
                <div class="text-center">
                    <h2>Search user<h2>
                    <form action="searchuser" method="post">
                        <input type=text name=userid placeholder="Enter User id" class="form-control">
                        <input type=submit value="Search" class="btn btn-primary mt-3">
                    </form><br>
                    </div>
                <div class="text-center">
                    <h2>Delete Order<h2>
                    <form action=deleteorder action=post>
                    <input type=text name=orderid placeholder="Enter orderid" class="form-control">
                    <input type=submit value="Delete" class="btn btn-primary mt-3">
                    </form>
                </div>
            </div>
            <div class="d-flex justify-content-evenly">
                <div class="text-center">
                    <h2>Delete user<h2>
                    <form action="deleteuser" method="post">
                        <input type=text name=userid placeholder="Enter User id" class="form-control">
                        <input type=submit value="Delete" class="btn btn-primary mt-3">
                    </form><br>
                    </div>
            </div>
<div class="text-center m-5">
        <a href="http://localhost:8080/project/logout.jsp"><button class="btn btn-primary">logout</button></a>
</div>
</body>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body> 
</html>