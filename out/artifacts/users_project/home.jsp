<%@ page import="com.EE.Database.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.EE.Database.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/header.jsp"%>
</head>
<body>
    <%
        ArrayList<User> users = (ArrayList<User>) request.getAttribute("users");
    %>
    <%@include file="vendor/navbar.jsp"%>
    <div class="container">
        <div class="row mt-5">
            <div class="col">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>NAME</th>
                            <th>SURNAME</th>
                            <th>AGE</th>
                            <th>INFO</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (users!=null) {
                                for(User u:users){
                                %>
                        <tr>
                            <td><%=u.getId()%></td>
                            <td><%=u.getName()%></td>
                            <td><%=u.getSurname()%></td>
                            <td><%=u.getAge()%></td>
                            <td><a href="/details?id=<%=u.getId()%>" class="btn btn-sm btn-info">Info</a></td>
                        </tr>
                            <%
                                    }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
