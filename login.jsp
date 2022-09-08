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
        <h1>Login Page<h1>
<% 
        session = request.getSession();
        if((Integer) session.getAttribute("login") == (Integer)1){

                if(session.getAttribute("url")!=null)
                {
                    response.sendRedirect(((String)session.getAttribute("url")));
                    return;
                }
%>
<h1> Login Successful <h1>

<%          return;              
            }
            if((Integer)session.getAttribute("login") == (Integer) 0){
%>
<h1>Incorrect Credentials<h1>
<%
    session.invalidate();
        }
        
        

%>


            <form action="login" method="post">
                <input type="text" name="id" placeholder="Enter ID">
                <input type="text" name="pass" placeholder="Enter Pass">
                <input type="submit" value="login">
            </form>

            <h2>You can <a href="http://localhost:8080/project/signup.jsp">Signup</a> here<h2>


        </div>
    </div>
    

</html>