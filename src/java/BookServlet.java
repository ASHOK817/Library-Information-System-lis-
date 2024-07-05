import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://localhost:3306/Books";
            String username = "root";
            String password = "password";
            //Class.forName("com.mysql.cj.jdbc.Driver");                
            //Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
            //Statement st=con.createStatement();

            try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {
                String searchTerm = request.getParameter("search"); // Get search term from the request
                String category = request.getParameter("category"); // Get category from the request

                // Query to retrieve book data based on the search term and category
                String query;
                if ((searchTerm != null && !searchTerm.isEmpty()) && (category != null && !category.isEmpty())) {
                    query = "SELECT * FROM cbooks WHERE (author LIKE ? OR id LIKE ? OR title LIKE ? OR genre LIKE ?) AND category LIKE ?";
                }
                else if(searchTerm !=null && !searchTerm.isEmpty()){
                    query="SELECT * FROM cbooks WHERE author LIKE ? OR id LIKE ? OR title LIKE ? OR genre LIKE? ";
                }
                else if(category !=null && !category.isEmpty()){
                    query = "SELECT * FROM cbooks WHERE category LIKE ?";
                }
                else {
                    query = "SELECT * FROM cbooks";
                }

                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    if ((searchTerm != null && !searchTerm.isEmpty()) && (category != null && !category.isEmpty())) {
                        // Bind the search term and category to each placeholder in the query
                        for (int i = 1; i <= 4; i++) {
                            preparedStatement.setString(i, "%" + searchTerm + "%");
                        }
                    }    
                    else if(searchTerm !=null && !searchTerm.isEmpty()){
                             for (int i = 1; i <= 4; i++) {
                                preparedStatement.setString(i, "%" + searchTerm + "%");
                             }   
                    }
                    else if(category !=null && !category.isEmpty()){
                             preparedStatement.setString(1,"%"+category+"%");
                    }
                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                        // Display book data
                        while (resultSet.next()) {
                            out.println("<div class='col-md-3 mb-4'>"); // Adjust col-md-3 based on your preference
                            out.println("<div class='card h-100 shadow-sm'>");
                            out.println("<img src='" + resultSet.getString("coverImage") + "' class='card-img-top' alt='Book Cover'>");
                            out.println("<div class='card-body'>");
                            out.println("<h5 class='card-title'>" + resultSet.getString("title") + "</h5>");
                            out.println("<p class='card-text'>Author: " + resultSet.getString("author") + "</p>");
                            out.println("<p class='card-text'>Genre: " + resultSet.getString("genre") + "</p>");

                            // Add a "View Book" button with a link to the book's details page
                            out.println("<a href='BookDetailsServlet?id=" + resultSet.getInt("id") + "' class='btn btn-primary'>View Book</a>");

                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                        }
                    }
                }
            } catch (SQLException ex) {
                out.println("base connection error: " + ex.getMessage());
            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }
}