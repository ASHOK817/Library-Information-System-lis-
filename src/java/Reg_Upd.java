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
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author maruthi
 */
public class Reg_Upd extends HttpServlet {

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
        String rid=request.getParameter("rrid");
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String district=request.getParameter("district");
        String photo=request.getParameter("photo");
      
        

      
       
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
        Statement st=con.createStatement();
        String query="";
        int s=0;
        if((fname != null && !fname.isEmpty() && !fname.equals(" "))){
            s=st.executeUpdate("update Membership set fname='"+fname+"' where mid='"+rid+"'");
        }
        if((lname != null && !lname.isEmpty() && !lname.equals(" "))){
            s=st.executeUpdate("update Membership set lname='"+lname+"' where mid='"+rid+"'");
        }
        if((district != null && !district.isEmpty() && !district.equals("null"))){
            s=st.executeUpdate("update Membership set district='"+district+"' where mid='"+rid+"'");
        }
       
        if((photo != null && !photo.isEmpty() && !photo.equals(" "))){
           s=st.executeUpdate("update Membership set photo='"+photo+"' where mid='"+rid+"'");
        }
        
        
       /* if ((cname != null && !cname.isEmpty() && !cname.equals(" ")) && (cstatus != null && !cstatus.isEmpty() && !cstatus.equals("null"))) {
            query ="update category set cname='"+cname+"',cstatus='"+cstatus+"',updationdate='"+updationdate+"' where cid='"+cid+"'";
        } else if (cname != null && !cname.isEmpty()&& !cname.equals(" ")) {
            query ="update category set cname='"+cname+"',updationdate='"+updationdate+"' where cid='"+cid+"'";
        } else if (cstatus != null && !cstatus.isEmpty() && !cstatus.equals("null")) {
            query ="update category set cstatus='"+cstatus+"',updationdate='"+updationdate+"' where cid='"+cid+"'";
         } else {
            query = "None";
         }
         
         if(!query.equals("None")){
             status=st1.executeUpdate(query);
         }*/
       
        
        
         try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addCategory</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println(rid+" "+fname+" "+lname+" "+district+" "+photo);
           if(s==1){
                out.println("<h1>user with ID :"+rid+" is successfully Updated</h1>");
            }
            if(s==0){
                out.println("<h1>user with ID :"+rid+" is not Updated</h1>");
            }
           
           
          
            out.println("Maruthi prasad ballari");
            out.println("<h1>Servlet addCategory at " + request.getContextPath() + "</h1>");
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
