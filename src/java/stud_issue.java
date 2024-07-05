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
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
/**
 *
 * @author maruthi
 */
public class stud_issue extends HttpServlet {

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
        String bookid=request.getParameter("bookid");
        String name=request.getParameter("name");
        String author=request.getParameter("author");
        String category=request.getParameter("category");
        String sid=request.getParameter("sid");
        //String idate=request.getParameter("idate");
        //String days=request.getParameter("days");
        //String rdate=request.getParameter("rdate");
        String idate="";
        String rdate="";
        int dur=0;
        String days="";
        Class.forName("com.mysql.cj.jdbc.Driver");                
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
            Statement st=con.createStatement();
            Statement st1=con.createStatement();
            Statement st2=con.createStatement();
            var session=request.getSession();
            String rid=(String) session.getAttribute("rid");
            if(rid!=null){
                sid=rid;
            }
            int q=0;
            String query1="select count(*) from cbooks where id='"+bookid+"' AND quantity !='"+q+"'";
            String query2="select count(*) from Issue where bookid='"+bookid+"' AND sid='"+sid+"'";
            ResultSet result=null;
            ResultSet result1=null;
            int c=0;
            result=st1.executeQuery(query1);
            while(result.next()){
                c=result.getInt(1);
            }
            
            int c1=0;
            result1=st2.executeQuery(query2);
            while(result1.next()){
                c1=result1.getInt(1);
            }
            
            String type="None";
            result=st.executeQuery("select type from Membership where mid='"+sid+"'");
            while(result.next()){
                type=result.getString("type");
            }
            int limit=0;
            
            if(type.equals("Silver")){
                limit=3;
                dur=30;
                days="1 month";
            }
            else if(type.equals("Gold")){
                limit=5;
                dur=90;
                days="3 months";
            }
            else if(type.equals("Diamond")){
                limit=10;
                dur=180;
                days="6 months";
            }
            result=st.executeQuery("select count(*) from Issue where sid='"+sid+"'");
            int ci=0;
            while(result.next()){
                ci=result.getInt(1);
            }
            
            int status=0;
            
            
        java.util.Date thisDate=new java.util.Date();
        SimpleDateFormat dateForm=new SimpleDateFormat("dd/MM/YYYY");
       idate=dateForm.format(thisDate);
        
        Calendar cd=Calendar.getInstance();
        cd.setTime(thisDate);
        
        cd.add(Calendar.DATE,dur);
        java.util.Date current=cd.getTime();
       rdate=dateForm.format(current);
            
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet issuebook</title>");
            
            
            if(c==0){
                out.println("Book not Exist or Unavailable...!");
            }
            else if(limit<=ci){
                out.println("Limit Exceeded...!");
            }
            else if(c1==0){
                
                    String query="insert into Issue values('"+bookid+"','"+name+"','"+author+"','"+category+"','"+sid+"','"+idate+"','"+days+"','"+rdate+"')";
                    
                    status=st.executeUpdate(query);
                    String query5=" select quantity from cbooks where id='"+bookid+"';";
                    ResultSet res4=st.executeQuery(query5);
                    while(res4.next()){
                        q=res4.getInt("quantity");
                    }
                   
                    q--;
                    String query6="update cbooks set quantity='"+q+"' where id='"+bookid+"'";
                    String un="Unavailable";
                    if(q==0){
                        query6="update cbooks set quantity='"+q+"',status='"+un+"' where id='"+bookid+"'";
                    }
                    int xx=st.executeUpdate(query6);
                    out.println("<h1>Book with ID : "+bookid+" Successfully Issued</h1>");
                }
                else{
                    out.println("<h1>Book with ID : "+bookid+" already Issued</h1>");
                }
            
            //while(result.next()){
            //    out.println(result.getString("name"));
            //}
            out.println(rid+" "+ q+" "+limit+" "+type+" "+sid);
            out.println("<br>"+dateForm.format(thisDate)+" "+dateForm.format(current));
            out.println("</head></body>");
            out.println("<h1>Servlet issuebook at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(issuebook.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(issuebook.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(issuebook.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(issuebook.class.getName()).log(Level.SEVERE, null, ex);
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
