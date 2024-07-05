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
public class addCategory extends HttpServlet {

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
        String cid=request.getParameter("cid");
        String cname=request.getParameter("category");
        String cstatus=request.getParameter("cstatus");
        String creationdate=request.getParameter("creationdate");
        String updationdate=request.getParameter("updationdate");
        java.util.Date thisDate=new java.util.Date();
                SimpleDateFormat dateForm=new SimpleDateFormat("dd/MM/YYYY");
                 creationdate=dateForm.format(thisDate);
                 updationdate=dateForm.format(thisDate);
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
        Statement st1=con.createStatement();
        String query="select count(*) from category where cid='"+cid+"';";
        ResultSet res=st1.executeQuery(query);
        res.next();
        int status=0;
        if(res.getInt(1)==0){
            String query1="insert into category values('"+cid+"','"+cname+"','"+cstatus+"','"+creationdate+"','"+updationdate+"');";
            
            status=st1.executeUpdate(query1);
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
            
            if(status==1){
              out.println(" "
                      + "<div id='msg' style='box-shadow: 0 0 7px green;border: 2px solid green ;'>\n" +
"             <center><h1 style=\"color:green; \"><b><h1>category with ID :"+cid+" is successfully added</h1></center>\n" +
"        </div>");
            }
            else{
                out.println(""
                        + "<div id='msg' style='box-shadow: 0 0 7px red;border: 2px solid red ;'>\n" +
"             <center><h1 style=\"color:red; \"><b><h1>category with ID :"+cid+" is already exists</h1></b></h1></center>\n" +
"        </div> ");
            }
           // out.println(cid+" "+cname+" "+cstatus+" "+creationdate+" "+updationdate);
            //if(status==1){
            //    out.println("<h1>category with ID :"+cid+" is successfully added</h1>");
            //}
            //if(status==0){
             //   out.println("<h1>category with ID :"+cid+" is already exists</h1>");
            //}
            
            
            //out.println("Maruthi prasad ballari");
            //out.println("<h1>Servlet addCategory at " + request.getContextPath() + "</h1>");
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
