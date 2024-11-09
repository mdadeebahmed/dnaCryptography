
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Cloud Computing</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&family=Open+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">  

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
                <a href="" class="navbar-brand p-0">
                    <h1 class="m-0"><i class="fa fa-server me-3"></i>DNA Implementation</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="CloudHome.jsp" class="nav-item nav-link">Home</a>
                        <a href="COriginalToAscii.jsp" class="nav-item nav-link">Original to ASCii</a>
                        <a href="CAsciiToHexa.jsp" class="nav-item nav-link ">ASCii To HexaDecimal</a>
                        <a href="CHexaToBinary.jsp" class="nav-item nav-link ">HexaDecimal To Binary</a>
                        <a href="BinaryToDNA.jsp" class="nav-item nav-link active">Binary To DNA</a>
                        
                        <a href="#" class="nav-item nav-link"></a>
                    </div>
                   
                    <a href="Cloud.jsp" class="btn btn-secondary py-2 px-4 ms-3">Logout</a>
                </div>
            </nav>

            <div class="container-xxl py-5 bg-primary hero-header mb-5">
                <div class="container my-5 py-5 px-lg-5">
                    <div class="row g-5">
                        <div class="col-lg-6 pt-5 text-center text-lg-start">
                            <h1 class="display-4 text-white mb-4 animated slideInLeft">Welcome</h1>
                           
                            <h1 class="text-white mb-4 animated slideInLeft">
                                <small class="align-top fw-normal" style="font-size: 15px; line-height: 25px;"></small>
                                <span></span>
                                <small class="align-bottom fw-normal" style="font-size: 15px; line-height: 33px;"></small>
                            </h1>
                            <a href="CloudHome.jsp" class="btn btn-secondary py-sm-3 px-sm-5 me-3 animated slideInLeft">CLOUD HOME</a>
                        </div>
                        <div class="col-lg-6 text-center text-lg-start">
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->
        <center>
<h1 class="mb-3" style="margin-bottom:500px;">BINARY TO DNA</h1>
<table>
    <tr>
        <th>Sender</th>
        <th>Receiver</th>
        <th>Message</th>
        <th>Ascii</th>
        <th>HexaDecimal</th>
        <th>Binary</th>
         <th>DNA</th>
        
    </tr>
    <%try{
    ResultSet r=Queries.getExecuteQuery("select * from dna");
    while(r.next()){
        %>
        <tr>
            <td><%=r.getString("sender")%></td>
            <td><%=r.getString("receiver")%></td>
            <td><textarea cols="25" rows="3"><%=r.getString("message")%></textarea></td>
            <td><%=r.getString("ascii")%></td>
            <td><%=r.getString("hexa")%></td>
            <td><textarea cols="30" rows="5"><%=r.getString("binary")%></textarea></td>
             <td><textarea cols="30" rows="5" style="color:red;"><%=r.getString("dna")%></textarea></td>
          
        </tr>
        <%
    }
    }catch(Exception e){
        System.out.println(e);
}%>
    
</table>
        </center>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>