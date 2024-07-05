import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteBookServlet")
public class cIssueBook extends HttpServlet {

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            int bookId = Integer.parseInt(request.getParameter("id"));

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String jdbcUrl = "jdbc:mysql://localhost:3306/Books";
                String username = "root";
                String password = "password";
                try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {
                   
                // String query="insert into Issue values('"+bookId+"','physics','maru','science','123','10/11/2023','30','10/10/2023')";;
               String bookid="7";
               String name="maruthi";
               String author="venkai";
               String category="kids";
               String sid="12";
               String idate="10/11/2023";
               String days="30";
               String rdate="10/12/2023";
               String query="insert into Issue values(?,?,?,?,?,?,?,?)";
               //String query = "DELETE FROM cbooks WHERE id = ?";

                    try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                        preparedStatement.setString(1, bookid);
                        preparedStatement.setString(2, name);
                        preparedStatement.setString(3, author);
                        preparedStatement.setString(4, category);
                        preparedStatement.setString(5, sid);
                        preparedStatement.setString(6, idate);
                        preparedStatement.setString(7, days);
                        preparedStatement.setString(8, rdate);

                        int rowsAffected = preparedStatement.executeUpdate();

                        if (rowsAffected > 0) {
                            out.println("Book deleted successfully!");
                        } else {
                            out.println("Error deleting book. Please try again.");
                        }
                    }
                }
            } catch (ClassNotFoundException | SQLException ex) {
                out.println("Database connection error: " + ex.getMessage());
            }
        }
    }
}
