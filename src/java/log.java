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
public class log extends HttpServlet {

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
        
         String email=request.getParameter("email");
         String password=request.getParameter("password");
        
         Class.forName("com.mysql.cj.jdbc.Driver");                
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
         Statement st=con.createStatement();
         Statement st1=con.createStatement();
         ResultSet res1=null;
         ResultSet res2=null;
         ResultSet res3=null;
         int s=0;
         int ss=0;
         int sss=0;
         int count=0;
         int mem=0;
         HttpSession session=request.getSession();
         String query8="select count(*) from admins where email='"+email+"'";
         res2=st1.executeQuery(query8);
         res2.next();
            int adm=0;
            adm=res2.getInt(1);
            String pas=null;
         if(adm!=0){
             String query9="select password from admins where email='"+email+"'";
                
                res2=st.executeQuery(query9);
                while(res2.next()){
                    pas=res2.getString("password");
                }
                if(password.equals(pas)){
                    sss=1;
                   response.sendRedirect("newAdmin.jsp");
                }
                else{
                    
                }
         }
         else{
         String query4="select count(*) from Membership where email='"+email+"'";
         res2=st1.executeQuery(query4);
         res2.next();
            
            mem=res2.getInt(1);
         if(mem!=0){
             String query5="select * from Membership where email='"+email+"'";
                pas=null;
                res2=st.executeQuery(query5);
                String rfname=null;
                String rlname=null;
                String rphone=null;
                String raddress=null;
                String rid=null;
                String rphoto=null;
                String rtype=null;
                String rpincode=null;
                while(res2.next()){
                    pas=res2.getString("amobile");
                    rfname=res2.getString("fname");
                    rlname=res2.getString("lname");
                    rphone=res2.getString("mobile");
                    rid=res2.getString("mid");
                    raddress=res2.getString("district");
                    rphoto=res2.getString("photo");
                    rtype=res2.getString("type");
                    rpincode=res2.getString("pincode");
                }
                if(password.equals(pas)){
                    ss=1;
                    
                    session.setAttribute("rid",rid );
                    session.setAttribute("rfname",rfname );
                    session.setAttribute("flname",rlname );
                    session.setAttribute("rphone",rphone );
                    session.setAttribute("raddress",raddress );
                    session.setAttribute("remail",email );
                    session.setAttribute("rphoto",rphoto );
                    session.setAttribute("rtype",rtype );
                    session.setAttribute("rpincode",rpincode );
                   response.sendRedirect("StudentRole.jsp");
                }
                else{
                    
                }
         }
         else{
         String query1="select count(*) from Login where email='"+email+"'";
            res1=st.executeQuery(query1);
            res1.next();
            count=0;
            count=res1.getInt(1);
            if(count!=0){
                String query2="select password from Login where email='"+email+"'";
                String pass=null;
                res2=st.executeQuery(query2);
                while(res2.next()){
                    pass=res2.getString("password");
                }
                if(password.equals(pass)){
                    s=1;
                    response.sendRedirect("index.jsp");
                }
                else{
                    s=0;
                }
            }
            else{
                
            }
         }
}
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet log</title>");            
            out.println("</head>");
            out.println("<body>");
            if(count==0 && mem==0 && adm==0){
                out.println("<h1>Account with this Email "+email+" Not Exist</h1>");
            }
            else if(s==1||ss==1||sss==1){
                out.println("<h1>Successfully logined</h1>");
            }
            else{
                out.println("<h1>Incorrect Password</h1>");
            }
            out.println(mem+" "+ss+" "+adm+" "+pas+" "+password);
            out.println("<h1>Servlet log at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(log.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(log.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(log.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(log.class.getName()).log(Level.SEVERE, null, ex);
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
