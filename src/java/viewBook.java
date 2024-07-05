/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
/**
 *
 * @author maruthi
 */
public class viewBook extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        ResultSet result=null;
            ResultSet count=null;
             Class.forName("com.mysql.cj.jdbc.Driver");                
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
            Statement st=con.createStatement();
            
            Statement st1=con.createStatement();
            result=st.executeQuery("select * from books");
            count=st1.executeQuery("select COUNT(*) from books");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet book</title>"); 
            out.println("<style>");
            out.println("table{\n" +
"                border: collapse;\n" +
"                padding: 0px;\n" +
"                width: 70%;     \n" +
"            }");
            out.println("body{"
                    + "background-color:#0ee8a3;"
                    + "height:100vh");
            out.println("table,tr{"
                    + "border:collapse;}");
            out.println("table td{\n" +
"                padding: 5px;\n" +
"                size: 20px;\n" +
"                \n" +
"            }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            count.next();
            int c=count.getInt(1);
            HttpSession session=request.getSession();
            session.setAttribute("count", ""+c);
            out.println("<center><h1 style='color:red;'>Total Books ("+" "+c+" )</h1></center>");
            out.println("<center><table border=3px>");
            out.println("<tr><th>Name</th><th>BookId</th><th>Author</th><th>Publications</th><th>Category</th><th>Price</th><th>Quantity</th></tr>");
            while(result.next()){
                out.println("<tr>");
                out.println("<td>"+result.getString("name")+"</td>"+"<td>"+result.getString("bookid")+"</td>"+"<td>"+result.getString("author")+"</td>"+"<td>"+result.getString("publications")+"</td>"+"<td>"+result.getString("category")+"</td>"+"<td>"+result.getString("price")+"</td>"+"<td>"+result.getString("quantity")+"</td>");
                out.println("</tr>");
            }
            out.println("</table></center>");
            out.println("<h1>Servlet book at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(viewBook.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(viewBook.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(viewBook.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(viewBook.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
