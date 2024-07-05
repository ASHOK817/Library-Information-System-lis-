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
public class DeleteBookServlet extends HttpServlet {

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
                    String query = "DELETE FROM cbooks WHERE id = ?";

                    try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                        preparedStatement.setInt(1, bookId);

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
