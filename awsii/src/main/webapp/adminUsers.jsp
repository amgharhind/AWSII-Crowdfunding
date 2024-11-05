<%@page import="dao.CredentialsDAO"%>
<%@page import="dao.ICredentialsDao"%>
<%@page import="entities.Utilisateur"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">


<head>
    <!-- Metas -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
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
    
    <!-- ====== global style ====== -->
    <link rel="stylesheet" href="assets/css/style.css" />

<style>
.user-card-container {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}

.user-card {
    text-align: center;
    margin-bottom: 30px;
    flex-basis: calc(20% - 20px);
    max-width: calc(20% - 20px);
}

.user-card img {
    width: 100px;
    height: 100px;
    object-fit: cover;
    border-radius: 50%;
}

.user-card h3 {
    margin-top: 10px;
    font-size: 16px;
}

.user-card-btns {
    display: flex;
    justify-content: center;
    margin-top: 10px;
}

.user-card-btn {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    margin: 0 5px;
    background-color: #183F7B;
    color: #ffffff;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.user-card-btn i {
    font-size: 14px;
}

.user-card-btn:hover {
    background-color: #b62540;
}
</style>
</head>

<body>

<% Utilisateur moi=(Utilisateur)session.getAttribute("moi");

ICredentialsDao dao=new CredentialsDAO() ;%>

<% if(moi==null){%>

<jsp:forward page="sign-in.jsp"></jsp:forward>
<%} %>
  <!-- ====== end loading page ====== -->

  <!-- ====== start top navbar ====== -->
  <div class="top-navbar style-4">
      <div class="container">
          <div class="content text-white">
              <img src="assets/img/coffee.png" alt="" class="icon-15">
              <img src="assets/img/icons/nav_icon/imoj_heart.png" alt="" class="icon-15">
              <span class="fs-10px op-6">Buy Me a Coffee </span>
              
             <!-- <span class="fs-10px op-6">Get for New Account</span>-->
              <a href="#" class="fs-10px text-decoration-underline ms-2">Click Me!</a>
          </div>
      </div>
  </div>
  <!-- ====== end top navbar ====== -->

  <!-- ====== start navbar ====== -->
  <nav class="navbar navbar-expand-lg navbar-light style-4">
        <div class="container">
            <a class="navbar-brand" href="#">
              <!-- ====== logo ====== -->  <img src="assets/img/LOGO TWIL (1)/logo.png" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav m-auto mb-2 mb-lg-0 text-uppercase">
                    <li class="nav-item dropdown">
                        <a class="nav-link active dropdown-toggle" href="home_principale.jsp" id="navbarDropdown1" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            Acceuil
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown1">
                            <li><a class="dropdown-item" href="liste-projets.jsp"> PROJETS </a></li>
                            <% if (moi!=null) {%>
                            <li><a  href="createProjet.jsp?id_util=<%=moi.getId_util()%>" class="dropdown-item"> créer projet </a></li>
                            <%}%>
                            <li><a class="dropdown-item" href="#"> ABOUT us</a></li>
                            <li><a class="dropdown-item" href="#"> FAQ </a></li>
                            <li><a class="dropdown-item" href="sign-in.jsp"> S'IDENTIFIER </a></li>
                            <li><a class="dropdown-item" href="sign-in.jsp"> S'inscrire </a></li>
                          
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            catégories
                            
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown1">
                            <li><a class="dropdown-item" href="">Projets d'entreprise </a></li>
                            <li><a class="dropdown-item" href="">Projets culturels</a></li>
                            <li><a class="dropdown-item" href="">Projets sociaux</a></li>
                            <li><a class="dropdown-item" href="">Projets environnementaux</a></li>
                            
                        </ul>
                    </li>
                     <% if (moi!=null) {%>
                    <li class="nav-item">
                        <a class="nav-link" href="createProjet.jsp?id_util=<%=moi.getId_util()%>">
                            créer projet
                        </a>
                    </li>
                     <%}%>
                    <li class="nav-item">
                        <a class="nav-link" href="liste-projets.jsp">
                            découvrire
                            <small class="hot alert-danger text-danger">fund me</small>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                           
                            <img src="assets/img/information.png" alt="" class="icon-15 me-1">
                            ABOUT us
                        </a>
                    </li>
                </ul>
                <div class="nav-side">
                    <div class="d-flex align-items-center">
                     <% if (moi!=null) {%>
                        <a href="profile.jsp?id_util=<%= moi.getId_util()%>" class="search-icon me-4">
                            <i class="bi bi-person"></i>
                        </a>
                        <a href="disconnect" class="btn rounded-pill brd-gray hover-hindred sm-butn fw-bold">
                            <span>Déconnecter <i class="bi bi-arrow-right ms-1"></i> </span>
                        </a>
                         <%}%>
                         <% if(moi==null) {%>
                        <a href="sign-in.jsp" class="btn rounded-pill brd-gray hover-hindred sm-butn fw-bold">
                            <span>S'identifier <i class="bi bi-arrow-right ms-1"></i> </span>
                        </a>
                       <%} %>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <!-- ====== end navbar ====== -->

    <!-- ====== start inner-header style-5 ====== -->
   
      
    <div style="display: flex; justify-content: center; align-items: center; background-color: #e0e0e0; width: 100%; height: 140px;">
        <h2 style="color: #183F7B;">Liste des Utilisateurs :</h2>  
    </div>
    
    
    
    <!-- ====== end inner-header style-5 ====== -->


    <!--Contents-->
    <main class="faq-page style-5 section-padding">

        <!-- ====== start faq-tabs style-5 ====== -->
        <!-- ====== end faq-body style-5 ====== -->
        <section class="faq-body style-5">
            <div class="container">
              <div class="row">
                <div class="col-lg-12">
                  <div class="user-card-container">
                   <!-- user start -->
                   <% for(Utilisateur utilisateur:dao.allUsers()){ %>
                    <div class="user-card">
                      <img src="<%=utilisateur.getImageProfile()%>" alt="Profile Image">
                      <h3><%=utilisateur.getLogin()%></h3>
                      <div class="user-card-btns">
                        <button class="user-card-btn" title="Add">
                            <a href="profile.jsp?id_util=<%=utilisateur.getId_util()%>" target="blank_">
                            <i class="bi bi-plus"></i> </a> 
                            
                          </button>
                          
                        <button class="user-card-btn" title="Delete">
                        <a href="delete?id_util=<%=utilisateur.getId_util()%>" >
                          <i class="bi bi-trash"></i></a> 
                        </button>
                      </div>
                    </div>
                    <% }%>
                    <!-- user end -->
                 
                  
                   
                  
                    
                    <!-- Add more user cards here -->
                  </div>
                </div>
              </div>
            </div>
          </section>
        

       
    </main>
    <!--End-Contents-->


  <!-- ====== start to top button ====== -->
  <a href="#" class="to_top bg-gray rounded-circle icon-40 d-inline-flex align-items-center justify-content-center">
      <i class="bi bi-chevron-up fs-6 text-dark"></i>
  </a>
  <!-- ====== end to top button ====== -->


  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
  $(document).ready(function() {
    // Add click event listener to delete buttons
    $('.delete-user-btn').on('click', function() {
      // Get the parent user card element
      var userCard = $(this).closest('.user-card');
      // Remove the user card from the container
      userCard.remove();
    });
  });
  $(document).ready(function() {
  // Add click event listener to delete buttons
  $('.delete-user-btn').on('click', function() {
    // Get the parent user card element
    var userCard = $(this).closest('.user-card');
    // Remove the user card from the container
    userCard.remove();
  });

  
</script>

  
</body>

</html>