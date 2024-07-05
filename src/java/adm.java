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
public class adm extends HttpServlet {

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
        String category=request.getParameter("category");
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String mobile=request.getParameter("mobile");
        String amobile=request.getParameter("amobile");
        String email=request.getParameter("email");
        String aadhar=request.getParameter("aadhar");
        String photo=request.getParameter("photo");
        String dno=request.getParameter("dno");
        String village=request.getParameter("village");
        String mandal=request.getParameter("mandal");
        String district=request.getParameter("district");
        String state=request.getParameter("state");
        String country=request.getParameter("country");
        String pincode=request.getParameter("pincode");
        String proof=request.getParameter("proof");
       
        int mid=0;
        int status=0;
        int ecount=0;
        Class.forName("com.mysql.cj.jdbc.Driver");                
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
         Statement st=con.createStatement();
        ResultSet res1=null;
         String query1="select count(*) from admins where aadhar='"+aadhar+"'";
            res1=st.executeQuery(query1);
            res1.next();
            int count=0;
            count=res1.getInt(1);
            
            String query5="select count(*) from admins where email='"+email+"'";
            ResultSet res3=st.executeQuery(query5);
            res3.next();
            ecount=res3.getInt(1);
           
                
          if(count==0 && ecount==0){
                String query2="select max(adid) from admins;";
                ResultSet res2=st.executeQuery(query2);
                int c=0;
                res2.next();
                c=res2.getInt(1);
                mid=c+1;
         
                 String query="insert into admins values('"+mid+"','"+category+"','"+fname+"','"+lname+"','"+mobile+"','"+amobile+"','"+email+"','"+aadhar+"','"+photo+"','"+dno+"','"+village+"','"+mandal+"','"+district+"','"+state+"','"+country+"','"+pincode+"','"+proof+"')";
                 status=st.executeUpdate(query);
            }
            else{
                
            }
         
         
         
          
         
         
         try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet membership</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println(category+" "+fname+" "+lname+" "+mobile+" "+amobile+" "+email+" "+aadhar+" "+photo+" "+dno+" "+village+" "+mandal+" "+district+" "+state+" "+country+" "+pincode+" "+proof);
           
            out.println(count+" "+ecount);
            if(count!=0||ecount!=0){
                out.println("User already exist");
            }
            else if(status==1){
                out.println("Successfull");
                
            }
            else{
                out.println("failed");
            }
            out.println("<h1>Servlet membership at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(membership.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(membership.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(membership.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(membership.class.getName()).log(Level.SEVERE, null, ex);
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
