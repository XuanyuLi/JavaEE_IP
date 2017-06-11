<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/10
  Time: 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String ip = request.getParameter("IP");
    String URL = "jdbc:mysql:///?user=root&password=system";
    String sql = "SELECT * FROM db_ip.ip WHERE inet_aton(?) BETWEEN inet_aton(start) AND inet_aton(end)";
    new Driver();
    Connection connection = DriverManager.getConnection(URL);
    PreparedStatement preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1,ip);
    ResultSet resultSet = preparedStatement.executeQuery();
    if (resultSet.next()) {
        request.setAttribute("message", resultSet.getString("address"));
        request.getRequestDispatcher("index.jsp").forward(request,response);
    } else {
        request.setAttribute("message","IP地址有误，请重新输入!");
    }
    connection.close();
    preparedStatement.close();
    resultSet.close();

%>
</body>
</html>
