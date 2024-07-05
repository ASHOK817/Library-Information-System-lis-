<%-- 
    Document   : Catupd
    Created on : 08-Jan-2024, 7:33:09 pm
    Author     : maruthi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>SignUp</title>
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

        form {
            max-width: 400px;
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
        String cid=request.getParameter("cid");
        //out.println(cid);
        %>
         <form action="Cat_Upd" method="post">
             <center><h1 style="color:#063d63; "><b>CATEGORY</b></h1></center>
             <div style="color:red;"><center><p>Enter data in fields which you want to modify ...!</p><center></div>   
                                <div class="form-floating mb-4 mt-4">
                                        <input class="form-control" type="text" id="fauth" name="category" placeholder="Category Name" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth"> Category Name</label>
                                </div>
                                <div class="form-floating mb-4 mt-4" style='display:none;'>
                                        <input class="form-control" type="text" id="fauth" name="cid" value='<%out.println(cid);%>' placeholder="Category Name" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth"> Category Name</label>
                                </div>
                                <div class="form-floating mb-4">
                                        <select class="form-select" name="cstatus" id="ID" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                                <option value="null">Select Status</option>
                                                <option value="Active">Active</option>
                                                <option value="Inactive">Inactive</option>
                                        </select>
                                </div>
                                
                                <div class="form-floating">
                                    <center><button class="btn text-light"type="submit" style="font-size: 28px; width: 90%; background-color: #28a106"><b>UPDATE</b></button></center>
                                </div>
             
                  </form>
    
    </body>
</html>

