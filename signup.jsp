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
            elements[i].innerHTML = null
        }
        let bol = true;
        
        if ( document.signup.name.value == "" )
            {
                document.getElementById("div1").innerHTML="<h6 class=text-danger >Name is Empty</h6>"
                return false;
            }
        if (document.signup.id.value == "" )
            {
                document.getElementById("div2").innerHTML="<h6 class=text-danger >Username is Empty</h6>"
                return false;
            }
        // if ("/\s/".test(document.signup.id.value);)
        //     {
        //         document.getElementById("div2").innerHTML="<h6 class=text-danger >Username without spaces</h6>"
        //         return false;
        //     }
        if(document.signup.pass.value == "")	
        {
                document.getElementById("div3").innerHTML="<h6 class=text-danger >Password is Empty</h6>"
                return false;
        }	
        if(document.signup.pass.value!=document.signup.pass1.value)
        {
                document.getElementById("div4").innerHTML="<h6 class=text-danger >Pssword didnt match</h6>"
                return false;
                
        }
        if ( document.signup.email.value == "" )		
        {
            document.getElementById("div14").innerHTML="<h6 class=text-danger >Email is Empty</h6>"
            return false;
               
        }
        return bol;
    }
       
</script>


    <div class="wrapper" style="margin-top: 100px">
        <div class="con text-center">
            <h1>Signup Page<h1>
<% 
        session = request.getSession(false);

        if(session != null){
            if((Integer)session.getAttribute("signup") == (Integer) 0){
%>
<h1>Signup Failed<h1>
<%  
        session.invalidate();
        }
%>
<%
        
            
        if( (Integer) session.getAttribute("signup") == (Integer)1){
%>
<h1>Signup Successfull<h1>
<h2>You can <a href="http://localhost:8080/project/login.jsp">Login</a> here<h2>
<%          
            session.removeAttribute("signup");
            session.invalidate();
            return;

                 
        }
}
%>

        <div class="text-center d-flex justify-content-center m-auto mt-5">
            <form name="signup" action="signup" method="post" onsubmit="return validate()">
                <input type="text" name="name" placeholder="Enter Name" class="form-control">
                <div class="diva" id="div1"></div>
                <input type="text" name="id" placeholder="Enter Username" class="form-control mt-2">
                <div class="diva" id="div2"></div>
                <input type="email" name="email" placeholder="Enter Email" class="form-control mt-2">
                <div class="diva" id="div2"></div>
                <input type="password" name="pass" placeholder="Enter Password" class="form-control mt-2">
                <div class="diva" id="div3"></div>
                <input type="password" name="pass1" placeholder="Confirm Password" class="form-control mt-2">
                <div class="diva" id="div4"></div>
                <input type="submit" value="Signup" class="btn btn-primary mt-3">
            </form>
        </div>



            
        </div>
    </div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
    

</html>