<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%> 
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">    
    <title>Users</title>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
    <link href="/bootstrap.min.css" rel="stylesheet" type="text/css">
    
</head>
<body class="container">
    <br>
    <div class="card">
        <h5 class="card-header bg-info text-white">
            Users                
        </h5>
        <div class="card-body">
            <h5 class="card-title"></h5>
            <table class="table">
                <tr>
                    <form autocomplete="off" action="secure" method="post" enctype="multipart/form-data">
                        <td colspan='2'>                                             
                            <input type="file" placeholder="Upload yaml file" class="form-control" name="file">     
                        </td>  
                        <td>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </td>                  
                    </form>
                </tr>
            </table>
            <% if(request.getAttribute("users")!=null) { %>
            <table class="table">
               <%  
                  Map<String, Object> data = (Map) request.getAttribute("users");
                    
                %>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                </tr>
                <tr>
                    <td><%=data.get("first_name")%></td>
                    <td><%=data.get("last_name")%></td>
                    <td><%=data.get("email")%></td>
                </tr>                
            </table>
            <% } %>
        </div>
    </div>
    <script src="/jquery-3.3.1.slim.min.js"></script>
    <script src="/popper.min.js"></script>
    <script src="/bootstrap.min.js"></script>
</body>
</html>