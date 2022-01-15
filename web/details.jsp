<%@ page import="com.EE.Database.User" %><%--
  Created by IntelliJ IDEA.
  User: Bagit
  Date: 28.12.2021
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/header.jsp" %>
</head>
<body>
<% User user = (User) request.getAttribute("user"); %>
<%@include file="vendor/navbar.jsp" %>
<%
    if (user == null) {
%>
<h1>PAGE NOT FOUND</h1>
<%
} else {
%>
<div class="container">
    <div class="row mt-5">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    User ID: <%=user.getId() %>
                </div>
                <div class="card-body">
                    <h5 class="card-title"><%=user.getName()%> <%=user.getSurname()%>
                    </h5>
                    <p class="card-text">Age: <%=user.getAge()%> years</p>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        EDIT USER
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">EDITING USER</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="/editUser">
                    <input type="hidden" value="<%=user.getId()%>" name="id">
                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control" name="name" value="<%=user.getName()%>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label" >Surname</label>
                        <input type="text"name="surname" class="form-control" value = "<%=user.getSurname()%>" >
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Age</label>
                        <input type="number" name="age" class="form-control" value = "<%=user.getAge()%>">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button class="btn btn-primary">Save changes</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<%
    }
%>
</body>
</html>
