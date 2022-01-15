<%--
  Created by IntelliJ IDEA.
  User: Bagit
  Date: 28.12.2021
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/header.jsp"%>

</head>
<body>
<%@include file="vendor/navbar.jsp"%>
    <div class="container">
        <div class="row mt-5">
            <div class="col text-center">
                <form method="post" action="/addUser">
                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control" name="name">
                    </div>
                    <div class="mb-3">
                        <label class="form-label" >Surname</label>
                        <input type="text"name="surname" class="form-control" >
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Age</label>
                        <input type="number" name="age" class="form-control">
                    </div>
                    <button class="btn btn-primary">Submit</button>
                </form>
            </div>

        </div>
    </div>
</body>
</html>
