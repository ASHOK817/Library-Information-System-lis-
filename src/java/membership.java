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
public class membership extends HttpServlet {

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
        int eacount=0;
        int elcount=0;
        Class.forName("com.mysql.cj.jdbc.Driver");                
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
         Statement st=con.createStatement();
        ResultSet res1=null;
         String query1="select count(*) from Membership where aadhar='"+aadhar+"'";
            res1=st.executeQuery(query1);
            res1.next();
            int count=0;
            count=res1.getInt(1);
            
            String query5="select count(*) from Membership where email='"+email+"'";
            ResultSet res3=st.executeQuery(query5);
            res3.next();
            ecount=res3.getInt(1);
            if(ecount==0){
                query5="select count(*) from admins where email='"+email+"'";
                res3=st.executeQuery(query5);
                res3.next();
                eacount=res3.getInt(1);
                if(eacount==0){
                    query5="select count(*) from Login where email='"+email+"'";
                    res3=st.executeQuery(query5);
                    res3.next();
                    elcount=res3.getInt(1);
                }
            }
                
            if(count==0 && ecount==0){
                
                
                String query2="select max(mid) from Membership;";
                ResultSet res2=st.executeQuery(query2);
                int c=0;
                res2.next();
                c=res2.getInt(1);
                mid=c+1;
         
                 String query="insert into Membership values('"+mid+"','"+category+"','"+fname+"','"+lname+"','"+mobile+"','"+amobile+"','"+email+"','"+aadhar+"','"+photo+"','"+dno+"','"+village+"','"+mandal+"','"+district+"','"+state+"','"+country+"','"+pincode+"','"+proof+"')";
                 status=st.executeUpdate(query);
            }
            else{
                
            }
         
         
         
          
         
         
         try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet book</title>"
                    + "<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css\" integrity=\"sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\n" +
"        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN\" crossorigin=\"anonymous\">\n" +
"        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL\" crossorigin=\"anonymous\"></script>\n" +
"\n" +
"    <style>\n" +
"        body {\n" +
"            background-color: #dfe9f0;\n" +
"            font-family: 'Arial', sans-serif;\n" +
"        }\n" +
"\n" +
"        #msg {\n" +
"            max-width: 800px;\n" +
"            margin: 50px auto;\n" +
"            margin-top: 150px;\n" +
"            background-color: #afd0e3;\n" +
"            padding-top: 100px;\n" +
"            padding-bottom: 100px;\n" +
"            \n" +
"            border-radius: 10px;\n" +
"            \n" +
"        }\n" +
"\n" +
"    </style>\n" +
"    "); 
            out.println("</head><body>");
            
            if(ecount!=0||eacount!=0||elcount!=0){
              out.println(" "
                      + "<div id='msg' style='box-shadow: 0 0 7px green;border: 2px solid green ;'>\n" +
"             <center><h1 style=\"color:green; \"><b><h1>Email already Exist...! Try with another email......</h1></center>\n" +
"        </div>");
            }
            else if(count!=0){
                out.println(""
                        + "<div id='msg' style='box-shadow: 0 0 7px red;border: 2px solid red ;'>\n" +
"             <center><h1 style=\"color:red; \"><b><h1>User already Exist....!</h1></b></h1></center>\n" +
"        </div> ");
            }
            else if(status==1){
                out.println(""
                        + "<div id='msg' style='box-shadow: 0 0 7px red;border: 2px solid red ;'>\n" +
"             <center><h1 style=\"color:red; \"><b><h1>Succuessfully Added</h1></b></h1></center>\n" +
"        </div> ");
                
            }
            else{
                out.println(""
                        + "<div id='msg' style='box-shadow: 0 0 7px red;border: 2px solid red ;'>\n" +
"             <center><h1 style=\"color:red; \"><b><h1>Failed try again</h1></b></h1></center>\n" +
"        </div> ");
            }
            /*out.println(category+" "+fname+" "+lname+" "+mobile+" "+amobile+" "+email+" "+aadhar+" "+photo+" "+dno+" "+village+" "+mandal+" "+district+" "+state+" "+country+" "+pincode+" "+proof);
           
            if(ecount!=0||eacount!=0||elcount!=0){
                out.println("Email already Exist...! Try with another email......");
            }
            else if(count!=0){
                out.println("User already Exist....!");
            }
            else if(status==1){
                out.println("Successfull");
                
            }
            else{
                out.println("failed");
            }
            */
            ResultSet res4=st.executeQuery("select count(*) from Membership");
            res4.next();
            HttpSession session=request.getSession();
            //out.println(count);
            session.setAttribute("rs", ""+res4.getInt(1));
            //out.println("<h1>Servlet membership at " + request.getContextPath() + "</h1>");
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
