<%--
  Created by IntelliJ IDEA.
  User: gim-wongyeom
  Date: 25. 11. 20.
  Time: 오전 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Add New Post</h1>
<form action="write_ok.jsp" method="post">
    <table>
        <tr>
            <td>Title:</td>
            <td><input type="text" name="title"/></td>
        </tr>
        <tr>
            <td>Writer:</td>
            <td><input type="text" name="writer"/></td>
        </tr>
        <tr>
            <td>Content:</td>
            <td><textarea cols="50" rows="5" name="content"></textarea></td>
        </tr>
        <tr>
            <td><a href="posts.jsp">View All Records</a></td>
            <td><input type="submit" value="Add Post"/></td>
        </tr>
    </table>
</form>
</body>
</html>
