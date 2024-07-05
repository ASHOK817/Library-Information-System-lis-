<%-- 
    Document   : Admpage
    Created on : 17-Dec-2023, 2:56:13 pm
    Author     : maruthi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
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
            button{
                width: 93%;
                height: 50px;
                padding: 10pxpx;
                margin: 10px;
                font-size: 17px;
                border-radius: 5px;
                background-color: rgb(9, 138, 138);
                border: solid white 1px;
                box-shadow: inset 0 0 0px,0 0 20px rgb(46, 102, 109);
            }
            button:hover{
                font-size: 18px;
                color: aliceblue;
            }
            table{
                height: 70vh;
                border: none;
                padding: 10px;
                width: 60%;
                
                
            }
            table td{
                padding: 5px;
                size: 20px;
                
            }
            input{
            
            }
            .side button{

            }
        </style>
    </head>
    <body>
        
        <%
            Connection con=null;
            Statement st=null;
            Statement st2=null;
            ResultSet res1=null;
            ResultSet res2=null;
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");                
                con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
                st=con.createStatement();
            }catch(Exception e){
            }
        %>

        <div style="display: flex; ">
            <div style="width: 25%; background-color: rgb(71, 167, 159);border-top-right-radius: 10px;" class="side">
                <h2 style="padding-left: 50px;font-size: 35px;color:rgb(19, 49, 54)">Admin Role</h2>
                <button id="dash"><i class="fa-solid fa-table-cells-large"></i> Dash-Board</button>
                <button id="book"><i class="fa-solid fa-book"></i> Books</button>
                <button id="Iss"><i class="fa-solid fa-book"></i> Issue Book</button>
                <button id="categ"><i class="fa-solid fa-list"></i> Categories</button>
                <button id="auth"><i class="fa-solid fa-address-book"></i> Authors</button>
                <button id="Stud"><i class="fa-solid fa-user"></i> Register Student</button>
                <button><i class="fa-solid fa-key"></i> Change Password</button>
                <button><i class="fa-solid fa-right-from-bracket"></i> Logout</button>
            </div>
            <div style="background-color: rgb(171, 224, 222); width: 100%;border-top-left-radius: 10px;">
                <div></div>
                <center><h1>ONLINE LIBRARY MANAGEMENT SYSTEM</h1></center>
                <hr style="height: 5px;background-color:rgb(71, 167, 159);">
                <div id="das">
                <div class="d-flex justify-content-center ms-3 me-3 rounded-top-3 mb-3" style="background-color:rgb(9, 138, 138);color: white;box-shadow: inset 0 0 0px,0 0 20px #36cf82">
                        <h1>Dash-Board</h1>
                </div>
                <div style="border: solid black 1px; padding: 20px; margin: 15px ;margin-bottom: 60px; border-radius: 10px;">                    
                    <h2 style="margin: 25px;">Welcome Adminstrator.....!</h2>
                    <div style="display: flex;justify-content: space-around;">
                        <div style="height: 70px; width: 300px; background-color: darkgray;display: flex; border-radius: 5px;box-shadow: inset 0 0 0px,0 0 20px rgb(18, 161, 138);"><div style="padding: 5px;"><img src="images/c15.png" width="60px" height="60px" style="border-radius: 5px;"></div><div style="text-align: center;margin-top: 15px;margin-left: 20px; ">Book Listed <br>
                                <%HttpSession Session=request.getSession();
                                String user=(String)Session.getAttribute("name"); 
                                out.println(user);
                               // String rc=""+3;
                                //out.println(rc);
                                session.setAttribute("rc", "3");
                                %></div></div>
                        <div style="height: 70px; width: 300px; background-color: darkgray;display: flex; border-radius: 5px;box-shadow: inset 0 0 0px,0 0 20px rgb(46, 150, 145);"><div style="padding: 5px;"><img src="images/c15.png" width="60px" height="60px" style="border-radius: 5px;"></div><div style="text-align: center;margin-top: 15px;margin-left: 20px; ">Book issued <br> 4</div></div>
                        <div style="height: 70px; width: 300px; background-color: darkgray;display: flex; border-radius: 5px;box-shadow: inset 0 0 0px,0 0 20px rgb(48, 167, 151);"><div style="padding: 5px;"><img src="images/c15.png" width="60px" height="60px" style="border-radius: 5px;"></div><div style="text-align: center;margin-top: 15px;margin-left: 20px; ">Book Returned <br> 3</div></div>
                    </div>
                    <div style="display: flex;justify-content: space-around; margin-top: 40px;">
                        <div style="height: 70px; width: 300px; background-color: darkgray;display: flex; border-radius: 5px;box-shadow: inset 0 0 0px,0 0 20px rgb(46, 150, 145);"><div style="padding: 5px;"><img src="images/c15.png" width="60px" height="60px" style="border-radius: 5px;"></div><div style="text-align: center;margin-top: 15px;margin-left: 20px; ">Registered Users <br> 4</div></div>
                        <div style="height: 70px; width: 300px; background-color: darkgray;display: flex; border-radius: 5px;box-shadow: inset 0 0 0px,0 0 20px rgb(46, 150, 145);"><div style="padding: 5px;"><img src="images/c15.png" width="60px" height="60px" style="border-radius: 5px;"></div><div style="text-align: center;margin-top: 15px;margin-left: 20px; ">Authors Listed <br> 3</div></div>
                        <div style="height: 70px; width: 300px; background-color: darkgray;display: flex; border-radius: 5px;box-shadow: inset 0 0 0px,0 0 20px rgb(46, 150, 145);"><div style="padding: 5px;"><img src="images/c15.png" width="60px" height="60px" style="border-radius: 5px;"></div><div style="text-align: center;margin-top: 15px;margin-left: 20px; ">Listed Categories<br> 3</div></div>
                    </div>
                </div>
            </div>
                <div id="new" style="display: none;">
                    <div class="d-flex justify-content-center ms-2 me-2 b-radius border border-info rounded-top-3 mb-3" style="background-color:rgb(9, 138, 138);color: white;box-shadow: inset 0 0 0px,0 0 20px #36cf82 ">
                        <h1>Manage Books</h1>
                    </div>
                    <div class="d-flex justify-content-between">
                        <div>
                        <a href="viewBook"> <button type="button" class="btn btn-success" style="width:250px;">View All Books</button></a>
                        </div>
                        <div>
                        <button type="button" style="width:250px;" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop"> Delete Book Record</button>   
                        </div>
                    </div>    
                        
                    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Delete Book</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form class="p-4" action="Deletebook" method="post">
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="form-label" for="ID">BOOK ID :</label>
                                        </div>
                                        <div class="col-8">
                                         <input type="text" id="ID"name="ID" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="form-label" for="Name">BOOK NAME :</label>
                                        </div>
                                        <div class="col-8">
                                         <input type="text" id="Name" name="Name" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <input type="submit"value="DELETE" class="form-control-sm">
                                    </div>
                                              
                                </form>
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            
                        </div>
                    </div>
                    </div>
                    </div>
                    <!--<center><h2>ADD NEW BOOK</h2></center>
                <form action="book" method="post">
                    <center><table>
                        <tr><td>Book Name :</td><td><input type="text" name="name"></td></tr>
                        <tr><td>BookID :</td><td><input type="text" name="bookid"></td></tr>
                        <tr><td>Author :</td><td><input type="text" name="author"></td></tr>
                        <tr><td>Publications :</td><td><input type="text" name="publications"></td></tr>
                        <tr><td>category :</td><td>
                                <select name="categor" style="width: 43%;height: 30px; background-color: rgb(130, 212, 212);">
                                    <option value="inter">Intermediate</option>
                                    <option value="Btech">Btech</option>
                                    <option value="SSC">SSC</option>
                                    <option value="Psychology">Pshycology</option>
                                    <option value="Stories">Stories</option>
                                </select></td></tr>
                        <tr><td>Price :</td><td><input type="text" name="price"></td></tr>
                        <tr><td>Quantity :</td><td><input type="text" name="quantity" ></td></tr>
                        <tr><td>Book Photo :</td><td><input type="file"></td></tr>
                        <tr><td colspan="2"><input type="submit" style="margin-left: 15%;width: 150px; height:30px;"></td></tr>  
                    </table></center>
                </form>-->
                    <div class="m-4 ms-5 me-5 rounded-3 p-3" style="border:2px solid black;">
                    <div class="row justify-content-center">
                        
                        <div class="col-10">
                            <center><h2 class="m-3">ADD NEW BOOK</h2></center>
                             <form action="book" method="post">
                                 <div class="row">
                                     <div class="col-6">
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="name" id="fauth" placeholder="Book Name" Style="height:69px; background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">Book Name</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="bookid" id="fauth" placeholder="Book Id" Style=" height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">Book Id</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="author" id="fcd" placeholder="Author" Style=" height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fcd">Author</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="publications" id="fud" placeholder="Publications" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud">Publications</label>
                                        </div>
                                     </div>
                                     <div class="col-6">
                                         <div class="mb-4">
                                             <select class="form-select" name="categor" aria-label="Default select example" style="height:69px; border: none;border-bottom: 2px solid black;background: transparent;font-size: 18px;">
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
                                            <input class="form-control" type="number"name="price" id="fud" placeholder="Price" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" style="margin-left:275px;">Price</label>
                                        </div>
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="number"name="quantity" id="fud" placeholder="Quantity" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" style="margin-left:265px;">Quantity</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="file" id="fud" placeholder="Book Photo" Style="height:69px;background: transparent;margin-left: 10px; border: none; border-bottom: 2px solid black;">
                                            <label for="fud" style="margin-left:265px; margin-top: 13px;">Book Photo</label>
                                        </div>
                                        
                                     </div>
                                 </div>
                                <div class="form-floating mb-4 ms-3">
                                    <button class="btn btn-secondary p-auto" type="submit" style="font-size: 28px;"><b>ADD</b></button>
                                </div>
                               </form>
                        </div> 
                        
                        
                    </div>
                    </div>
                    <div class="m-4 ms-5 me-5 rounded-3 p-5" style="border:2px solid black;">
                    <div class="row ">
                        
                        <div class="col-12">
                            <table style="width:100%;">
                                <tr style="border: 2px solid black">
                                    <th>Name</th><!-- comment -->
                                    <th>BookId</th>
                                    <th>Author</th>
                                    <th>Publications</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                </tr>
                            <%
                                try{
                                    res1=st.executeQuery("select * from books");                                   
                            %>
                                <%while(res1.next()){%>
                                    <tr style="border: 1px solid black">
                                        <td><% out.println(res1.getString("name"));%></td><!-- comment -->
                                        <td><% out.println(res1.getString("bookid"));%></td><!-- comment -->
                                        <td><% out.println(res1.getString("author"));%></td>
                                        <td><% out.println(res1.getString("publications"));%></td>
                                        <td><% out.println(res1.getString("category"));%></td>
                                        <td><% out.println(res1.getString("price"));%></td>
                                        <td><% out.println(res1.getString("quantity"));%></td>
                                    </tr>    
                                <%}
                                 }catch(Exception e){
                                    
                                 }
                                
                                %>
                            </table>
                        </div>  
                    </div>
                    </div>
                </div>
                <div id="issue" style="display: none;">
                   <div class="d-flex justify-content-center ms-2 me-2 b-radius border border-info rounded-top-3 mb-3" style="background-color:rgb(9, 138, 138);color: white;box-shadow: inset 0 0 0px,0 0 20px #36cf82; ">
                        <h1>Issue and Return Books</h1>
                    </div> 
                 <div class="d-flex justify-content-between">
                        <div>
                        <a href="issuedbooks"> <button type="button" class="btn btn-success" style="width:270px;">View All Issued Books</button></a>
                        </div>
                        <div>
                        <button type="button" style="width:270px;" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop2"> Return Book </button>   
                        </div>
                 </div> 
                 <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Return Book</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form class="p-4" action="delissue" method="post">
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="form-label" for="ID">BOOK ID :</label>
                                        </div>
                                        <div class="col-8">
                                         <input type="text" id="ID"name="ID" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="form-label" for="Name">BOOK NAME :</label>
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
                            <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            
                        </div>
                    </div>
                    </div>
                    </div>
               <!-- <center><h2>ISSUE BOOK</h2></center>
                <form action="issuebook" method="post">
                    <center><table>
                        <tr><td>Book ID :</td><td><input type="text" name="bookid"></td></tr>
                        <tr><td>BOOK Name:</td><td><input type="text" name="name"></td></tr>
                        <tr><td>Author :</td><td><input type="text" name="author"></td></tr>
                        <tr><td>category :</td><td>
                                <select name="category" style="width: 53%;height: 20px; background-color: rgb(130, 212, 212);">
                                    <option value="inter">Intermediate</option>
                                    <option value="Btech">Btech</option>
                                    <option value="SSC">SSC</option>
                                    <option value="Pshycology">Pshycology</option>
                                    <option value="Stories">Stories</option></select></td></tr>
                        <tr><td>Student ID :</td><td><input type="number" name="sid"></td></tr>
                        <tr><td>Issue Date :</td><td><input type="date" name="idate" ></td></tr>
                        <tr><td>Number Of Days :</td><td><input type="number" name="days"></td></tr>
                        <tr><td>Return Date :</td><td><input type="date" name="rdate"></td></tr>
                        <tr><td colspan="2"><input type="submit" value="ISSUE BOOK" style="margin-left: 15%;width: 150px; height:30px;"></td></tr>  
                    </table></center>
                </form>-->
                <div class="m-4 ms-5 me-5 rounded-3 p-3" style="border:2px solid black;">
                    <div class="row justify-content-center">
                        
                        <div class="col-10">
                            <center><h2 class="m-3">ISSUE BOOK</h2></center>
                            
                             <form action="issuebook" method="post">
                                 <div class="row">
                                     <div class="col-6">
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="bookid" id="fauth" placeholder="Book Id" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">Book Id</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="name" id="fauth" placeholder="Book Name" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">Book Name</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="author" id="fcd" placeholder="Author Name" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fcd">Author Name</label>
                                        </div>
                                        <div class="mb-4">
                                             <select class="form-select" name="category" aria-label="Default select example" style="height:69px; border: none;border-bottom: 2px solid black;background: transparent;font-size: 18px;">
                                                <option value="null">Select Category</option>
                                                <option value="Inter">Inter</option>
                                                <option value="SSC">SSC</option>
                                                <option value="Btech">Btech</option>
                                                <option value="Phd">Phd</option>
                                                <option value="Stories">Stories</option>
                                                <option value="MBBS">MBBS</option>
                                        </select>
                                         </div>
                                     </div>
                                     <div class="col-6">
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="sid" id="fud" placeholder="Student Id" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud">Student Id</label>
                                         </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="date"name="idate" id="fud" placeholder="Issue Date" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" style="margin-left:250px; margin-top:13px;">Issue Date</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="days" id="fud" placeholder="Duration" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud">Duration</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="date"name="rdate" id="fud" placeholder="Return Date" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" style="margin-left:245px; margin-top:13px;">Return Date</label>
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
                <div id="student" style="display: none;">
                    <div class="d-flex justify-content-center ms-2 me-2 b-radius border border-info rounded-top-3 mb-3" style="background-color:rgb(9, 138, 138);color: white;box-shadow: inset 0 0 0px,0 0 20px #36cf82 ">
                        <h1>Manage Students</h1>
                    </div>
                    <div class="d-flex justify-content-between">
                        <div>
                        <a href="issuedbooks"> <button type="button" class="btn btn-success" style="width:270px;">View Registred Students</button></a>
                        </div>
                        <div>
                        <button type="button" style="width:270px;" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop4"> Remove Student </button>   
                        </div>
                 </div> 
                 <div class="modal fade" id="staticBackdrop4" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Remove Book From Issued Books</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form class="p-4" action="delissue" method="post">
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="form-label" for="ID">BOOK ID :</label>
                                        </div>
                                        <div class="col-8">
                                         <input type="text" id="ID"name="ID" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="form-label" for="Name">BOOK NAME :</label>
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
                            <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            
                        </div>
                    </div>
                    </div>
                    </div>
                
                <div class="m-4 ms-5 me-5 p-3 rounded-3" style="border:2px solid black;">
                    <div class="row justify-content-center">
                        
                        <div class="col-6">
                            <center><h2>ADD STUDENT</h2></center>
                             <form>
                                <div class="form-floating mb-4">
                                        <input class="form-control" type="text" id="fauth" placeholder="Student Name" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth">Student Name</label>
                                </div>
                                 <div class="form-floating mb-4">
                                        <input class="form-control" type="text" id="fauth" placeholder="Password" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth">Password</label>
                                </div>
                                <div class="form-floating mb-4">
                                        <input class="form-control" type="text" id="fcd" placeholder="Email" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fcd">Email</label>
                                </div>
                                <div class="form-floating mb-4 ms-3">
                                    <button class="btn btn-secondary p-auto" style="font-size: 28px;"><b>ADD</b></button>
                                </div>
                               </form>
                        </div>   
                    </div>
                    </div>
                </div>
                
                
                <div id="category" style="display: none;">
                    <div class="d-flex justify-content-center ms-2 me-2 b-radius border border-info rounded-top-3 mb-3" style="background-color:rgb(9, 138, 138);color: white;box-shadow: inset 0 0 0px,0 0 20px #36cf82; ">
                        <h1>Manage Categories</h1>
                    </div>
                    <div class="d-flex justify-content-between">
                        <div>
                        <a href="viewCategory"> <button type="button" class="btn btn-success" style="width:270px;">View All Categories</button></a>
                        </div>
                        <div>
                        <button type="button" style="width:270px;" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop5"> Remove Category </button>   
                        </div>
                 </div> 
                 <div class="modal fade" id="staticBackdrop5" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Remove Book From Issued Books</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form class="p-4" action="delcategory" method="post">
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="form-label" for="ID">CATEGORY ID :</label>
                                        </div>
                                        <div class="col-8">
                                         <input type="text" id="ID" name="ID" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="form-label" for="Name">CATEGORY NAME :</label>
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
                            <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            
                        </div>
                    </div>
                    </div>
                    </div>
                    
                    <div class="m-4 ms-5 me-5 p-3 rounded-3" style="border:2px solid black;">
                    <div class="row justify-content-center">
                        
                        <div class="col-6">
                            <center><h2>ADD CATEGORY</h2></center>
                             <form action="addCategory" method="post">
                                <div class="form-floating mb-4">
                                        <input class="form-control"name="category" type="text" id="fauth" placeholder="Category" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth">Category</label>
                                </div>
                                 <div class="form-floating mb-4">
                                        <input class="form-control" type="text"name="cid" id="fauth" placeholder="CID" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth">CID</label>
                                </div>
                                 <div class="mb-3">
                                        <select class="form-select" name="cstatus" aria-label="Default select example" style="height:69px; border: none;border-bottom: 2px solid black;background: transparent;font-size: 18px;">
                                                <option value="Active">Active</option>
                                                <option value="Inactive">Inactive</option>
                                        </select>
                                </div>
                                <div class="form-floating mb-4">
                                        <input class="form-control" type="date" id="fcd"name="creationdate" placeholder="Creation Date" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fcd">Creation Date</label>
                                </div>
                                <div class="form-floating mb-4">
                                        <input class="form-control" type="date" id="fud"name="updationdate" placeholder="Updation Date" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fud">Updation Date</label>
                                </div>
                                <div class="form-floating mb-4 ms-3">
                                    <button class="btn btn-secondary p-auto"type="submit" style="font-size: 28px;"><b>ADD</b></button>
                                </div>
                               </form>
                        </div>   
                    </div>
                    </div>
                </div>
                <div id="author" style="display: none;">
                    <div class="d-flex justify-content-center ms-2 me-2 b-radius border border-info rounded-top-3 mb-3" style="background-color:rgb(9, 138, 138);color: white; box-shadow: inset 0 0 0px,0 0 20px #36cf82;">
                        <h1>Manage Authors</h1>
                    </div>
                    <div class="d-flex justify-content-between">
                        <div>
                        <a href="viewAuthor"> <button type="button" class="btn btn-success" style="width:270px;">View All Authors</button></a>
                        </div>
                        <div>
                        <button type="button" style="width:270px;" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop3"> Remove Author </button>   
                        </div>
                 </div> 
                 <div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Remove Book From Issued Books</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form class="p-4" action="delAuthor" method="post">
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="form-label" for="ID">BOOK ID :</label>
                                        </div>
                                        <div class="col-8">
                                         <input type="text" id="ID"name="ID" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="form-label" for="Name">BOOK NAME :</label>
                                        </div>
                                        <div class="col-8">
                                         <input type="text" id="Name" name="NAME" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <input type="submit" value="REMOVE" class="form-control-sm">
                                    </div>
                                              
                                </form>
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            
                        </div>
                    </div>
                    </div>
                    </div>
                    
                    <div class="m-4 ms-5 me-5 p-3 rounded-3" style="border:2px solid black;">
                    <div class="row justify-content-center">
                        
                        <div class="col-6">
                            <center><h2>ADD AUTHOR</h2></center>
                             <form action="addAuthor">
                                 <div class="form-floating mb-4">
                                        <input class="form-control" type="text"name="aid" id="fcd" placeholder="Author Id" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fcd">Author Id</label>
                                </div>
                                <div class="form-floating mb-4">
                                        <input class="form-control" type="text"name="aname" id="fauth" placeholder="Author Name" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth">Author Name</label>
                                </div>
                                <div class="form-floating mb-4">
                                        <input class="form-control" type="date"name="acdate" id="fcd" placeholder="Creation Date" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fcd">Creation Date</label>
                                </div>
                                <div class="form-floating mb-4">
                                        <input class="form-control" type="date"name="audate" id="fud" placeholder="Updation Date" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fud">Updation Date</label>
                                </div>
                                <div class="form-floating mb-4 ms-3">
                                    <button class="btn btn-secondary p-auto"type="submit" style="font-size: 28px;"><b>ADD</b></button>
                                </div>
                               </form>
                        </div>   
                    </div>
                    </div>
                    
                </div>
            </div>
        </div>
        <script>
           
            var das=document.getElementById("das");
            var issue=document.getElementById("issue");
            var student=document.getElementById("student");
            var New=document.getElementById("new");
            var categ=document.getElementById("categ");
            var auth=document.getElementById("auth");

            var dash=document.getElementById("dash");
            var book=document.getElementById("book");
            var Iss=document.getElementById("Iss");
            var Stud=document.getElementById("Stud");
            var category=document.getElementById("category");
            var author=document.getElementById("author");
            dash.addEventListener('click',e=>{
                das.style.display="grid";
                issue.style.display="none";
                student.style.display="none";
                New.style.display="none";
                category.style.display="none";
                author.style.display="none";
            });
            book.addEventListener('click',e=>{
                das.style.display="none";
                issue.style.display="none";
                student.style.display="none";
                New.style.display="grid";
                category.style.display="none";
                author.style.display="none";
            });
            Iss.addEventListener('click',e=>{
                das.style.display="none";
                issue.style.display="grid";
                student.style.display="none";
                New.style.display="none";
                category.style.display="none";
                author.style.display="none";
            });
            Stud.addEventListener('click',e=>{
                das.style.display="none";
                issue.style.display="none";
                student.style.display="grid";
                New.style.display="none";
                category.style.display="none";
                author.style.display="none";
            });
            categ.addEventListener('click',e=>{
                das.style.display="none";
                issue.style.display="none";
                student.style.display="none";
                New.style.display="none";
                category.style.display="grid";
                author.style.display="none";
            });
            auth.addEventListener('click',e=>{
                das.style.display="none";
                issue.style.display="none";
                student.style.display="none";
                New.style.display="none";
                category.style.display="none";
                author.style.display="grid";
            });
            
        </script>
    </body>
</html>
