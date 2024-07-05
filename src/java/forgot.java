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
public class forgot extends HttpServlet {

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
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
         Statement st=con.createStatement();
         ResultSet res1=null;
         ResultSet res2=null;
         int s=0;
         int ss=0;
         String email=request.getParameter("email");
         String password=request.getParameter("password");
         String mobile=request.getParameter("mobile");
         
         String query4="select count(*) from Membership where email='"+email+"'";
         ResultSet res4=st.executeQuery(query4);
            res4.next();
            int mcount=0;
            int count=0;
            mcount=res4.getInt(1);
         if(mcount!=0){
                String query5="select mobile from Membership where email='"+email+"'";
                String mobi=null;
                res4=st.executeQuery(query5);
                while(res4.next()){
                    mobi=res4.getString("mobile");
                }
                if(mobile.equals(mobi)){
                  ss=1;
                  String query6="update Membership set amobile='"+password+"' where email='"+email+"'";
                   ss=st.executeUpdate(query6);
                }
                else{
                    ss=0;
                }
            }
            else{
             
              String query1="select count(*) from Login where email='"+email+"'";
            res1=st.executeQuery(query1);
            res1.next();
            
            count=res1.getInt(1);
            if(count!=0){
                String query2="select mobile from Login where email='"+email+"'";
                String mob=null;
                res2=st.executeQuery(query2);
                while(res2.next()){
                    mob=res2.getString("mobile");
                }
                if(mobile.equals(mob)){
                  s=1;
                  String query3="update Login set password='"+password+"' where email='"+email+"'";
                   s=st.executeUpdate(query3);
                }
                else{
                    s=0;
                }
            }
            else{
                
            }
                
            }
            
        
            HttpSession session=request.getSession();
            String user=(String)session.getAttribute("name");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet forgot</title>");            
            out.println("</head>");
            out.println("<body>");
            if(count==0 && mcount==0){
                out.println("<h1>Account with this Email "+email+" Not Exist"+user+"</h1>");
            }
            else if(s==1||ss==1){
                out.println("<h1>Successfully password changed</h1>");
            }
            else{
                out.println("<h1>Email and Mobile Number not matched</h1>");
            }
            out.println("<h1>Servlet forgot at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(forgot.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(forgot.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(forgot.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(forgot.class.getName()).log(Level.SEVERE, null, ex);
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
