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
import java.util.Date;
import java.text.SimpleDateFormat;
/**
 *
 * @author maruthi
 */
public class book extends HttpServlet {

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
       
        int status=0;
            
            Class.forName("com.mysql.cj.jdbc.Driver");                
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
            Statement st=con.createStatement();
            
            Statement st1=con.createStatement();
            String Name=request.getParameter("name");
            String Genre=request.getParameter("genre");
            String Author=request.getParameter("author");
            String Publications=request.getParameter("publications");
            String Description=request.getParameter("description");
            String Category=request.getParameter("categor");
            String price=request.getParameter("price");
            String quantity=request.getParameter("quantity");
            String Status=request.getParameter("status");
            String Photo=request.getParameter("photo");
            
            
            ResultSet res5=st.executeQuery("select max(id) from cbooks");
            int Id=0;
            while(res5.next()){
            Id=res5.getInt(1);
            }
            
            Id++;
            Statement st4=con.createStatement();
             String query5="select count(*) from cbooks where id='"+Id+"';";
             ResultSet res4=st4.executeQuery(query5);
            res4.next();
            int status4=0;
            if(res4.getInt(1)==0){
                String query6="insert into cbooks values('"+Id+"','"+Name+"','"+Author+"','"+Genre+"','"+Photo+"','"+Category+"','"+Description+"','"+Publications+"','"+price+"','"+quantity+"','"+Status+"');";
                status4=st4.executeUpdate(query6);
  
                String query1="select count(*) from category where cname like '"+Category+"%';";
            ResultSet result1=null;
            result1=st1.executeQuery(query1);
            result1.next();
            int c1=0;
            c1=result1.getInt(1);
            
            if(c1==0){
                String query3="select max(cid) from category;";
                result1=st1.executeQuery(query3);
                result1.next();
                c1=0;
                c1=result1.getInt(1);
                c1++;
                Date thisDate=new Date();
                SimpleDateFormat dateForm=new SimpleDateFormat("dd/MM/YYYY");
                String cid=String.valueOf(c1);
                String cname=Category;
                String cstatus="Active";
                String creationdate=dateForm.format(thisDate);
                String updationdate=dateForm.format(thisDate);
                String query2="insert into category values('"+cid+"','"+cname+"','"+cstatus+"','"+creationdate+"','"+updationdate+"');";
                c1=st.executeUpdate(query2);
             }
            
            query1="select count(*) from Author where aname like '"+Author+"%';";
            result1=null;
            result1=st1.executeQuery(query1);
            result1.next();
            c1=0;
            c1=result1.getInt(1);
            
            if(c1==0){
                String query3="select max(aid) from Author;";
                result1=st1.executeQuery(query3);
                result1.next();
                c1=0;
                c1=result1.getInt(1);
                c1++;
                Date thisDate=new Date();
                SimpleDateFormat dateForm=new SimpleDateFormat("dd/MM/YYYY");
                String cid=String.valueOf(c1);
                String cname=Author;
                String cstatus="Active";
                String creationdate=dateForm.format(thisDate);
                String updationdate=dateForm.format(thisDate);
                String query2="insert into Author values('"+cid+"','"+cname+"','"+creationdate+"','"+updationdate+"');";
                c1=st.executeUpdate(query2);
             }
            
            }
            else{
            
            }
            
/*          String query1="select count(*) from category where cname like '"+Category+"%';";
            ResultSet result1=null;
            result1=st1.executeQuery(query1);
            result1.next();
            int c1=0;
            c1=result1.getInt(1);
            
            if(c1==0){
                String query3="select max(cid) from category;";
                result1=st1.executeQuery(query3);
                result1.next();
                c1=0;
                c1=result1.getInt(1);
                c1++;
                Date thisDate=new Date();
                SimpleDateFormat dateForm=new SimpleDateFormat("dd/MM/YYYY");
                String cid=String.valueOf(c1);
                String cname=Category;
                String cstatus="Active";
                String creationdate=dateForm.format(thisDate);
                String updationdate=dateForm.format(thisDate);
                String query2="insert into category values('"+cid+"','"+cname+"','"+cstatus+"','"+creationdate+"','"+updationdate+"');";
                c1=st.executeUpdate(query2);
            }*/
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
            
            if(status4==1){
              out.println(" "
                      + "<div id='msg' style='box-shadow: 0 0 7px green;border: 2px solid green ;'>\n" +
"             <center><h1 style=\"color:green; \"><b><h1>Book Successfuly Added with ID: "+Id+"</h1></center>\n" +
"        </div>");
            }
            else{
                out.println(""
                        + "<div id='msg' style='box-shadow: 0 0 7px red;border: 2px solid red ;'>\n" +
"             <center><h1 style=\"color:red; \"><b><h1>Book with ID: "+Id+"Already Exist....!</h1></b></h1></center>\n" +
"        </div> ");
            }
           // out.println(Name+" "+Genre+" "+" "+Author+" "+Publications+" "+Description+" "+Category+" "+Status+" "+price+" "+quantity+" "+Photo);
            //out.println(Id);
            //out.println("<h1> Servlet book at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(book.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(book.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(book.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(book.class.getName()).log(Level.SEVERE, null, ex);
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
    
