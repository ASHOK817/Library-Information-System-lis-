<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Edit User Details</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
           <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <style>
        body {
            background-color: #dfe9f0;
            font-family: 'Arial', sans-serif;
        }

        form {max-width: 400px;
            max-width: 800px;
            margin: 50px auto;
            border: 2px solid #115d8a ;
            background-color: #afd0e3;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 7px #063d63;
        }

    </style>
    </head>
    <body>
        <%
        String rrid=request.getParameter("rrid");
       // out.println("bid");
        %>
        <form action="Reg_Upd" method="post">
             <center><h1 style="color:#063d63; "><b>EDIT USER DETAILS</b></h1></center>
             <div style="color:red;"><center><p>Enter the data in fields which you want to modify ...!</p><center></div>   
             <div class="row">
                 <div class="col-6">
                     <div class="form-floating mb-4">
                                        <input class="form-control" type="text" id="fauth"name="fname" placeholder="First Name" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth">First Name</label>
                                </div>
                                <div class="form-floating mb-4">
                                        <input class="form-control" type="text" id="fauth"name="lname" placeholder="Last Name" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth">Last Name</label>
                                </div>
                                <div class='mb-4'>
                                
                                </div>            
                 </div>
                 <div class="col-6">
                     <div class="form-floating mb-4">
                                        <input class="form-control" type="text" id="fauth" name="district" placeholder="District" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth">District</label>
                     </div>
                      <div class="form-floating mb-4">
                                        <input class="form-control" type="file"  id="fauth" name='photo' placeholder="Photo" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth" style="margin-left: 280px;">Photo</label>
                      </div>
                      
                 </div>
                 <div class="form-floating">
                          <center><button type="submit" class="btn text-light" style="font-size: 28px; width: 50%; background-color: #28a106"><b>UPDATE</b></button></center>
                 </div>
             </div>
                
                  <div class="form-floating mb-4" style="display:none;">
                                        <input class="form-control" type="text" id="fauth" value='<% out.println(rrid); %>' name="rrid" placeholder="Publications" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth">id</label>
                     </div>              
                               
                                
                                
                                
                                
                  </form>
    
    </body>
</html>
