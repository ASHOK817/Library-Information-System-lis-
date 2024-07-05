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
import java.text.SimpleDateFormat;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author maruthi
 */
public class delissue extends HttpServlet {

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
       Class.forName("com.mysql.cj.jdbc.Driver");
       Connection con= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
       Statement st=con.createStatement();
       Statement st1=con.createStatement();
       String ID="";
       ID=request.getParameter("rbid");
       if(request.getParameter("ID")!=null){
           ID=request.getParameter("ID");
       }
       
       HttpSession Session=request.getSession();  
       String sid="";
       sid=(String)Session.getAttribute("rid");
       if(request.getParameter("student_id")!=null){
           sid=request.getParameter("student_id");
       }
       String query3="select * from Issue where bookid='"+ID+"' AND sid='"+sid+"'";
                ResultSet res=st.executeQuery(query3);
                //String sid="";
                String dur="None";
                String idate=""; 
                while(res.next()){
                   // sid=res.getString("sid");
                    dur=res.getString("days");
                    idate=res.getString("issuedate");
                }
                int duration=0;
                if(!dur.equals("None")){
                        duration=Integer.parseInt(dur);
                }
       String query="delete from Issue where bookid='"+ID+"' AND sid='"+sid+"';";
       
       String query7="select count(*) from Issue where bookid='"+ID+"' AND sid='"+sid+"'";
       res=st.executeQuery(query7);
       res.next();
       int c=0;
       c=res.getInt(1);
       int status=0;
     
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet delissue</title>");            
            out.println("</head>");
            out.println("<body>");
            //out.println("Maruthi prasad "+ID);
            //out.println(idate);
            
            
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
            if(c!=0){
                ResultSet res8=st.executeQuery("select * from cbooks where id='"+ID+"'");
                
                String totalbooks="0";
                while(res8.next()){
                    totalbooks=res8.getString("quantity");
                }
                int totb=Integer.parseInt(totalbooks);
                if(totb==0){
                    int xyv=st.executeUpdate("update cbooks set status='Available' where id='"+ID+"'");
                }
                
                totb++;
                int y=st.executeUpdate("update cbooks set quantity='"+totb+"' where id='"+ID+"'");
                int count=0;
                java.util.Date thisDate=new java.util.Date();
                SimpleDateFormat dateForm=new SimpleDateFormat("dd/MM/YYYY");
                String cdate=dateForm.format(thisDate);
                String current=cdate;
                //out.println(cdate+" "+idate+"<br> ");
                idate=idate+" 00:00:00";
                cdate=cdate+" 00:00:00";
                //out.println("t");
                int due=0;
                SimpleDateFormat obj=new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                java.util.Date date2=obj.parse(cdate);
                java.util.Date date1=obj.parse(idate);
                long time_diff=date2.getTime()-date1.getTime();
                due=(int)TimeUnit.MILLISECONDS.toDays(time_diff)%365;
                due=due-duration;
                //out.println(due);
                
                if(due>0){
                    
                    String query1="select count(*) from Collection where sid='"+sid+"'";
                    res=st.executeQuery(query1);
                    res.next();
                if(res.getInt(1)==0){
                    count=1;
                    String query4="insert into Collection values('"+sid+"','"+count+"','"+current+"','"+due+"')";
                    status=st1.executeUpdate(query4);
                }
              else{
                    String query6="select * from Collection where sid='"+sid+"'";
                    res=st1.executeQuery(query6);
                    int amount=0;
                    while(res.next()){
                        count=res.getInt("bookcount");
                        amount=res.getInt("amount");
                    }
                    amount=amount+due;
                    count++;
                    out.println("bef");
                    String query5="update Collection set bookcount='"+count+"',date='"+current+"',amount='"+amount+"' where sid='"+sid+"' ";
                    status=st1.executeUpdate(query5);
                    //out.println("aft");
                }
                
                }
            }
                status=st.executeUpdate(query);
                if(status==1){
                   // out.println("<h1>Record with ID: "+ ID+" Successfully Removed</h1>");
                    out.println(" "
                      + "<div id='msg' style='box-shadow: 0 0 7px green;border: 2px solid green ;'>\n" +
"             <center><h1 style=\"color:green; \"><b><h1>Record with ID: "+ ID+" Successfully Removed</h1></b> </div>");
                   HttpSession session=request.getSession();
                   String r=(String)session.getAttribute("rc");
                   out.println(r+"<br>");
                   int rx=Integer.parseInt(r);
                   //out.println(rx+"<br>");
                   rx++;
                   //out.println(rx+"<br>");
                   r=""+rx;
                   session.setAttribute("rc",r);
                   
                }
            else{
               // out.println("<h1>Book with ID: "+ID+" not exit!!!!</h1>");
                out.println(""
                        + "<div id='msg' style='box-shadow: 0 0 7px red;border: 2px solid red ;'>\n" +
"             <center><h1 style=\"color:red; \"><b><h1>Book with ID: "+ID+" not exit!!!!</h1></b></h1></center>\n" +
"        </div> ");
            }
           
           // out.println(Name+" "+Genre+" "+" "+Author+" "+Publications+" "+Description+" "+Category+" "+Status+" "+price+" "+quantity+" "+Photo);
            //out.println(Id);
            //out.println("<h1> Servlet book at " + request.getContextPath() + "</h1>");
            //out.println("</body>");
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
        } catch (ParseException ex) {
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
        } catch (ParseException ex) {
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
