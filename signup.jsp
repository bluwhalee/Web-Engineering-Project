<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.ProcessBuilder.Redirect" %>
<%@ page import="javax.swing.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <div class="wrapper">
        <div class="con">
        <h1>Signup Page<h1>
<% 
        session = request.getSession(false);
        if(session != null){
            
            if( (Integer) session.getAttribute("signup") == (Integer)1){
%>
<h1>Signup Successfull<h1>
<h2>You can <a href="http://localhost:8080/project/login.jsp">Login</a> here<h2>
<%      session.invalidate();
        throw new javax.servlet.jsp.SkipPageException();

                 
        }
        if((Integer)session.getAttribute("signup") == (Integer) 0){
%>
<h1>Signup Failed<h1>
<%
        
        }
        session.invalidate();
        }

%>


            <form action="signup" method="post">
                <input type="text" name="name" placeholder="Enter Name">
                <input type="text" name="id" placeholder="Enter ID">
                <input type="text" name="pass" placeholder="Enter Pass">
                <input type="submit" value="login">
            </form>



            
        </div>
    </div>
    

</html>