<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/10
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>IP查询</title>
  </head>
  <body>
  <h1 style="text-align: center; margin-top: 100px">IP SEARCH</h1>
  <form action="search" style="text-align: center" method="post">
    <input type="text" name="IP" placeholder="请输入要查询的ip地址">
    <input type="submit" value="查询">
  </form>
  <%

    String message = (String) request.getAttribute("message");
    if (message != null) {
        out.print(message);
    }

  %>
  </body>
</html>
