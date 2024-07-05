/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
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
public class viewCategory extends HttpServlet {

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
        
        Class.forName("com.mysql.cj.jdbc.Driver");
         Connection con= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
         Statement st1=con.createStatement();
         Statement st2=con.createStatement();
         String query1="select * from category;";
         String query2="select count(*) from category;";
         ResultSet result=st1.executeQuery(query1);
         ResultSet count=st2.executeQuery(query2);
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
            HttpSession Session=request.getSession();
            Session.setAttribute("cc", ""+c);
            out.println("<center><h1 style='color:red;'>Total Books ("+" "+c+" )</h1></center>");
            out.println("<center><table border=3px>");
            out.println("<tr><th>CID</th><th>CATEGORY</th><th>STATUS</th><th>CREATION-DATE</th><th>UPDATION DATE</th></tr>");
            while(result.next()){
                out.println("<tr>");
                out.println("<td>"+result.getString("cid")+"</td>"+"<td>"+result.getString("cname")+"</td>"+"<td>"+result.getString("cstatus")+"</td>"+"<td>"+result.getString("creationdate")+"</td>"+"<td>"+result.getString("updationdate")+"</td>");
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
            Logger.getLogger(addCategory.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addCategory.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(addCategory.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addCategory.class.getName()).log(Level.SEVERE, null, ex);
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
