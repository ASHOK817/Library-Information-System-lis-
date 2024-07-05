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
import javax.servlet.http.HttpSession;

@WebServlet("/BookServlet")
public class ibookcards extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://localhost:3306/Books";
            String username = "root";
            String password = "password";

            try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {
                String searchTerm = request.getParameter("search"); // Get search term from the request
                String category = request.getParameter("category"); // Get category from the request
                HttpSession Session=request.getSession();  
                String sid="";
                sid=(String)Session.getAttribute("rid");
                // Query to retrieve book data based on the search term and category
                String query;
                 /* if ((searchTerm != null && !searchTerm.isEmpty()) && (category != null && !category.isEmpty())) {
                    query = "SELECT * FROM cbooks b,Issue i WHERE b.id=i(author LIKE ? OR id LIKE ? OR title LIKE ? OR genre LIKE ?) AND category LIKE ?";
                } else if (searchTerm != null && !searchTerm.isEmpty()) {
                    query = "SELECT * FROM cbooks b WHERE author LIKE ? OR id LIKE ? OR title LIKE ? OR genre LIKE ?";
                } else if (category != null && !category.isEmpty()) {
                    query = "SELECT * FROM cbooks b WHERE category LIKE ?";
                } else {
                    query = "SELECT * FROM cbooks b";
                }*/
                 query="SELECT * FROM cbooks b,Issue i WHERE b.id=i.bookid AND i.sid= ? ";

                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                   /* if ((searchTerm != null && !searchTerm.isEmpty()) && (category != null && !category.isEmpty())) {
                        // Bind the search term and category to each placeholder in the query
                        preparedStatement.setString(1, "%" + searchTerm + "%");
                        preparedStatement.setString(2, searchTerm);
                        preparedStatement.setString(3, "%" + searchTerm + "%");
                        preparedStatement.setString(4, "%" + searchTerm + "%");
                        preparedStatement.setString(5, "%" + category + "%");
                    } else if (searchTerm != null && !searchTerm.isEmpty()) {
                        preparedStatement.setString(1, "%" + searchTerm + "%");
                        preparedStatement.setString(2,searchTerm);
                        preparedStatement.setString(3, "%" + searchTerm + "%");
                        preparedStatement.setString(4, "%" + searchTerm + "%");
                    } else if (category != null && !category.isEmpty()) {
                        preparedStatement.setString(1, "%" + category + "%");
                    }*/
                   preparedStatement.setString(1, sid);
                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                        // Display book data
                        int count = 0; // Counter for the number of cards in a row
                        out.println("<div class='row justify-content-around'>"); // Start the row
                        while (resultSet.next()) {
                            out.println("<div class='col-3'>"); // Adjust col-md-3 based on your preference
                            out.println("<div class='card mb-4 shadow-sm'>");
                            String ph="images/";
                            ph=ph+resultSet.getString("coverImage");
                            out.println("<img src='" + ph + "' class='card-img-top' alt='Book Cover' style='height:150px;'>");
                            out.println("<div class='card-body'>");
                            out.println("<h5 class='card-title'>" + resultSet.getString("title") + "</h5>");

                            out.println("<p class='card-text'>Book Id: " + resultSet.getString("b.id"));
                            out.println("<br>Author: " + resultSet.getString("b.author"));
                            out.println("<br>Genre: " + resultSet.getString("b.category"));
                            out.println("<br>Status: "+resultSet.getString("b.status") + "</p>");
                            out.println("<p class='card-description'>"+"Public:"+resultSet.getString("b.publications"));
                            out.println("<br>Author: "+resultSet.getString("b.author"));
                            out.println("<br>Price: "+resultSet.getString("b.price"));
                            out.println("<br>Book Description:<br> "+resultSet.getString("b.description") + "</p>");

                            // Add a "View Book" button with a link to the book's details page
                           

                            out.println("</div>");
                            out.println("</div>");
                           // out.println("<button class='btn btn-success 'style='margin-top:3px; margin-left:130px; width:80px;height:35px' onclick='deleteBook(" + resultSet.getInt("id") + ")'> Issue </button> </p>");
                           out.println("<a href='delissue?rbid="+resultSet.getString("b.id")+"'><button class='btn btn-danger 'style='margin-top:3px; margin-left:130px; width:80px;height:35px'> Reurn </button></a> </p>");
                           // out.prinln("<a href="Removebook?xid=<% out.print(result5.getString("id"));%>"><button class="btn btn-danger ms-auto" style="width:100px; height:35px;">Delete</button></a></td>
                            out.println("</div>");

                            count++;
                            if (count % 4 == 0) {
                                out.println("</div><div class='row justify-content-around'>"); // End the row and start a new one after 4 cards
                            }
                        }
                        out.println("</div>"); // End the last row
                    }
                }
            } catch (SQLException ex) {
                out.println("Database connection error: " + ex.getMessage());
            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }
}