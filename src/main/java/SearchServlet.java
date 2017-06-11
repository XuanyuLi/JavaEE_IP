import com.mysql.jdbc.Driver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Created by lixuanyu
 * on 2017/6/10.
 */
@WebServlet(urlPatterns = "/search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ip = req.getParameter("IP");
        String URL = "jdbc:mysql:///?user=root&password=system";
        String sql = "SELECT * FROM db_ip.ip WHERE inet_aton(?) BETWEEN inet_aton(start) AND inet_aton(end)";
        try {
            new Driver();
            Connection connection = DriverManager.getConnection(URL);
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,ip);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                req.setAttribute("message", resultSet.getString("address"));
                req.getRequestDispatcher("index.jsp").forward(req,resp);
            } else {
                req.setAttribute("message","IP地址有误，请重新输入!");
            }
            connection.close();
            preparedStatement.close();
            resultSet.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
