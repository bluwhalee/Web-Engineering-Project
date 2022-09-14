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
 
    <div class="wrapper text-center">
        <h1 class="mt-5"> Admin Login <h1>
        <div class="con">

<% 
        session = request.getSession();
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
        <div class="text-center d-flex justify-content-center m-auto mt-5">
            <form action="adminlogin" method="post">
                <input type="text" name="id" placeholder="Admin ID" class="form-control">
                <input type="text" name="pass" placeholder="Password" class="form-control mt-3">
                <input type="submit" value="login" class="btn btn-primary">
            </form>
        </div>
            <br><br>
            <h3>To get your admin account contact owner!<h3>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html>