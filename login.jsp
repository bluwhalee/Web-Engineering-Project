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
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>

<body>

<script language="JavaScript" type="text/javascript">
    function validate()
    {	
        var elements = document.querySelectorAll('.diva');
        for(var i = 0; i < elements.length; i++){
            elements[i].innerHTML = null;
        }
        let bol = true
        
        if ( document.login.id.value == "" )
            {
                document.getElementById("div1").innerHTML="<h6 class=text-danger >Username is Empty</h6>";		
                bol = false;
            }

        if(document.login.pass.value == "")	
        {
                document.getElementById("div2").innerHTML="<h6 class=text-danger>password is empty!!</h6>"
                bol= false;
        }	
        if(bol==true)
        {
            return true
        }
        else{
            return false
        }
    }
</script>

    <div class="wrapper" style="margin-top: 100px">
        <div class="con text-center">
            <h1>Login Page<h1>
<% 
        session = request.getSession();
        session.setAttribute("myorders",session.getAttribute("myorders1"));
%>
<%
        if((Integer) session.getAttribute("login") == (Integer)1){
            if(session.getAttribute("url") != null){
                response.sendRedirect((String)(session.getAttribute("url")));

            }
                
%>
        <h2 class="text-success mb-3 mb-5"> Login Successful <h2>
       
        <div >
                <div>
                    <a href="http://localhost:8080/project/index.html"><button class="btn btn-primary">Shop Page</button></a><br><br>
                </div>
                <div>
                    <a href="http://localhost:8080/project/logout.jsp"><button class="btn btn-primary">Logout</button></a><br><br>
                </div>
                <div>
                    <a href="http://localhost:8080/project/cart.jsp"><button class="btn btn-primary">Cart</button></a><br><br>
                </div>
                
        </div>

<%          return;              
    }
            else if((Integer)session.getAttribute("login") == (Integer) 0){
%>
<h2 class="text-danger mb-3">Incorrect Credentials<h2>
<%
        session.removeAttribute("login");  
        }
        
        

%>


            <div class="text-center d-flex justify-content-center m-auto mt-5">
                <form name="login" action="login" method="post" onsubmit="return validate()">
                    <input type="text" name="id" placeholder="Enter ID" class="form-control">
                    <div class="diva" id="div1"></div>
                    <input type="text" name="pass" placeholder="Enter Pass" class="form-control mt-2">
                    <div class="diva" id="div2"></div>
                    <input type="submit" value="login" class="btn btn-primary mt-3">
                </form>
            </div>

            <h5 class="mt-5">You can <a href="http://localhost:8080/project/signup.jsp">Signup</a> here<h5>


        </div>
    </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<body>
</html>