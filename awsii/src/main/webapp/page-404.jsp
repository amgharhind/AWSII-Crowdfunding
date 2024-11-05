
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@page import="dao.CredentialsDAO"%>
<%@page import="dao.ICredentialsDao"%>
<%@ page import="entities.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">


<head>
   
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="author" content="" />
   
    <!-- Title  -->
    <title> awsii moroccan Platforme</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/img/Hind-21-01.png" title="Favicon" sizes="16x16" />

     <!-- ====== bootstrap icons cdn ====== -->
   <link rel="stylesheet" href="assets/bootstrap/font/bootstrap-icons.css">

    <!-- bootstrap 5 -->
    <link rel="stylesheet" href="assets/css/lib/bootstrap.min.css">
  

    <!-- ====== font family ====== -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
        rel="stylesheet">

    <link rel="stylesheet" href="assets/css/lib/all.min.css" />
    <link rel="stylesheet" href="assets/css/lib/animate.css" />
    <link rel="stylesheet" href="assets/css/lib/jquery.fancybox.css" />
    <link rel="stylesheet" href="assets/css/lib/lity.css" />
    <link rel="stylesheet" href="assets/css/lib/swiper.min.css" />
    <link rel="stylesheet" href="assets/css/lib/jquery-ui.css">
    
  
    
    <!-- ====== global style ====== -->
    <link rel="stylesheet" href="assets/css/style.css" />


 
</head>

<body>

   
   <%
 Utilisateur moi=(Utilisateur)session.getAttribute("moi"); 
%>
<% if(moi==null){%>
	   <jsp:forward page="sign-in.jsp"></jsp:forward>
	<%}else{
	
	 ICredentialsDao dao= new CredentialsDAO();	
}
	%>

    <!--Contents-->
    <main class="erorr-404-page style-5">

        <!-- ====== start careers-features ====== -->
        <section class="erorr-page style-5">
            <div class="container">
                <div class="content">
                    <div class="row align-items-center">
                        <div class="col-lg-4">
                            <div class="info">
                                <div class="icon">
                                    <img src="assets/img/icons/rocket.png" alt="">
                                </div>
                                <h2 class="mb-30"> Opps! votre carte bancaire est expirée </h2>
                                <p class="color-777">  </p>
                                <a href="profile.jsp?id_util=<%=moi.getId_util()%>" class="btn rounded-pill blue5-3Dbutn hover-blue2 sm-butn fw-bold mt-40">
                                    <span> <i class="fas fa-long-arrow-left me-2"></i> Votre Profile </span>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-8 text-lg-end">
                            <div class="img">
                                <img src="assets/img/404_1.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ====== end timeline ====== -->

    </main>
    <!--End-Contents-->

    <!-- ====== start to top button ====== -->
    <a href="#" class="to_top bg-gray rounded-circle icon-40 d-inline-flex align-items-center justify-content-center">
        <i class="bi bi-chevron-up fs-6 text-dark"></i>
    </a>
    <!-- ====== end to top button ====== -->

    <!-- ====== request ====== -->
    <script src="assets/js/lib/jquery-3.0.0.min.js"></script>
    <script src="assets/js/lib/jquery-migrate-3.0.0.min.js"></script>
    <script src="assets/js/lib/bootstrap.bundle.min.js"></script>
    <script src="assets/js/lib/wow.min.js"></script>
    <script src="assets/js/lib/jquery.fancybox.js"></script>
    <script src="assets/js/lib/lity.js"></script>
    <script src="assets/js/lib/swiper.min.js"></script>
    <script src="assets/js/lib/jquery.waypoints.min.js"></script>
    <script src="assets/js/lib/jquery.counterup.js"></script>
    <!-- <script src="assets/js/lib/pace.js"></script> -->
    <script src="assets/js/lib/scrollIt.min.js"></script>
    <script src="assets/js/main.js"></script>

    <script>
        const second = 1000,
        minute = second * 60,
        hour = minute * 60,
        day = hour * 24,
        week = hour * 24 * 7;

        let countDown = new Date('Oct 29, 2022 11:30').getTime(),
            x = setInterval(function() {

                let now = new Date().getTime(),
                    distance = countDown - now;

                document.getElementById('days').innerText = Math.floor(distance / (day)),
                document.getElementById('hours').innerText = Math.floor((distance % (day)) / (hour)),
                document.getElementById('minutes').innerText = Math.floor((distance % (hour)) / (minute)),
                document.getElementById('seconds').innerText = Math.floor((distance % (minute)) / second);

               

            }, second)
    </script>

</body>


</html>