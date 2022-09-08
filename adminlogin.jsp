<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
 <h1> Admin Login <h1>
    <div class="wrapper">
        <div class="con">

<% 
        session = request.getSession(false);
        if(session != null){
            
            if( (Integer) session.getAttribute("alogin") == (Integer)1){
                response.sendRedirect("http://localhost:8080/project/admindash.jsp");
                      
            }
        if((Integer)session.getAttribute("alogin") == (Integer) 0){
%>
<h1>Incorrect Credentials<h1>
<%
    session.invalidate();
        }
        }
%>


            <form action="adminlogin" method="post">
                <input type="text" name="id" placeholder="Admin ID">
                <input type="text" name="pass" placeholder="Password">
                <input type="submit" value="login">
            </form>
            <br><br>
            <h3>To get your admin account contact owner!<h3>
        </div>
    </div>
</body>
</html>