<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        
        <meta name="description" content="company is a free job board template">
        <meta name="author" content="">
        
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/fontello.css">
        <link rel="stylesheet" href="css/animate.css">        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.css">
        <link rel="stylesheet" href="css/owl.transitions.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="responsive.css">
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
    </head>
    <body>

        <div id="preloader">
            <div id="status"><h1></h1></div>
        </div>
        <!-- Body content -->
		
        <div class="header-connect">
            <div class="container">
                <div class="row">
                    <div class="col-md-5 col-sm-8 col-xs-8">
                        <div class="header-half header-call">
                            
                        </div>
                    </div>
                   

        <nav class="navbar navbar-default">
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
        <!--   <a class="navbar-brand" href="#"><img src="img/final.jpeg" width="150" height="90" alt=""></a> -->
            </div>
         

            <!-- Collect the nav links, forms, and other content for toggling -->
           
            <h2 align="center">Dynamic Key Generation Over Encrypted Data</h2>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              
                <center>
                <div class="button navbar-right">
                  <a href="index.html"><button class="navbar-btn nav-button wow bounceInRight login" data-wow-delay="0.8s">Home</button></a>
                  <a href="Uploadfile.jsp"><button class="navbar-btn nav-button wow fadeInRight" data-wow-delay="0.6s">Upload File</button></a>
                  
                   <a href="viewrequest.jsp"><button class="navbar-btn nav-button wow bounceInRight login" data-wow-delay="0.8s">View Request</button></a>
                   
                   <!-- <a href="AssignkeytoUser.jsp"><button class="navbar-btn nav-button wow bounceInRight login" data-wow-delay="0.8s">Assign key to User</button></a> -->
                  <a href="dataowner.jsp"><button class="navbar-btn nav-button wow fadeInRight" data-wow-delay="0.6s">Sign Out</button></a>
                  
                     
              </div>
                    </center>
                    
                <!--
                
              <ul class="main-nav nav navbar-nav navbar-right">
                <li class="wow fadeInDown" data-wow-delay="0s"><a class="active" href="index.html">Home</a></li>
                <li class="wow fadeInDown" data-wow-delay="0.2s"><a href="alumni.jsp">Admin</a></li>
                <li class="wow fadeInDown" data-wow-delay="0.5s"><a href="contact.html">User Login</a></li>
              </ul>
                -->
                
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>

     
        </div>

        <div class="content-area">
            <hr>

            
            <div class="row how-it-work text-center">
                     
            <hr>

            	
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/wow.js"></script>
        <script src="js/main.js"></script>
                    </div>
            </div>
        </div>
            <center>
                
                <br/>
                
                
                <% 
                
               String message= request.getParameter("message");
                if(message!=null)
                {
                    
                    %>
                    
                    <h2><%=message%></h2>
                    
                    <%
                }
                
                
                %>
                
                
                <br/><br/>
                
                
                
                
                
                
                <h2 style="color: blue">All Users File Requests</h2>
                 <br><br>     
                <table border="2">
                    <tr>
                        <th>File Id</th>
                        <th>File Name</th>
                        <th>User Id</th>
                        <th>User Name</th>
                      
                        <th>Request Time</th>
                        <th>Status</th>
                    </tr>
               
                <% 
                Connection con1=DbConnector.getConnection();
               //String query="select f.fileid,r2.filename,r1.userid,r1.username,r2.datetime from uploadfile f,register r1,request r2 where f.filename=r2.filename and r1.username='"+username1+"' and r2.username='"+username1+"' and r2.gkey=0 ";
               //String query="select f.fileid,r2.filename,r1.userid,r2.username,r2.datetime from uploadfile f,register r1,request r2 where r2.username='"+username1+"' and r1.username='"+username1+"' and r2.gkey=0 and f.filename=r2.filename;";
               String query="select up.fileid,up.filename,reg.userid,reg.username,reg.requestcount,req.requesttime,req.id,req.accept from uploadfile up,register reg,request req where reg.username=req.username and up.filename=req.filename";
               System.out.println(query);
               PreparedStatement pst1=con1.prepareStatement(query,ResultSet.CONCUR_UPDATABLE,ResultSet.TYPE_SCROLL_SENSITIVE);
                ResultSet rs1=pst1.executeQuery();
                
                while(rs1.next())
                {
                    %>
                    
                    <tr>
                        <td><%=rs1.getString("fileid")%></td>
                        <td><%=rs1.getString("filename")%></td>
                        <td><%=rs1.getString("userid")%></td>
                        <td><%=rs1.getString("username")%></td>
                      
                        <td><%=rs1.getString("requesttime")%></td>
                        
                        
                        <% 
                        
                        
                        String accept=rs1.getString("accept");
                        if(accept.equalsIgnoreCase("no"))
                        {
                        %>
                        <td> <a href="status.jsp?id=<%=rs1.getString("id")%>&filename=<%=rs1.getString("filename")%>&username=<%=rs1.getString("username")%>">Send Key</a> </td>
                        <% 
                        }
                        else
                        {
                      %>
                      
                       <td> Request Granted</td>
                       
                      
                      <%
                        }
                        
                        
                        %>
                    </tr>
                    
                    <%
                    
                    
                }
                
                
                
                %>
                
                                 
           
                </table>
                
            </center>
                
                <br><br><br>         
                            
                            
            
            </div>
        </div>
    </body>
   
</html>
