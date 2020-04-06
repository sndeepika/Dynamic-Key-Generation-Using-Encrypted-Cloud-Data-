<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.ConnectException"%>
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
           <a></a> 
            </div>
      

            <!-- Collect the nav links, forms, and other content for toggling -->
           
            <h2 align="center"> Dynamic Key Generation Over Encrypted Data </h2>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              
                <center>
                <div class="button navbar-right">
                  <a href="index.html"><button class="navbar-btn nav-button wow bounceInRight login" data-wow-delay="0.8s">Home</button></a>
                 <!-- <a href="searchfile.jsp"><button class="navbar-btn nav-button wow fadeInRight" data-wow-delay="0.6s">Search File</button></a>-->
                  
                   <a href="filerequest.jsp"><button class="navbar-btn nav-button wow bounceInRight login" data-wow-delay="0.8s">File Request</button></a>
                   
                    <a href="downloadfiles.jsp"><button class="navbar-btn nav-button wow bounceInRight login" data-wow-delay="0.8s">Download Files</button></a>
                    <a href="datauser.jsp"><button class="navbar-btn nav-button wow fadeInRight" data-wow-delay="0.6s">Sign Out</button></a>
                  
                     
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
                
              <% 
              
              String name=request.getParameter("name");
              String filename=request.getParameter("filename");
              String key=request.getParameter("key");
              
              System.out.println("key is "+key);
              
              String cindex=request.getParameter("cindex");
              String lindex=request.getParameter("lindex");
              
              Connection con=DbConnector.getConnection();
              PreparedStatement pst=con.prepareStatement("select * from uploadfile where filename=? and keyword1=? and keyword2=? and gkey=?");
              pst.setString(1, filename);
              pst.setString(2, cindex);
              pst.setString(3, lindex);
              pst.setString(4, key);
              
              ResultSet rs=pst.executeQuery();
              
              if(rs.next())
              {
                  
                  
              response.reset();                        
  // check the file type and set the header contentType accordingly..   
  if(rs.getString("extention")==".txt")
  {
      response.setContentType("application/octet-stream");
  }
  else if(rs.getString("extention")==".pdf")
  {
      response.setContentType("application/pdf");
  }
     else if(rs.getString("extention")==".jpg")
  {
      response.setContentType("image/jpeg");
  }
  
  
  else if((rs.getString("extention")==".doc")||rs.getString("extention")==".docx")
  {
      response.setContentType("application/msword");
  }
  else if((rs.getString("extention")==".xls")||(rs.getString("extention")==".xlsx"))
  {
      response.setContentType("application/vnd.ms-excel");
  }
  // add header information to response object
  response.addHeader("Content-Disposition","attachment; filename="+rs.getString("filename"));
  // create the byte array from Blob
  Blob blb = rs.getBlob("file");
  byte[] bdata = blb.getBytes(1, (int) blb.length());
  
  // get the response Output stream object to write the content of the file into header
  OutputStream output =  response.getOutputStream();
  output.write(bdata);
  output.close();
      
                  
     
              }
              
              
              else
              {
                  %>
                  
                  <h2 align="center">Please Enter Correct Details......</h2>
                  
                  <%
                  
        PreparedStatement pst1=con.prepareStatement("select userid from register where username=?");
        pst1.setString(1, name);
        ResultSet rs1=pst1.executeQuery();
        rs1.next();
        
        String id=rs1.getString(1);
        
        
        PreparedStatement pst2=con.prepareStatement("insert into hacker(id,name,fname,scret,key1,key2) values(?,?,?,?,?,?)");
        pst2.setString(1, id);
        pst2.setString(2, name);
        pst2.setString(3, filename);
        pst2.setString(4, key);
        pst2.setString(5, cindex);
        pst2.setString(6, lindex);
        
        pst2.executeUpdate();
              }
              
 
              %>
                
                
                
                
                
            </center>
            </div>
        </div>
    </body>
   
</html>