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
import java.text.ParseException;

import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.concurrent.TimeUnit;
/**
 *
 * @author maruthi
 */
public class Demo extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        
        int status=0;
        Class.forName("com.mysql.cj.jdbc.Driver");                
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
            Statement st=con.createStatement();
            Statement st1=con.createStatement();
            Statement st2=con.createStatement();
            
            String query6="truncate Fine";
            status=st.executeUpdate(query6);
            String query2="select * from Issue;";
            ResultSet res=st1.executeQuery(query2);
            ResultSet res1=null;
            ResultSet res2=null;
            ResultSet res3=null;
            
            
            Date thisDate=new java.util.Date();
            SimpleDateFormat dateForm=new SimpleDateFormat("dd/MM/YYYY");
            String cdate=dateForm.format(thisDate)+" 00:00:00";
            String idate="10/10/2023"+" 00:00:00";
            //SimpleDateFormat obj=new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            int duration=0;
            int due=0;
            String name="maru";
            SimpleDateFormat obj=new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            //Date date1=obj.parse(idate);
            //Date date2=obj.parse(cdate);
            //long time_diff=date2.getTime()-date1.getTime();
            //int days=(int)TimeUnit.MILLISECONDS.toDays(time_diff)%365;
            //String rdate="16/10/2023"+" 00:00:00";
           // SimpleDateFormat obj=new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            //Date date1=obj.parse(idate);
            //Date date2=obj.parse(cdate);
           
          //  long time_diff=date2.getTime()-date1.getTime();
            //int days=(int)TimeUnit.MILLISECONDS.toDays(time_diff)%365;
            
            //long days=(time_diff/(1000*60*60*24))%365;
                //Date thisDate=new java.util.Date();
                //SimpleDateFormat dateForm=new SimpleDateFormat("dd/MM/YYYY");
                //String updationdate=dateForm.format(thisDate);
            
           /* String sid="2";
            int bookscount=2;
            int amount=2000;
            String query="insert into Fine values('"+sid+"','"+name+"','"+bookscount+"','"+amount+"')";
            status=st.executeUpdate(query);*/
            try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Demo</title>");            
            out.println("</head>");
            out.println("<body>");
           while(res.next()){
                idate=res.getString("issuedate")+" 00:00:00";
                String dur=res.getString("days");
                duration =Integer.parseInt(dur);
                String sid=res.getString("sid");
                //out.println(sid+" "+" "+idate+" "+duration+ "<br>");
                int bookscount=0;
                Date date2=obj.parse(cdate);
                Date date1=obj.parse(idate);
                long time_diff=date2.getTime()-date1.getTime();
                due=(int)TimeUnit.MILLISECONDS.toDays(time_diff)%365;
                due=due-duration;
                //out.println(due+" "+sid+" <br>");
               if(due>0){
                   
                   String query3="select count(*) from Fine where sid='"+sid+"'";
                   res2=st2.executeQuery(query3);
                   res2.next();
                   int c=res2.getInt(1);
                   if(c==0){
                       bookscount=1;
                        String query="insert into Fine values('"+sid+"','"+name+"','"+bookscount+"','"+due+"')";
                        status=st2.executeUpdate(query);
                        out.println("<br>"+sid+" "+bookscount+"");
                   }
              
                   else if(c>0){
                       String query4="select * from Fine where sid='"+sid+"'";
                       res3=st.executeQuery(query4);
                       int count=0;
                       int amount=0;
                       while(res3.next()){
                           count=res3.getInt("books");
                           amount=res3.getInt("amount");
                       }
                       count++;
                       amount+=due;
                       out.println("hey"+count+" "+amount);
                      String query5="update Fine set books='"+count+"',amount='"+amount+"' where sid='"+sid+"'";
                      status=st2.executeUpdate(query5); 
                   }
                   
                }
            }
            //out.println(Integer.parseInt("0"));
            //out.println(cdate+"<br>");
            //out.println(idate);
            out.println("<h1>Servlet Demo at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(Demo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Demo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(Demo.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Demo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Demo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(Demo.class.getName()).log(Level.SEVERE, null, ex);
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
