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

/**
 *
 * @author maruthi
 */
public class delcategory extends HttpServlet {

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
       Statement st=con.createStatement();
       String ID=request.getParameter("dcid");
       if(request.getParameter("ID")!=null){
          ID=request.getParameter("ID");
      }
       String CAT=request.getParameter("Name");
       String query="delete from category where cid='"+ID+"' or cname='"+CAT+"';";
       int status=0;
      
      
        String query2="select cname from category where cid='"+ID+"' or cname='"+CAT+"'";
       ResultSet cat=st.executeQuery(query2);
       String Category="None";
       while(cat.next()){
          Category=cat.getString(1);
       }
       status=st.executeUpdate(query);
      if(!Category.equals("None")){
        String query1="delete from cbooks where category='"+Category+"';";
        int status1=0;
        status1=st.executeUpdate(query1) ;
        status1=st.executeUpdate("delete from Issue where category='"+Category+"'") ;
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
"             <center><h1 style=\"color:green; \"><b><h1>Category with ID: "+ ID+" Successfully Removed</h1></center>\n" +
"        </div>");
            }
            else{
                out.println(""
                        + "<div id='msg' style='box-shadow: 0 0 7px red;border: 2px solid red ;'>\n" +
"             <center><h1 style=\"color:red; \"><b><h1>Category with ID: "+ID+" not exit!!!!</h1></b></h1></center>\n" +
"        </div> ");
            }
            
            
          //  if(status==1){
            //    out.println("<h1>Category with ID: "+ ID+" Successfully Removed</h1>");
            //}
            //else{
             //   out.println("<h1>Category with ID: "+ID+" not exit!!!!</h1>");
            //}
            //out.println("<h1>Servlet delissue at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(delissue.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(delissue.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(delissue.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(delissue.class.getName()).log(Level.SEVERE, null, ex);
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
