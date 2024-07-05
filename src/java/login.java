/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
public class login extends HttpServlet {

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
        String sname=request.getParameter("sname");
        String mobile=request.getParameter("mobile");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        ResultSet res1=null;
        int status=0;
        int sid=0;
        Class.forName("com.mysql.cj.jdbc.Driver");                
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
            Statement st=con.createStatement();
            String query1="select count(*) from Login where email='"+email+"'";
            res1=st.executeQuery(query1);
            res1.next();
            int count=0;
            count=res1.getInt(1);
            if(count==0){
                 String query2="select max(sid) from Login;";
                 ResultSet res2=st.executeQuery(query2);
                 int c=0;
                 res2.next();
                 c=res2.getInt(1);
                 sid=c+1;
                 Statement st3=con.createStatement();
                 String query="insert into Login values('"+sid+"','"+sname+"','"+mobile+"','"+email+"','"+password+"');";
                 status=st3.executeUpdate(query);
            }
            else{
                
            }
            
            
            HttpSession session=request.getSession();
            session.setAttribute("name","maruthi");
            session.setAttribute("name","prasad");
            try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println(sname+" "+mobile+" "+email+" "+password+" "+sid);
            
            if(status==1){
                out.println("<h1> Student Successfully login !!!!</h1>");
            }
            else if(count !=0){
                out.println("<h1> Email: "+email+" exist already !!!!</h1>");
            }
            else{
                out.println("<h1> Student login Unsuccessfull !!!!</h1>");
            }
            
            out.println("<h1>Servlet login at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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
