<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>Servlets</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
    //Empleamos < % para introducir código java en la JSP.
    String name=request.getParameter("name");
    String password=request.getParameter("password");
    //pedimos los credenciales al usuario usando request.
    if(name!=null && name.equals("admin") && password!=null && password.equals("admin")){
        //Si el usuario admin se loggea
        request.getSession().setAttribute("user","admin");
        //Se establece que el parametro user de la sesión sea el administrador.
        response.sendRedirect("admin.jsp");
        //se redirige al agente de usuario a la jsp específica del admin.

    }else{
        //si el credencial es inválido , se elimina de la sesión.
        //ya bien sea null, o no sea reconocido.
        request.getSession().setAttribute("user",null);
    }


%>
<!-- Contenido -->
<div class="container" id="main-container">
    <h2>Identificación de usuario</h2>
    <form class="form-horizontal" method="post" action="login.jsp">
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">Nombre:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" required="true"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="password">Password:</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="password" name="password"
                       required="true"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Agregar</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>