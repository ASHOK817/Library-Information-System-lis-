<%-- 
    Document   : newAdmin
    Created on : 23-Dec-2023, 9:06:50 pm
    Author     : maruthi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.concurrent.TimeUnit"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <style>
            body{
                font-size: 18px;
                background-color: rgb(25, 148, 138);
                font-family:sans-serif;
            }
            .side button{
                width: 93%;
                height: 50px;
                padding: 10px;
                color:black;
                background-color: #24a1d4;
                 border-radius: 5px;
                 font-size: 17px;
                 border: solid white 1px;
                /* box-shadow: inset 0 0 0px,0 0 20px rgb(46, 102, 109);*/
                 margin:10px;
            }
             button{
                width: 93%;
                height: 50px;
                color:white;
                padding: 10px;
                background-color: #3df25b;
                 border-radius: 5px;
                 font-size: 17px;
                 border: solid white 1px;
                 /*box-shadow: inset 0 0 0px,0 0 10px rgb(46, 102, 109);*/
                 margin:4px;
            }
            button:hover{
                font-size: 18px;
                color: white;
            }
          /*  table{
                height: 70vh;
                border: none;
                padding: 10px;
                width: 60%;
                
                
            }
            table td{
                padding: 5px;
                size: 20px;
                
            }*/
            input{
                
             
                

            }
            .side button{

            }
        </style>
    </head>
    <body>
        <div style="display: flex;">
            <div id="sd" style="width: 25%; background-color: #c8d8e3;border-top-right-radius: 10px;" class="side">
                <h2 style="padding-left:60px; padding-top: 15px;font-size: 35px;color:rgb(19, 49, 54)"><b>ADMIN</b></h2>
                <a href='index.jsp'><button ></i>Home Page</button></a>
                <button id="dash"><i class="fa-solid fa-table-cells-large"></i> Dash-Board</button>
                <button id="book"><i class="fa-solid fa-book"></i> Books</button>
                <button id="Iss"><i class="fa-solid fa-book"></i> Issue Book</button>
                <button id="Fine"><i class="fa-solid fa-book"></i> Penality System</button>
                <button id="categ"><i class="fa-solid fa-list"></i> Categories</button>
                <button id="auth"><i class="fa-solid fa-address-book"></i> Authors</button>
                <button id="Stud"><i class="fa-solid fa-user"></i> Register Student</button>
                <button id="Adm"><i class="fa-solid fa-user"></i>  Add Admin</button>
                <button id="pass"><i class="fa-solid fa-key"></i> Change Password</button>
                <a href='index.jsp'><button><i class="fa-solid fa-right-from-bracket"></i> Logout</button></a>
            </div>
            <div style="background-color: #d0e6f5; width: 100%;border-top-left-radius: 10px;">
                <div></div>
                 <%  
           Statement st15=null;
           ResultSet result15=null;
           int bcc=0;
            try{
           Class.forName("com.mysql.cj.jdbc.Driver");                
           Connection con5=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
            st15=con5.createStatement();
            result15 =st15.executeQuery("select count(*) from cbooks;");
            result15.next();
            bcc=result15.getInt(1);
            }catch(Exception e){
                     
            }
            
           
           %>
                
                <center><h1>ONLINE LIBRARY MANAGEMENT SYSTEM</h1></center>
                <hr style="height: 5px;background-color:rgb(71, 167, 159);">
                <div id="das">
                <div class="d-flex justify-content-center ms-3 me-3 rounded-top-3 mb-3" style="background-color:#24a1d4;color: white;">
                        <h1>Dash-Board</h1>
                </div>
                <div style="border: solid black 1px; padding: 20px; margin: 15px ;margin-bottom: 60px; border-radius: 10px;">                    
                    <h2 style="margin: 25px;">Welcome Adminstrator.....!</h2>
                    <div style="display: flex;justify-content: space-around;">
                        <div style="height: 70px; width: 300px; background-color: darkgray;display: flex; border-radius: 5px;"><div style="padding: 5px;"><img src="images/c15.png" width="60px" height="60px" style="border-radius: 5px;"></div><div style="text-align: center;margin-top: 15px;margin-left: 20px; ">Book Listed <br> 
                            <%
                                HttpSession Session=request.getSession();
                                
                                out.println(bcc);%>    
                            </div></div>
                        <div style="height: 70px; width: 300px; background-color: darkgray;display: flex; border-radius: 5px;"><div style="padding: 5px;"><img src="images/c15.png" width="60px" height="60px" style="border-radius: 5px;"></div><div style="text-align: center;margin-top: 15px;margin-left: 20px; ">Book issued <br> 
                                <%
                                //String user=(String)Session.getAttribute("ic"); 
                                //out.println(user);
                                result15 =st15.executeQuery("select count(*) from Issue;");
                                result15.next();
                                out.println(result15.getInt(1));
                                    %>
                                </div></div>
                        <div style="height: 70px; width: 300px; background-color: darkgray;display: flex; border-radius: 5px;"><div style="padding: 5px;"><img src="images/c15.png" width="60px" height="60px" style="border-radius: 5px;"></div><div style="text-align: center;margin-top: 15px;margin-left: 20px; ">Book Returned <br> 
                                <%
                                //String rc=(String)Session.getAttribute("rc"); 
                                //out.println(rc);
                                result15 =st15.executeQuery("select count(*) from Collection;");
                                result15.next();
                                out.println(result15.getInt(1));
                                %>
                            </div></div>
                    </div>
                    <div style="display: flex;justify-content: space-around; margin-top: 40px;">
                        <div style="height: 70px; width: 300px; background-color: darkgray;display: flex; border-radius: 5px;"><div style="padding: 5px;"><img src="images/c15.png" width="60px" height="60px" style="border-radius: 5px;"></div><div style="text-align: center;margin-top: 15px;margin-left: 20px; ">Registered Users <br>
                                <%
                                //String rs=(String)Session.getAttribute("rs"); 
                                //out.println(rs);
                                result15 =st15.executeQuery("select count(*) from Membership;");
                                result15.next();
                                out.println(result15.getInt(1));
                                %>
                                </div></div>
                        <div style="height: 70px; width: 300px; background-color: darkgray;display: flex; border-radius: 5px;"><div style="padding: 5px;"><img src="images/c15.png" width="60px" height="60px" style="border-radius: 5px;"></div><div style="text-align: center;margin-top: 15px;margin-left: 20px; ">Authors Listed <br>
                            <%
                                //String ac=(String)Session.getAttribute("ac"); 
                                //out.println(ac);
                                result15 =st15.executeQuery("select count(*) from Author;");
                                result15.next();
                                out.println(result15.getInt(1));
                            %>    
                            </div></div>
                        <div style="height: 70px; width: 300px; background-color: darkgray;display: flex; border-radius: 5px;"><div style="padding: 5px;"><img src="images/c15.png" width="60px" height="60px" style="border-radius: 5px;"></div><div style="text-align: center;margin-top: 15px;margin-left: 20px; ">Listed Categories<br>
                            <%
                                //String cc=(String)Session.getAttribute("cc"); 
                                //out.println(cc);  
                                result15 =st15.executeQuery("select count(*) from category;");
                                result15.next();
                                out.println(result15.getInt(1));%>
                            </div></div>
                    </div>
                </div>
            </div>
                <div id="new" style="display: none;">
                    <div class="d-flex justify-content-center ms-2 me-2 b-radius border border-info rounded-top-3 mb-3" style="background-color:#24a1d4;color: white;">
                        <h1>Manage Books</h1>
                    </div>
                     <div class="justify-content-between" id="bb" style="display:flex;">
                        <div>
                        <button type="button" class="btn btn-success ms-4" style="width:200px;" onclick="bissbook()">Add Book</button>
                        </div>
                        <div>
                        <button type="button" style="width:200px;" class="btn btn-danger me-5" data-bs-toggle="modal" data-bs-target="#staticBackdrop"> Remove Book </button>   
                        </div>
                 </div> 
                    <div class="justify-content-between" id="bbb" style="display:none">
                        <div>
                        <button type="button" class="btn btn-success ms-4" style="width:200px;" onclick="bIssbook()">View All Books</button>
                        </div>
                        <div>
                        <button type="button" style="width:200px;" class="btn btn-danger me-5" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Remove Book </button>   
                        </div>
                 </div>   
                     
                    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" style="margin-left:165px" id="staticBackdropLabel"><b>REMOVE BOOK</b></h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form class="p-4" action="Deletebook" method="post">
                                    <div class="row m-1">
                                        <div class="col-5">
                                            <label class="form-label" for="ID">BOOK ID :</label>
                                        </div>
                                        <div class="col-7">
                                         <input type="text" id="ID"name="ID" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="row m-1">
                                        <div class="col-5">
                                            <label class="form-label" for="ID">BOOK NAME :</label>
                                        </div>
                                        <div class="col-7">
                                         <input type="text" id="ID" name="Name" class="form-control-sm">
                                        </div>
                                    </div>
                                    
                                    <div class="d-flex mt-3 justify-content-center">
                                        <input type="submit"value="REMOVE" class="form-control-sm">
                                    </div>
                                              
                                </form>
                            </div>
                            
                    </div>
                    </div>
                    </div>
                    <div id="aab" style="display:none;">
                    <div class="m-4 ms-5 me-5 rounded-3 p-3" style="border:2px solid black;">
                    <div class="row justify-content-center">
                        
                        <div class="col-10">
                            <center><h2 class="m-3">ADD NEW BOOK</h2></center>
                             <form action="book" method="post">
                                 <div class="row">
                                     <div class="col-6">
                                         <div class="form-floating mb-4">
                                             <input class="form-control" required type="text"name="name" id="fauth" placeholder="Book Name" Style="height:69px; background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">Book Name</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" required type="text"name="genre" id="fauth" placeholder="Genre" Style=" height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">Genre</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" required type="text"name="author" id="fcd" placeholder="Author" Style=" height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fcd">Author</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" required type="text"name="publications" id="fud" placeholder="Publications" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud">Publications</label>
                                        </div>
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="description" id="fud" placeholder="Description" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud">Description</label>
                                        </div>
                                     </div>
                                     <div class="col-6">
                                         <div class="mb-4">
                                             <select class="form-select" required name="categor" aria-label="Default select example" style="height:69px; border: none;border-bottom: 2px solid black;background: transparent;font-size: 18px;">
                                                <option value="null">Select Category</option>
                                                <option value="Inter">Inter</option>
                                                <option value="SSC">SSC</option>
                                                <option value="Btech">Btech</option>
                                                <option value="Phd">Phd</option>
                                                <option value="Stories">Stories</option>
                                                <option value="MBBS">MBBS</option>
                                        </select>
                                         </div>
                                         
                                        <div class="form-floating mb-4">
                                            <input class="form-control" required type="number"name="price" id="fud" placeholder="Price" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" style="margin-left:275px;">Price</label>
                                        </div>
                                         <div class="form-floating mb-4">
                                            <input class="form-control" required type="number"name="quantity" id="fud" placeholder="Quantity" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" style="margin-left:265px;">Quantity</label>
                                        </div>
                                         <div class="mb-4">
                                             <select class="form-select" required name="status" aria-label="Default select example" style="height:69px; border: none;border-bottom: 2px solid black;background: transparent;font-size: 18px;">
                                                <option value="null">Select Status</option>
                                                <option value="Available">Available</option>
                                                <option value="Unavailable">Unavailable</option>
                                                
                                        </select>
                                         </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" required type="file" name="photo" id="fud" placeholder="Book Photo" Style="height:69px;background: transparent;margin-left: 10px; border: none; border-bottom: 2px solid black;">
                                            <label for="fud" style="margin-left:265px; margin-top: 13px;">Book Photo</label>
                                        </div>
                                        
                                     </div>
                                 </div>
                                <div class="form-floating mb-4 ms-3">
                                    <button class="btn p-auto" type="submit" style="background-color: #04a5d6; font-size: 28px;"><b>ADD</b></button>
                                </div>
                               </form>
                        </div>   
                    </div>
                    </div>
                </div>
                  
                   <div id="vb">
                        <%  
           int bTot=0;
           
            try{
           Class.forName("com.mysql.cj.jdbc.Driver");                
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
            Statement st5=con.createStatement();
            Statement st7=con.createStatement();
            Statement st8=con.createStatement();
            ResultSet result5 =st5.executeQuery("select * from cbooks");
            ResultSet result6=null;
            result6=st7.executeQuery("select count(*) from cbooks");
            result6.next();
            bTot=result6.getInt(1);
            int sss=st7.executeUpdate("truncate Fine");
            String idate="";
            String rdate="";
            String dur="None";
            int duration=0;
            String query8="select * from Issue";
            ResultSet res8=st8.executeQuery(query8);
            ResultSet res9=null;
            while(res8.next()){
                String sid=res8.getString("sid");
                String name="";
                dur=res8.getString("days");
                idate=res8.getString("issuedate");
                rdate=res8.getString("returndate");
                //out.println(sid+"\t");
                res9= st7.executeQuery("select * from Membership where mid='"+sid+"'");
                while(res9.next()){
                    name=res9.getString("fname");
                 }
                if(!dur.equals("None")){
                      duration=Integer.parseInt(dur);
                }
                java.util.Date thisDate=new java.util.Date();
                SimpleDateFormat dateForm=new SimpleDateFormat("dd/MM/YYYY");
                String cdate=dateForm.format(thisDate);
                String current=cdate;
                idate=idate+" 00:00:00";
                cdate=cdate+" 00:00:00";
                int due=0;
                SimpleDateFormat obj=new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                java.util.Date date2=obj.parse(cdate);
                java.util.Date date1=obj.parse(idate);
                long time_diff=date2.getTime()-date1.getTime();
                due=(int)TimeUnit.MILLISECONDS.toDays(time_diff)%365;
                due=due-duration;
               // out.println(name+"\t"+idate+"\t"+rdate+"\t"+dur+"\t"+duration+"\t"+current+"\t"+due);
                //out.println("<br>");
                res9=st7.executeQuery("select count(*) from Fine where sid='"+sid+"'");
                int sfc=0;
                res9.next();
                sfc=res9.getInt(1);
                int books_count=0;
                if(due>0){
                if(sfc==0){
                    books_count=1;
                    String query15="insert into Fine values('"+sid+"','"+name+"','"+books_count+"','"+due+"')";
                    int xyz=st7.executeUpdate(query15);
                 }
                else{
                    int amount=0;
                    res9=st7.executeQuery("select * from Fine where sid='"+sid+"'");
                    while(res9.next()){
                        books_count=res9.getInt("books");
                        amount=res9.getInt("amount");
                    }
                    amount=amount+due;
                    books_count++;
                    String query15="update Fine set books='"+books_count+"',amount='"+amount+"' where sid='"+sid+"'";
                    int xyz=st7.executeUpdate(query15);
                    }
                 }
            }
            
            /* ResultSet res=st.executeQuery(query3);
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
            java.util.Date thisDate=new java.util.Date();
                SimpleDateFormat dateForm=new SimpleDateFormat("dd/MM/YYYY");
                String cdate=dateForm.format(thisDate);
                String current=cdate;
                out.println(cdate+" "+idate+"<br> ");
                idate=idate+" 00:00:00";
                cdate=cdate+" 00:00:00";
                out.println("t");
                int due=0;
                SimpleDateFormat obj=new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                java.util.Date date2=obj.parse(cdate);
                java.util.Date date1=obj.parse(idate);
                long time_diff=date2.getTime()-date1.getTime();
                due=(int)TimeUnit.MILLISECONDS.toDays(time_diff)%365;
                due=due-duration;
                out.println(due);
            
           */
           %>
            <table align="center" width="96%" class="mt-5 mb-5">
                <tr style="border:2px solid black;font-size: 20px;height: 50px; "><th colspan="8"><center>Books Listed</center></th></tr>
                <tr style="border:2px solid black; margin-left: 30px;">
                    <th class="ps-3">Book_id</th><th>Name</th><th>Author</th><th>Category</th><th>Publications</th><th class="ps-1">Price</th><th>Status</th>
                </tr>    
            
            <%while(result5.next()){%>
                
                <tr style="border:1px solid black;">
                    <td class="ps-2"><% out.println(result5.getString("id"));%></td>
                    <td class="ps-0"><% out.println(result5.getString("title"));%></td>
                    <td class="ps-0"><% out.println(result5.getString("author"));%></td>
                    <td class="ps-0"><% out.println(result5.getString("category"));%></td>
                    <td class="ps-0"><% out.println(result5.getString("price"));%></td>
                    <td class="ps-0"><% out.println(result5.getString("quantity"));%></td>
                    <td class="ps-0"><% out.println(result5.getString("status"));%></td>
                    <td><a href="Bookkupd.jsp?bid=<% out.print(result5.getString("id"));%>"><button class="btn btn-success p-0" style="width:100px; height:35px;">Update</button></a>
                    <a href="Deletebook?dbbid=<% out.print(result5.getString("id"));%>"><button class="btn btn-danger ms-auto" style="width:100px; height:35px;">Delete</button></a></td>
                </tr>
                
           <% }%>
           
             <tr style="border:2px solid black;font-size: 20px;color: red; "><th colspan="8"><center>Total Books : <% out.println(bTot);%></center></th></tr>
            </table>
            <% 
            }catch(Exception e){
            
            }%>
                         
                      
                   </div>
                    <script>
                        function bissbook(){
             event.preventDefault();
             document.getElementById("bb").style.display="none";
             document.getElementById("bbb").style.display="flex";
             document.getElementById("aab").style.display="grid";
             document.getElementById("vb").style.display="none";
         }
         function bIssbook(){
             event.preventDefault();
             document.getElementById("bb").style.display="flex";
             document.getElementById("bbb").style.display="none";
             document.getElementById("aab").style.display="none";
             document.getElementById("vb").style.display="grid";
         }</script>
                </div>
            
                <div id="issue" style="display: none;">
                   <div class="d-flex justify-content-center ms-2 me-2 b-radius border border-info rounded-top-3 mb-3" style="background-color:#24a1d4;color: white;">
                        <h1>Issue and Return Books</h1>
                    </div> 
                <div class="justify-content-between" id="ib" style="display:flex;">
                        <div>
                        <button type="button" class="btn btn-success ms-4" style="width:200px;" onclick="ibissbook()">Issue Book</button>
                        </div>
                        <div>
                        <button type="button" style="width:200px;" class="btn btn-danger me-4" data-bs-toggle="modal" data-bs-target="#staticBackdrop2"> Return Book </button>   
                        </div>
                 </div> 
                    <div class="justify-content-between" id="iib" style="display:none">
                        <div>
                        <button type="button" class="btn btn-success ms-4" style="width:200px;" onclick="ibIssbook()">View Issued Books</button>
                        </div>
                        <div>
                        <button type="button" style="width:200px;" class="btn btn-danger ms-4" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">Return Book </button>   
                        </div>
                    </div>
                 <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel" style="margin-left:165px"><b>RETURN BOOK</b></h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form class="p-4" action="delissue" method="post">
                                    <div class="row m-1">
                                        <div class="col-5">
                                            <label class="form-label" for="ID">BOOK ID :</label>
                                        </div>
                                        <div class="col-7">
                                         <input type="text" required id="ID"name="ID" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="row m-1">
                                        <div class="col-5">
                                            <label class="form-label" for="Name">BOOK NAME :</label>
                                        </div>
                                        <div class="col-7">
                                         <input type="text" id="Name" name="Name" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="row m-1">
                                        <div class="col-5">
                                            <label class="form-label"  for="Name">STUDENT_ID :</label>
                                        </div>
                                        <div class="col-7">
                                         <input type="text" id="Name" required name="student_id" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <input type="submit"value="REMOVE" class="form-control-sm">
                                    </div>
                                              
                                </form>
                            </div>
                            
                    </div>
                    </div>
                    </div>
                        <div id="aib" style="display:none;">
                <div class="m-4 ms-5 me-5 rounded-3 p-3" style="border:2px solid black;">
                    <div class="row justify-content-center">
                        
                        <div class="col-10">
                            <center><h2 class="m-3">ISSUE BOOK</h2></center>
                             <form action="issuebook" method="post">
                                 <div class="row">
                                     <div class="col-6">
                                         <div class="form-floating mb-4">
                                            <input class="form-control" required type="text"name="bookid" id="fauth" placeholder="Book Id" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">Book Id</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control"  type="text"name="name" id="fauth" placeholder="Book Name" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">Book Name</label>
                                        </div>
                                        
                                       
                                     </div>
                                     <div class="col-6">
                                         <div class="form-floating mb-4">
                                            <input class="form-control"  type="text"name="author" id="fcd" placeholder="Author Name" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fcd">Author Name</label>
                                        </div>
                                         <div class="form-floating mb-4">
                                            <input class="form-control" required type="text"name="sid" id="fud" placeholder="Student Id" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud">Student Id</label>
                                         </div>
                                        
                                     </div>
                                 </div>
                                <div class="form-floating mb-4 ms-3">
                                    <button class="btn btn-secondary p-auto" type="submit" style="font-size: 28px;"><b>ISSUE</b></button>
                                </div>
                               </form>
                        </div>   
                    </div>
                    </div>
                    </div>
                    <div id="vib">
                        <%  
           int ibTot=0;
           
            try{
           Class.forName("com.mysql.cj.jdbc.Driver");                
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
            Statement st5=con.createStatement();
            Statement st7=con.createStatement();
            ResultSet result5 =st5.executeQuery("select * from Issue");
            ResultSet result6=null;
            result6=st7.executeQuery("select count(*) from Issue");
            result6.next();
            ibTot=result6.getInt(1);
                
           
           %>
            <table align="center" width="96%" class="mt-5">
                <tr style="border:2px solid black;font-size: 20px;height: 50px; "><th colspan="8"><center> Issued Books Listed</center></th></tr>
                <tr style="border:2px solid black; margin-left: 30px;">
                    <th class="ps-3">Book_id</th><th>Name</th><th>Author</th><th>Category</th><th>Stud_Id</th><th>Issue_Date</th><th>Duration</th><th>Return_Date</th>
                </tr>    
            
            <%while(result5.next()){%>
                
                <tr style="border:1px solid black;">
                    <td class="ps-4"><% out.println(result5.getString("bookid"));%></td>
                    <td class="ps-0"><% out.println(result5.getString("name"));%></td>
                    <td class="ps-4"><% out.println(result5.getString("author"));%></td>
                    <td class="ps-4"><% out.println(result5.getString("category"));%></td>
                    <td class="ps-4"><% out.println(result5.getString("sid"));%></td>
                    <td class="ps-4"><% out.println(result5.getString("issuedate"));%></td>
                    <td class="ps-4"><% out.println(result5.getString("days"));%></td>
                    <td class="ps-4"><% out.println(result5.getString("returndate"));%></td>
                    
                </tr>
                
           <% }%>
           
             <tr style="border:2px solid black;font-size: 20px;color: red; "><th colspan="8"><center>Total Issued Books : <% out.println(ibTot);%></center></th></tr>
            </table>
            <% 
            }catch(Exception e){
            
            }%>
                    </div>
             
                                  <script>
                        function ibissbook(){
             event.preventDefault();
             document.getElementById("ib").style.display="none";
             document.getElementById("iib").style.display="flex";
             document.getElementById("aib").style.display="grid";
             document.getElementById("vib").style.display="none";
         }
         function ibIssbook(){
             event.preventDefault();
             document.getElementById("ib").style.display="flex";
             document.getElementById("iib").style.display="none";
             document.getElementById("aib").style.display="none";
             document.getElementById("vib").style.display="grid";
         }</script>
                </div>
            <div id="fine" style="display: none;">
                    <div class="d-flex justify-content-center ms-2 me-2 b-radius border border-info rounded-top-3 mb-3" style="background-color:#24a1d4;color: white; ">
                        <h1>Penality Records</h1>
                    </div>
                    <!--<div class="d-flex justify-content-between">
                        <div>
                        <a href="Demo"> <button type="button" class="btn btn-success ms-4" style="width:200px;">View All Books</button></a>
                        </div>
                        <div>
                        <button type="button" style="width:200px;" class="btn btn-danger me-4" data-bs-toggle="modal" data-bs-target="#staticBackdrop"> Delete Book Record</button>   
                        </div>
                    </div>  -->
                       
           <%  
           int TotAmt=0;
           int Tot=0;
            try{
           Class.forName("com.mysql.cj.jdbc.Driver");                
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
            Statement st5=con.createStatement();
            Statement st7=con.createStatement();
            ResultSet result5 =st5.executeQuery("select * from Fine");
            ResultSet result6=null;
            result6=st7.executeQuery("select SUM(amount) from Fine");
            result6.next();
            TotAmt=result6.getInt(1);
                
            Statement st=con.createStatement();
            Statement st1=con.createStatement();
            ResultSet res=st.executeQuery("select * from Collection;");
            ResultSet res1=st1.executeQuery("select SUM(amount) from Collection;");
            res1.next();
            Tot=res1.getInt(1);
            res1=st1.executeQuery("select COUNT(*) from Fine;");
            int pc=0;
            res1.next();
            pc=res1.getInt(1);
           %>
           <%
               if(pc==0){
                    out.println("<marquee behaviour='scroll' width='80%'  style='color:red;margin-left:100px; margin-top: 30px;'>No Over Dues.......!</marquee>");
               }
               else{
                    out.println("<marquee behaviour='scroll' width='80%'  style='color:red;margin-left:100px; margin-top: 30px;'>"+pc+" Students Over Dues</marquee>");
               }
           %>
           
            <table align="center" width="80%" class="mt-3">
                <tr style="border:2px solid black;font-size: 20px;height: 50px; "><th colspan="4"><center>Over Due Student List</center></th></tr>
                <tr style="border:2px solid black; margin-left: 30px;">
                    <th class="ps-3">Sid</th><th>Name</th><th>No_of_books</th><th>Amount</th>
                </tr>    
            
            <%while(result5.next()){%>
                
                <tr style="border:1px solid black;">
                    <td class="ps-4"><% out.println(result5.getString("sid"));%></td>
                    <td class="ps-0"><% out.println(result5.getString("name"));%></td>
                    <td class="ps-4"><% out.println(result5.getString("books"));%></td>
                    <td class="ps-4"><% out.println(result5.getString("amount"));%></td>
                </tr>
                
           <% }%>
           
             <tr style="border:2px solid black;font-size: 20px;color: red; "><th colspan="4"><center>Total Pending Due : <% out.println(TotAmt);%></center></th></tr>
            </table>
             
            
            <table align="center" width="80%" class="mt-5 mb-5">
                <tr style="border:2px solid black;font-size: 20px;height: 50px; "><th colspan="4"><center>Total Penality</center></th></tr>
                <tr style="border:2px solid black; margin-left: 30px;">
                    <th class="ps-3">Sid</th><th>No_of_books</th><th>date</th><th>Amount</th>
                </tr>    
            
            <%while(res.next()){%>
                
                <tr style="border:1px solid black;">
                    <td class="ps-4"><% out.println(res.getString("sid"));%></td>
                    <td class="ps-0"><% out.println(res.getString("bookcount"));%></td>
                    <td class="ps-4"><% out.println(res.getString("date"));%></td>
                    <td class="ps-4"><% out.println(res.getString("amount"));%></td>
                </tr>
                
           <% }
            }catch(Exception e){
            
            }%>
               <tr style="border:2px solid black;font-size: 20px;color: red; "><th colspan="4"><center>Total Due Collected : <% out.println(Tot);%></center></th></tr>
            </table>          
            
              </div>  
            
                <div id="student" style="display: none;">
                    <div class="d-flex justify-content-center ms-2 me-2 b-radius border border-info rounded-top-3 mb-3" style="background-color:#24a1d4;color: white;">
                        <h1>Manage Users</h1>
                    </div>
                    <div class="justify-content-between" id="nb" style="display:flex;">
                        <div>
                        <button type="button" class="btn btn-success ms-4" style="width:200px;" onclick="issbook()">Register User</button>
                        </div>
                        <div>
                        <button type="button" style="width:200px;" class="btn btn-danger me-4" data-bs-toggle="modal" data-bs-target="#staticBackdrop4"> Remove User </button>   
                        </div>
                 </div> 
                    <div class="justify-content-between" id="nnb" style="display:none">
                        <div>
                        <button type="button" class="btn btn-success ms-4" style="width:200px;" onclick="Issbook()">View Users</button>
                        </div>
                        <div>
                        <button type="button" style="width:200px;" class="btn btn-danger me-4" data-bs-toggle="modal" data-bs-target="#staticBackdrop4">Remove User </button>   
                        </div>
                 </div>
                 <div class="modal fade" id="staticBackdrop4" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel" style="margin-left:165px;"><b>Remove User</b></h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form class="p-4" action="DelReg" method="post">
                                    <div class="row m-1">
                                        <div class="col-4">
                                            <label class="form-label" required for="ID">USER ID :</label>
                                        </div>
                                        <div class="col-8">
                                         <input type="text" id="ID"name="ID" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="row m-1">
                                        <div class="col-4">
                                            <label class="form-label" for="Name">USER NAME :</label>
                                        </div>
                                        <div class="col-8">
                                         <input type="text" id="Name" name="Name" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <input type="submit"value="REMOVE" class="form-control-sm">
                                    </div>
                                              
                                </form>
                            </div>
                            
                    </div>
                    </div>
                    </div>
                    <div id="astud" style="display:none;">
                <div class="m-4 ms-5 me-5 rounded-3 p-3" style="border:2px solid black;">
                    <div class="row justify-content-center">
                        
                        <div class="col-10">
                           
                             <form action="membership" method="post">
                                 <div class="row" id="d1" style="display: flex;">
                                      <center><h2 class="m-3">Personal Details</h2></center>
                                     <div class="col-6">
                                         <div class="mb-4">
                                             <select class="form-select" name="category" aria-label="Default select example" style="height:69px; border: none;border-bottom: 2px solid black;background: transparent;font-size: 18px;">
                                                <option value="null">Select Membership</option>
                                                <option value="Silver">Silver</option>
                                                <option value="Gold">Gold</option>
                                                <option value="Diamond">Diamond</option>
                                              
                                        </select>
                                         </div>
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="text" required name="fname" id="fauth" placeholder="First Name" Style="height:69px; background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">First Name</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"  name="lname" id="fauth" placeholder="Last Name" Style=" height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">Last Name</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" required type="text"name="mobile" id="fcd" placeholder="Mobile Number" Style=" height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fcd">Mobile Number</label>
                                        </div>
                                        
                                     </div>
                                     <div class="col-6">
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="text" required name="aname" id="fud" placeholder="Password" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud">Password</label>
                                        </div>
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="email" required name="email" id="fud" placeholder="Email" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" >Email</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text" required name="aadhar" id="fud" placeholder="Aadhar Number" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" >Aadhar Number</label>
                                        </div>
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="file" name="photo" id="fud" placeholder="Profile Photo" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" style="margin-left:270px;">Profile Photo</label>
                                        </div>
                                       
                                        
                                     </div>
                                     <div class="mb-4 d-flex justify-content-center ">
                                        <button class="btn btn-secondary p-auto" type="submit" style="font-size: 28px; width:100px;"onclick='display()'><b><i class="fa-solid fa-arrow-right"></i></b></button>
                                    </div>
                                 </div>
                                 
                                 
                                 
                                 <div class="row" id='d2' style='display: none;'>
                                     <center><h2 class="m-3">Address Details</h2></center>
                                     <div class="col-6">
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="text"required name="dno" id="fauth" placeholder="D.No" Style="height:69px; background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">D.No</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text" required name="village" id="fauth" placeholder="Village" Style=" height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">Village</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text" required name="mandal" id="fcd" placeholder="Mandal" Style=" height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fcd">Mandal</label>
                                        </div>
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="text"required name="district" id="fcd" placeholder="District" Style=" height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fcd">District</label>
                                        </div>
                                        
                                     </div>
                                     
                                     <div class='col-6'> 
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"required name="state" id="fud" placeholder="State" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" >State</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"required name="country" id="fud" placeholder="Counry" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" >Country</label>
                                        </div>
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="number" required name="pincode" id="fud" placeholder="Pincode" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud">Pincode</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control"name="proof" required type="file" id="fud" placeholder="Proof" Style="height:69px;background: transparent;margin-left: 10px; border: none; border-bottom: 2px solid black;">
                                            <label for="fud" style="margin-left:320px; margin-top: 13px;">Proof</label>
                                        </div>
                                 </div>
                                     <div class="mb-4 d-flex justify-content-between ">
                                    <button class="btn btn-secondary" onclick="previous()" style="font-size: 28px;width: 100px;"><b><i class="fa-solid fa-arrow-left"></i></b></button>
                                            <button class="btn btn-secondary" type="submit" style="font-size: 28px;width:200px;"><b>SUBMIT</b></button>
                                </div>
                               </form>
                        </div>   
                    </div>
                    </div>
        </div>
                </div>
        
        
        <div id="rstud" style="display:flex;">    
         <%  
           int RTot=0;
           
            try{
           Class.forName("com.mysql.cj.jdbc.Driver");                
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
            Statement st5=con.createStatement();
            Statement st7=con.createStatement();
            ResultSet result5 =st5.executeQuery("select * from Membership");
            ResultSet result6=null;
            result6=st7.executeQuery("select count(*) from Membership");
            result6.next();
            RTot=result6.getInt(1);
                
          
           %>
            <table align="center" width="95%" class="mt-5 mb-5">
                <tr style="border:2px solid black;font-size: 20px;height: 50px; "><th colspan="7"><center>Registered Student List</center></th></tr>
                <tr style="border:2px solid black; margin-left: 30px;">
                    <th class="ps-1">Id</th><th>First_Name</th><th>Last_Name</th><th class="ps-3">Mobile</th><th class="ps-3">Email</th><th class="ps-3">Membership</th>
                </tr>    
            
            <%while(result5.next()){%>
                
                <tr style="border:1px solid black;">
                    <td class="ps-2"><% out.println(result5.getString("mid"));%></td>
                    <td><% out.println(result5.getString("fname"));%></td>
                    <td><% out.println(result5.getString("lname"));%></td>
                    <td><% out.println(result5.getString("mobile"));%></td>
                    <td ><% out.println(result5.getString("email"));%></td>
                    <td ><% out.println(result5.getString("type"));%></td>
                    <td><a href="Regupd.jsp?rrid=<% out.println(result5.getString("mid"));%>"><button class="btn btn-success p-0" style="width:100px; height:35px;">Update</button></a>
                    <a href="DelReg?drrid=<% out.println(result5.getString("mid"));%>"><button class="btn btn-danger p-0" style="width:100px; height:35px;">Delete</button></a></td>
                </tr>
                
           <% }%>
           
             <tr style="border:2px solid black;font-size: 20px;color: red; "><th colspan="7"><center>Total Registered Users : <% out.println(RTot);%></center></th></tr>
            </table>
             
            <%}catch(Exception e){
            
            }%>
        </div>
         
        <script>
            function display(){
                event.preventDefault();
                var d1=document.getElementById("d1");
                var d2=document.getElementById("d2");
                d2.style.display="flex";
                d1.style.display="none";
            }
            function issbook(){
             event.preventDefault();
             document.getElementById("nb").style.display="none";
             document.getElementById("nnb").style.display="flex";
             document.getElementById("astud").style.display="grid";
             document.getElementById("rstud").style.display="none";
         }
         function Issbook(){
             event.preventDefault();
             document.getElementById("nnb").style.display="none";
             document.getElementById("nb").style.display="flex";
             document.getElementById("astud").style.display="none";
             document.getElementById("rstud").style.display="grid";
         }
        </script>
          
        
        </div>
                
                
                <div id="category" style="display: none;">
                    <div class="d-flex justify-content-center ms-2 me-2 b-radius border border-info rounded-top-3 " style="background-color:#24a1d4;color: white; ">
                        <h1>Manage Categories</h1>
                    </div>
                    <div class="justify-content-between" id="cb" style="display:flex;">
                        <div>
                        <button type="button" class="btn btn-success m-4" style="width:200px;" onclick="cissbook()">Add Category</button>
                        </div>
                        <div>
                        <button type="button" style="width:200px;" class="btn btn-danger m-4" data-bs-toggle="modal" data-bs-target="#staticBackdrop5"> Remove Category </button>   
                        </div>
                 </div> 
                    <div class="justify-content-between" id="ccb" style="display:none">
                        <div>
                        <button type="button" class="btn btn-success m-4" style="width:200px;" onclick="cIssbook()">View Categories</button>
                        </div>
                        <div>
                        <button type="button" style="width:200px;" class="btn btn-danger m-4" data-bs-toggle="modal" data-bs-target="#staticBackdrop5">Remove Category </button>   
                        </div>
                 </div>
                    
                 <div class="modal fade" id="staticBackdrop5" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" style="margin-left:165px;" id="staticBackdropLabel"><b>Remove Category</b></h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form class="p-4" action="delcategory" method="post">
                                    <div class="row m-1">
                                        <div class="col-5">
                                            <label class="form-label"required for="ID">Category Id :</label>
                                        </div>
                                        <div class="col-7">
                                         <input type="text" id="ID" name="ID" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="row m-1">
                                        <div class="col-5">
                                            <label class="form-label" for="Name">Category Name :</label>
                                        </div>
                                        <div class="col-7">
                                         <input type="text" id="Name" name="Name" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <input type="submit"value="REMOVE" class="form-control-sm">
                                    </div>
                                              
                                </form>
                            </div>
                            
                    </div>
                    </div>
                    </div>
                    <div id="ac" style="display:none;">
                    <div class="m-4 ms-5 me-5 p-3 rounded-3" style="border:2px solid black;">
                    <div class="row justify-content-center">
                        
                        <div class="col-6">
                            <center><h2>ADD CATEGORY</h2></center>
                             <form action="addCategory" method="post">
                                <div class="form-floating mb-4">
                                        <input class="form-control"name="category"required type="text" id="fauth" placeholder="Category" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth">Category</label>
                                </div>
                                 
                                 <div class="mb-3">
                                        <select class="form-select" name="cstatus"required aria-label="Default select example" style="height:69px; border: none;border-bottom: 2px solid black;background: transparent;font-size: 18px;">
                                                <option value="Active">Active</option>
                                                <option value="Inactive">Inactive</option>
                                        </select>
                                </div>
                                
                                <div class="form-floating mb-4 ms-3">
                                    <button class="btn btn-secondary p-auto"type="submit" style="font-size: 28px;"><b>ADD</b></button>
                                </div>
                               </form>
                        </div>   
                    </div>
                    </div>
                    </div>
        <div id="vc">
            <%  
           int cTot=0;
           
            try{
           Class.forName("com.mysql.cj.jdbc.Driver");                
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
            Statement st5=con.createStatement();
            Statement st7=con.createStatement();
            ResultSet result5 =st5.executeQuery("select * from category");
            ResultSet result6=null;
            result6=st7.executeQuery("select count(*) from category");
            result6.next();
            cTot=result6.getInt(1);
                
          
           %>
            <table align="center" width="95%" class="mt-5 mb-5">
                <tr style="border:2px solid black;font-size: 20px;height: 50px; "><th colspan="6"><center>Categories Listed</center></th></tr>
                <tr style="border:2px solid black; margin-left: 30px;">
                    <th class="ps-3">C_Id</th><th>Category</th><th>Status</th><th class="ps-3">Creation_Date</th><th class="ps-3">Updation_Date</th>
                </tr>    
            
            <%while(result5.next()){%>
                
                <tr style="border:1px solid black;">
                    <td class="ps-4"><% out.println(result5.getString("cid"));%></td>
                    <td class="ps-0"><% out.println(result5.getString("cname"));%></td>
                    <td class="ps-4"><% out.println(result5.getString("cstatus"));%></td>
                    <td class="ps-4"><% out.println(result5.getString("creationdate"));%></td>
                    <td class="ps-4"><% out.println(result5.getString("updationdate"));%></td>
                    <td><a href="Catupd.jsp?cid=<% out.print(result5.getString("cid"));%>"><button class="btn btn-success p-0" data-bs-toggle="modal" data-bs-target="#staticBackdrop10" style="width:100px; height:35px;">Update</button></a>
                    <a href="delcategory?dcid=<% out.print(result5.getString("cid"));%>"><button class="btn btn-danger p-0" style="width:100px; height:35px;">Delete</button></a></td>
                   
                </tr>
                
           <% }%>
           
             <tr style="border:2px solid black;font-size: 20px;color: red; "><th colspan="6"><center>Total Categories : <% out.println(cTot);%></center></th></tr>
            </table>
             
            <%}catch(Exception e){
            
            }%>
        </div>
        
                    <script>
                        function cissbook(){
             event.preventDefault();
             document.getElementById("cb").style.display="none";
             document.getElementById("ccb").style.display="flex";
             document.getElementById("ac").style.display="grid";
             document.getElementById("vc").style.display="none";
         }
         function cIssbook(){
             event.preventDefault();
             document.getElementById("cb").style.display="flex";
             document.getElementById("ccb").style.display="none";
             document.getElementById("ac").style.display="none";
             document.getElementById("vc").style.display="grid";
         }
                    </script>
                </div>
                <div id="author" style="display: none;">
                    <div class="d-flex justify-content-center ms-2 me-2 b-radius border border-info rounded-top-3 mb-3" style="background-color:#24a1d4;color: white;">
                        <h1>Manage Authors</h1>
                    </div>
                   <div class="justify-content-between" id="xab" style="display:flex;">
                        <div>
                        <button type="button" class="btn btn-success ms-4" style="width:200px;" onclick="aissbook()">Add Author</button>
                        </div>
                        <div>
                        <button type="button" style="width:200px;" class="btn btn-danger me-4" data-bs-toggle="modal" data-bs-target="#staticBackdrop3"> Remove Author </button>   
                        </div>
                 </div> 
                    <div class="justify-content-between" id="xaab" style="display:none;">
                        <div>
                        <button type="button" class="btn btn-success ms-4" style="width:200px;" onclick="aIssbook()">View Authors</button>
                        </div>
                        <div>
                        <button type="button" style="width:200px;" class="btn btn-danger me-4" data-bs-toggle="modal" data-bs-target="#staticBackdrop3">Remove Author </button>   
                        </div>
                 </div>
                    
                 <div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" style="margin-left:170px;" id="staticBackdropLabel"><center><b>Remove Author</b></center></h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form class="p-4" action="delAuthor" method="post">
                                    <div class="row m-1">
                                        <div class="col-5">
                                            <label class="form-label" for="ID">AUTHOR ID :</label>
                                        </div>
                                        <div class="col-7">
                                         <input type="text" id="ID" required name="ID" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="row m-1">
                                        <div class="col-5">
                                            <label class="form-label" for="Name">AUTHOR NAME :</label>
                                        </div>
                                        <div class="col-7">
                                         <input type="text" id="Name" required name="NAME" class="form-control-sm">
                                        </div>
                                    </div>
                                    
                                    <div class="d-flex justify-content-center">
                                        <input type="submit" value="REMOVE" class="form-control-sm">
                                    </div>
                                              
                                </form>
                            </div>
                            
                    </div>
                    </div>
                    </div>
                    <div id="aa" style="display:none;">
                    <div class="m-4 ms-5 me-5 p-3 rounded-3" style="border:2px solid black;">
                    <div class="row justify-content-center">
                        
                        <div class="col-6">
                            <center><h2>ADD AUTHOR</h2></center>
                             <form action="addAuthor">
                                 
                                <div class="form-floating mb-4">
                                        <input class="form-control" required type="text"name="aname" id="fauth" placeholder="Author Name" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth">Author Name</label>
                                </div>
                                 <div class="mb-3">
                                        <select class="form-select" name="cstatus" aria-label="Default select example" style="height:69px; border: none;border-bottom: 2px solid black;background: transparent;font-size: 18px;">
                                            <option value="null">Select Status</option>    
                                            <option value="Active">Active</option>
                                            <option value="Inactive">Inactive</option>
                                        </select>
                                </div>
                                
                                <div class="form-floating mb-4 ms-3">
                                    <button class="btn btn-secondary p-auto"type="submit" style="font-size: 28px;"><b>ADD</b></button>
                                </div>
                               </form>
                        </div>   
                    </div>
                    </div>
                </div><!-- comment -->
                <div id="va">
                     <%  
           int aTot=0;
           
            try{
           Class.forName("com.mysql.cj.jdbc.Driver");                
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
            Statement st5=con.createStatement();
            Statement st7=con.createStatement();
            ResultSet result5 =st5.executeQuery("select * from Author");
            ResultSet result6=null;
            result6=st7.executeQuery("select count(*) from Author");
            result6.next();
            aTot=result6.getInt(1);
                
          
           %>
            <table align="center" width="95%" class="mt-5 mb-5">
                <tr style="border:2px solid black;font-size: 20px;height: 50px; "><th colspan="5"><center>Authors Listed</center></th></tr>
                <tr style="border:2px solid black; margin-left: 30px;">
                    <th class="ps-3">A_Id</th><th>Author</th><th class="ps-3">Creation_Date</th><th class="ps-3">Updation_Date</th>
                </tr>    
            
            <%while(result5.next()){%>
                
                <tr style="border:1px solid black;">
                    <td class="ps-4"><% out.println(result5.getString("aid"));%></td>
                    <td class="ps-0"><% out.println(result5.getString("aname"));%></td>
                    <td class="ps-4"><% out.println(result5.getString("creationdate"));%></td>
                    <td class="ps-4"><% out.println(result5.getString("updationdate"));%></td>
                    <td><a href="Authupd.jsp?aid=<% out.print(result5.getString("aid"));%>"><button class="btn btn-success p-0" style="width:100px; height:35px;">Update</button></a>
                    <a href="delAuthor?daid=<% out.print(result5.getString("aid"));%>"><button class="btn btn-danger p-0" style="width:100px; height:35px;">Delete</button></a></td>
                </tr>
                
           <% }%>
           
             <tr style="border:2px solid black;font-size: 20px;color: red; "><th colspan="5"><center>Total Authors : <% out.println(aTot);%></center></th></tr>
            </table>
             
            <%}catch(Exception e){
            
            }%>
                </div>
                <script>
                        function aissbook(){
             event.preventDefault();
             document.getElementById("xab").style.display="none";
             document.getElementById("xaab").style.display="flex";
             document.getElementById("aa").style.display="grid";
             document.getElementById("va").style.display="none";
         }
         function aIssbook(){
             event.preventDefault();
             document.getElementById("xab").style.display="flex";
             document.getElementById("xaab").style.display="none";
             document.getElementById("aa").style.display="none";
             document.getElementById("va").style.display="grid";
         }
                    </script>
                </div>
                <div id="changepass" style="display: none;">
                    <div class="d-flex justify-content-center ms-2 me-2 b-radius border border-info rounded-top-3 mb-3" style="background-color:#24a1d4;color: white; ">
                        <h1>MANAGE PASSWORD</h1>
                    </div>
                <div class="m-4 ms-5 me-5 p-3 rounded-3" style="border:2px solid black;">
                    <div class="row justify-content-center">
                        
                        <div class="col-6">
                            <center><h2>CHANGE PASSWORD</h2></center>
                             <form action="forgot" method="post">
                                <div class="form-floating mb-4">
                                        <input class="form-control" type="text" id="fcd"name="mobile" placeholder="Mobile" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fcd">Mobile</label>
                                </div>
                                 <div class="form-floating mb-4">
                                        <input class="form-control" type="email" id="fcd"name="email" placeholder="Email" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fcd">Email</label>
                                </div>
                                 <div class="form-floating mb-4">
                                        <input class="form-control" type="password" id="fauth"name="password" placeholder="New Password" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth">New Password</label>
                                </div>
                                 <div class="form-floating mb-4">
                                        <input class="form-control" type="password" id="fauth" placeholder="Confirm Password" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth">Confirm Password</label>
                                </div>
                                
                                <div class="form-floating mb-4 ms-3">
                                    <button class="btn btn-secondary p-auto"type="submit" style="font-size: 28px;"><b>CHANGE</b></button>
                                </div>
                               </form>
                        </div>   
                    </div>
                    </div>
                </div>
            <div id="adm" style="display:none;">
                <div class="d-flex justify-content-center ms-2 me-2 b-radius border border-info rounded-top-3 mb-3" style="background-color:#24a1d4;color: white; ">
                        <h1>ADD ADMIN</h1>
                    </div>
                <div class="m-4 ms-5 me-5 rounded-3 p-3" style="border:2px solid black;">
                    <div class="row justify-content-center">
                        
                        <div class="col-10">
                           
                             <form action="adm" method="post">
                                 <div class="row" id="dd1" style="display: flex;">
                                      <center><h2 class="m-3">Personal Details</h2></center>
                                     <div class="col-6">
                                         <div class="mb-4">
                                             <select class="form-select" name="category" aria-label="Default select example" style="height:69px; border: none;border-bottom: 2px solid black;background: transparent;font-size: 18px;">
                                                <option value="null">Select </option>
                                                <option value="Admin1">Admin1</option>
                                                <option value="Admin2">Admin2</option>
                                                <option value="Admin3">Admin3</option>
                                               
                                        </select>
                                         </div>
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="fname" id="fauth" placeholder="First Name" Style="height:69px; background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">First Name</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="lname" id="fauth" placeholder="Last Name" Style=" height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">Last Name</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="mobile" id="fcd" placeholder="Mobile Number" Style=" height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fcd">Mobile Number</label>
                                        </div>
                                        
                                     </div>
                                     <div class="col-6">
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="aname" id="fud" placeholder="Alternative Mobile" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud">Alternative Mobile</label>
                                        </div>
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="email"name="email" id="fud" placeholder="Email" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" >Email</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="aadhar" id="fud" placeholder="Aadhar Number" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" >Aadhar Number</label>
                                        </div>
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="file"name="photo" id="fud" placeholder="Profile Photo" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" style="margin-left:270px;">Profile Photo</label>
                                        </div>
                                       
                                        
                                     </div>
                                     <div class="mb-4 d-flex justify-content-center ">
                                            <button class="btn btn-secondary p-auto"  style="font-size: 28px;width:100px;"onclick='Display()'><b><i class="fa-solid fa-arrow-right"></i></b></button>
                                       </div>
                                 </div>
                                 
                                 
                                 
                                 <div class="row" id='dd2' style='display: none;'>
                                     <center><h2 class="m-3">Address Details</h2></center>
                                     <div class="col-6">
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="dno" id="fauth" placeholder="D.No" Style="height:69px; background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">D.No</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="village" id="fauth" placeholder="Village" Style=" height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">Village</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="mandal" id="fcd" placeholder="Mandal" Style=" height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fcd">Mandal</label>
                                        </div>
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="district" id="fcd" placeholder="District" Style=" height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fcd">District</label>
                                        </div>
                                        
                                     </div>
                                     
                                     <div class='col-6'> 
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="state" id="fud" placeholder="State" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" >State</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="country" id="fud" placeholder="Counry" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" >Country</label>
                                        </div>
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="number"name="pincode" id="fud" placeholder="Pincode" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud">Pincode</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="file" id="fud"name="proof" placeholder="Proof" Style="height:69px;background: transparent;margin-left: 10px; border: none; border-bottom: 2px solid black;">
                                            <label for="fud" style="margin-left:320px; margin-top: 13px;">Proof</label>
                                        </div>
                                 </div>
                                     <div class="mb-4 d-flex justify-content-around ">
                                            <button class="btn btn-secondary" onclick="Previous()" style="font-size: 28px;width: 100px;"><b><i class="fa-solid fa-arrow-left"></i></b></button>
                                            <button class="btn btn-secondary" type="submit" style="font-size: 28px;width:200px;"><b>SUBMIT</b></button>
                                    </div>
                               </form>
                        </div>   
                    </div>
                    </div>
        </div>
            </div>
                
            </div>
        </div>
                    
                     
                   
        <script>
           
                function Display(){
                event.preventDefault();
                var dd1=document.getElementById("dd1");
                var dd2=document.getElementById("dd2");
                dd2.style.display="flex";
                dd1.style.display="none";
            }
            function display(){
                event.preventDefault();
                var d1=document.getElementById("d1");
                var d2=document.getElementById("d2");
                d2.style.display="flex";
                d1.style.display="none";
            }
            function previous(){
                event.preventDefault();
                var d1=document.getElementById("d1");
                var d2=document.getElementById("d2");
                d2.style.display="none";
                d1.style.display="flex";
            }
            
            function Previous(){
                event.preventDefault();
                var dd1=document.getElementById("dd1");
                var dd2=document.getElementById("dd2");
                dd2.style.display="none";
                dd1.style.display="flex";
            }
           
            var das=document.getElementById("das");
            var issue=document.getElementById("issue");
            var student=document.getElementById("student");
            var New=document.getElementById("new");
            var categ=document.getElementById("categ");
            var auth=document.getElementById("auth");
            var changepass=document.getElementById("changepass");
            var Fine=document.getElementById("Fine");
            var Adm=document.getElementById("Adm");

            var dash=document.getElementById("dash");
            var book=document.getElementById("book");
            var Iss=document.getElementById("Iss");
            var Stud=document.getElementById("Stud");
            var category=document.getElementById("category");
            var author=document.getElementById("author");
            var pass=document.getElementById("pass");
            var fine=document.getElementById("fine");
            var adm=document.getElementById("adm");
            dash.addEventListener('click',e=>{
                das.style.display="grid";
                issue.style.display="none";
                student.style.display="none";
                New.style.display="none";
                category.style.display="none";
                author.style.display="none";
                changepass.style.display="none";
                fine.style.display="none";
                adm.style.display="none";
            });
            book.addEventListener('click',e=>{
                das.style.display="none";
                issue.style.display="none";
                student.style.display="none";
                New.style.display="grid";
                category.style.display="none";
                author.style.display="none";
                changepass.style.display="none";
                fine.style.display="none";
                adm.style.display="none";
            });
            Iss.addEventListener('click',e=>{
                das.style.display="none";
                issue.style.display="grid";
                student.style.display="none";
                New.style.display="none";
                category.style.display="none";
                author.style.display="none";
                changepass.style.display="none";
                fine.style.display="none";
                adm.style.display="none";
            });
            Stud.addEventListener('click',e=>{
                das.style.display="none";
                issue.style.display="none";
                student.style.display="grid";
                New.style.display="none";
                category.style.display="none";
                author.style.display="none";
                changepass.style.display="none";
                fine.style.display="none";
                adm.style.display="none";
            });
            categ.addEventListener('click',e=>{
                das.style.display="none";
                issue.style.display="none";
                student.style.display="none";
                New.style.display="none";
                category.style.display="grid";
                author.style.display="none";
                changepass.style.display="none";
                fine.style.display="none";
                adm.style.display="none";
            });
            auth.addEventListener('click',e=>{
                das.style.display="none";
                issue.style.display="none";
                student.style.display="none";
                New.style.display="none";
                category.style.display="none";
                author.style.display="grid";
                changepass.style.display="none";
                fine.style.display="none";
                adm.style.display="none";
            });
            pass.addEventListener('click',e=>{
                das.style.display="none";
                issue.style.display="none";
                student.style.display="none";
                New.style.display="none";
                category.style.display="none";
                author.style.display="none";
                changepass.style.display="grid";
                fine.style.display="none";
                adm.style.display="none";
            });
            Fine.addEventListener('click',e=>{
                das.style.display="none";
                issue.style.display="none";
                student.style.display="none";
                New.style.display="none";
                category.style.display="none";
                author.style.display="none";
                changepass.style.display="none";
                fine.style.display="grid";
                adm.style.display="none";
            });
            Adm.addEventListener('click',e=>{
                das.style.display="none";
                issue.style.display="none";
                student.style.display="none";
                New.style.display="none";
                category.style.display="none";
                author.style.display="none";
                changepass.style.display="none";
                fine.style.display="none";
                adm.style.display="grid";
            });
            
        </script>
    </body>
</html>
