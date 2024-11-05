


<%@page import="tools.projetsChercher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@page import="dao.CredentialsDAO"%>
<%@page import="dao.ICredentialsDao"%>
<%@ page import="entities.*"%>
<%@ page import="java.util.*"%>
<%@ page import ="java.time.ZoneId"%>
<%@ page import ="java.time.format.DateTimeFormatter"%>
<%@ page import ="java.time.LocalDate"%>


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
    <link rel="stylesheet" href="assets/css/lib/jquery-ui.min.css" />
    <link rel="stylesheet" href="assets/css/lib/jquery.fancybox.css" />
    <link rel="stylesheet" href="assets/css/lib/lity.css" />
    <link rel="stylesheet" href="assets/css/lib/swiper.min.css" />

    <!-- ====== global style ====== -->
    <link rel="stylesheet" href="assets/css/style.css" />
</head>

<body>

    <%
   

Utilisateur moi=(Utilisateur)session.getAttribute("moi");

ICredentialsDao dao= new CredentialsDAO();

%>
<%!




public int nbr_dollars(float fonds,float objectifDeFond)
{ 
return (int)(fonds/objectifDeFond*10);
}
public int purcentage_fond(float fonds,float objectifDeFond){
	return (int) (fonds/objectifDeFond*100);
}
%>
    <!-- ---------- loader ---------- -->
    <div id="preloader">
        <div id="loading-wrapper" class="show">
            <div id="loading-text"> <img src="assets/img/Hind-21-01.png" alt=""> </div>
            <div id="loading-content"></div>
        </div>
    </div> 
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
                        <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            Acceuil
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown1">
                            <li><a class="dropdown-item" href="#"> PROJETS </a></li>
                              <% if (moi!=null) {%>
                            <li><a  href="createProjet.jsp?id_util=<%=moi.getId_util()%>" class="dropdown-item"> CRéer  PROJET </a></li>
                            <%}%>
                            <li><a class="dropdown-item" href="#"> ABOUT us</a></li>
                            <li><a class="dropdown-item" href="#"> FAQ </a></li>
                            <li><a class="dropdown-item" href="#"> S'IDENTIFIER </a></li>
                            <li><a class="dropdown-item" href="#"> S'inscrire </a></li>
                           
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
                            <li class="nav-item"><a  href="createProjet.jsp?id_util=<%=moi.getId_util()%>" class="nav-link"> CRéer  PROJET </a></li>
                            <%}%>
                    <li class="nav-item">
                       <a class="nav-link" href="liste-projets.jsp">
                            découvrire
                            <small class="hot alert-danger text-danger">fund me</small>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="page-contact-app.html">
                           
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

    
    <!--Contents-->
    <main class="shop-page style-5 style-grad">
        <!-- ====== start shop page ====== -->
        <section class="shop section-padding pt-50">
            <div class="container">
                <div class="section-head text-center style-4">
                    <h2 class="mb-20">AWSII  <span> Projets </span> </h2>
                    <div class="page-links color-999">
                        <a href="home_principale.jsp" class="me-2">
                            Home
                        </a>
                        <span class="me-2">/</span>
                        <a href="liste-projets.jsp" class="color-000">
                            AWSII Projets
                        </a>
                    </div>
                </div>
                <div class="row gx-4">
                    <div class="col-lg-3 col-sm-6">
                    <form action="chercher" method="post">
                        <div class="filter">
                            <div class="filter-card mb-30">
                                <div class="card-title">
                                    <span>Catégories</span>
                                </div>
                                <div class="form-check category-checkRadio">
                                    <input class="form-check-input" type="radio" name="category" id="category1" value="" checked>
                                    <label class="form-check-label cat-link" for="category1">
                                        Tous les  catégories
                                    </label>
                                </div>
                                <div class="form-check category-checkRadio">
                                    <input class="form-check-input" type="radio" name="category" value="Projet d'entreprise" id="category2">
                                    <label class="form-check-label cat-link" for="category2">
                                        Projets d'entreprises
                                    </label>
                                </div>
                                <div class="form-check category-checkRadio">
                                    <input class="form-check-input" type="radio" name="category"  value="Projet social" id="category3">
                                    <label class="form-check-label cat-link" for="category3">
                                        Projets sociaux
                                    </label>
                                </div>
                                <div class="form-check category-checkRadio">
                                    <input class="form-check-input" type="radio" name="category" value="Projet culturel" id="category4">
                                    <label class="form-check-label cat-link" for="category4">
                                        Projets culturels
                                    </label>
                                </div>
                                
                                <div class="form-check category-checkRadio">
                                    <input class="form-check-input" type="radio" name="category" id="category5" value="Projet environnement">
                                    <label class="form-check-label cat-link" for="category5">
                                        Projets environnementaux
                                    </label>
                                </div>
                            </div>
                            <div class="filter-card">
                                <div class="card-title d-flex justify-content-between">
                                    <span>Filtrer</span>
                                    
                                </div>
                                <div class="filter-card-item">
                                    <div class="sub-tilte d-flex align-items-center justify-content-between">
                                        <span>Nom du projet</span>
                                        
                                    </div>
                                    <div class="filter-card-body">
                                        <div class="search-group">
                                            <input type="text" placeholder="Chercher par Nom " name="posteName">
                                            <button> <i class="bi bi-search"></i> </button>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="filter-card-item">
                                    <div class="sub-tilte d-flex align-items-center justify-content-between">
                                        <span>Villes </span>
                                       
                                    </div>
                                    <div class="filter-card-body">
                                        <div class="filter-card-scroll">
                                           
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio"  name="ville" value="" id="ville1" checked>
                                                <label class="form-check-label" for="ville1">
                                                    Toutes les villes
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio"  name="ville" value="casablanca"
                                                    id="ville1">
                                                <label class="form-check-label" for="ville1">
                                                    Casablanca
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="rabat"
                                                id="ville2">
                                                <label class="form-check-label" for="ville2">
                                                    Rabat		
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="sale"
                                                id="ville3">
                                                <label class="form-check-label" for="ville3">
                                                    Salé
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="ksar-el-kebir"
                                                id="ville4">
                                                <label class="form-check-label" for="ville4">
                                                    Ksar El Kebir
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="larache"
                                                id="ville5">
                                                <label class="form-check-label" for="ville5">
                                                    Larache	
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="chefchaouen"
                                                id="ville6">
                                                <label class="form-check-label" for="ville6">
                                                    Chefchaouen	
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="safi"
                                                id="ville7">
                                                <label class="form-check-label" for="ville7">

                                                    Safi											                          
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="agadir"
                                                id="ville8">
                                                <label class="form-check-label" for="ville8">
                                                    Agadir
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="taza"
                                                id="ville9">
                                                <label class="form-check-label" for="ville9">
                                                    Taza
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="tetouan"
                                                id="ville10">
                                                <label class="form-check-label" for="ville10">
                                                    Tetouan
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input"  type="radio" name="ville" value="oujda"
                                                id="ville11">
                                                <label class="form-check-label" for="ville11">
                                                    Oujda
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="marrakech"
                                                id="ville12">
                                                <label class="form-check-label" for="ville12">
                                                    Marrakech
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="beni-mellal"
                                                id="ville13">
                                                <label class="form-check-label" for="ville13">
                                                    Beni Mellal	
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="mohammedia"
                                                id="ville14">
                                                <label class="form-check-label" for="ville14">
                                                    Mohammedia
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="kenitra"
                                                id="ville15">
                                                <label class="form-check-label" for="ville15">
                                                    Kénitra		
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="nador"
                                                id="ville16">
                                                <label class="form-check-label" for="ville16">
                                                    Nador
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="tangier"
                                                id="ville17">
                                                <label class="form-check-label" for="ville17">
                                                    Tanger	
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="meknes"
                                                id="ville18">
                                                <label class="form-check-label" for="ville18">
                                                    Meknes		
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="al-hoceima"
                                                id="ville19">
                                                <label class="form-check-label" for="ville19">
                                                    Al Hoceima			
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="fes"
                                                id="ville20">
                                                <label class="form-check-label" for="ville20">
                                                    Fés			
                                                </label>
                                            </div>
                                            <div class="form-check category-checkBox">
                                                <input class="form-check-input" type="radio" name="ville" value="el-jadida"
                                                id="ville21">
                                                <label class="form-check-label" for="ville21">
                                                    El Jadida
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="filter-card-item border-0 m-0">
                                   
                                    <div class="filter-card-body">
                                        <div class="slider-range-content">
                                        <input  type="submit" value="chercher" class="chercher-style">

                                            <div id="slider-range"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                 </form>
                    </div>
                    <div class="col-lg-9">
                        <div class="products-content">
                            <div class="top-filter mb-10">
                                <div class="row align-items-center">
                                    
                                    <div class="col-lg-6">
                                        <div class="r-side">
                                            <div class="row align-items-center">
                                                <div class="col-lg-6">
                                                    


                                                    <div class="search-bar"><!-- container-->
                                                        <input placeholder="Chercher par Nom..." required="" class="univer" name="text" type="text"><!-- input-->
                                                        <div class="search-svg"><!-- icon-->
                                                            <svg viewBox="0 0 512 512" class="ionicon" xmlns="http://www.w3.org/2000/svg">
                                                                <title>Chercher</title>
                                                                <path stroke-width="32" stroke-miterlimit="10" stroke="currentColor" fill="none" d="M221.09 64a157.09 157.09 0 10157.09 157.09A157.1 157.1 0 00221.09 64z"></path>
                                                                <path d="M338.29 338.29L448 448" stroke-width="32" stroke-miterlimit="10" stroke-linecap="round" stroke="currentColor" fill="none"></path>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="products">
                                <div class="row gx-2 gx-lg-4">
                                     <% List<Poste> filteredPostes = (List<Poste>) request.getAttribute("filteredPostes");
                                     
                                     if (filteredPostes != null) {
                                    	 if(!filteredPostes.isEmpty()){
                                    	 for(Poste item:filteredPostes) { %>
                                     
                                    <div class="col-6 col-lg-3 col-sm-6 card-width">
                                        <div class="product-card">
                                            <div class="img">
                                             <% Iterator<Image> iterator =(item.getImages()).iterator();
                                    if (iterator.hasNext()) {
                                    	Image firstElement =(Image)iterator.next(); %>
                                               <img src="<%=firstElement.getImageData() %>" alt=""><% } %>
                                        <span class="label new"><%=item.getCategorie() %></span>

                                                 
    
                                            </div>
                                            <div class="info">
                                                <h6 > <a href="un-seule-projet.jsp?id_poste=<%=item.getId_poste()%>"> <%=item.getNomProjet()%></a></h6>
                                             
                                                <div class="rate">
                                                    <div class="stars"> 
                                   <% for(int i=0;i<nbr_dollars(item.getFonds(),item.getObjectifDuFond());i++)
                                   {%>
                                        <i class="fas fa-dollar-sign active"></i>
                                        <%} %>
                                        <%for(int i=0;i<10-(nbr_dollars(item.getFonds(),item.getObjectifDuFond()));i++)
                                   {%>
                                        <i class="fas fa-dollar-sign  "></i>
                                        <%} %>
                                    </div>
                                                    <span class="rev"><%= purcentage_fond(item.getFonds(), item.getObjectifDuFond())%> %</span>
                                                </div>
                                            </div>
                                            
                                            <div class="price">
                                              <span ><%=item.getFonds()%> </span>  /
                                        <span class=""><%=item.getObjectifDuFond()%> DH</span>
                                            </div>
                                            
                                            <div class="date-creation mt-15">
                                            

                                                 <i class="bi bi-calendar"></i> <%=item.getDateExpiration() %> 
                                            </div>
                                            <div class="auther">
                                                <span>
                                                   <img class="auther-img" src="<%=item.getCreateur().getImageProfile()%>" alt="">
                                                    <small><a href="profile.jsp?id_util=<%=item.getCreateur().getId_util()%>"> <%=item.getCreateur().getLogin()%></a></small>
                                                </span>
                                               
                                            </div>
                                             <%

                                            LocalDate currentDate = LocalDate.now();

                                         // Get the expiration date as a Date object
                                         Date expirationDate = item.getDateExpiration(); // Assuming item.getDateExpiration() returns a java.util.Date object

                                         // Convert the expiration date to LocalDate using Calendar
                                         Calendar calendar = Calendar.getInstance();
                                         calendar.setTime(expirationDate);

                                         int year = calendar.get(Calendar.YEAR);
                                         int month = calendar.get(Calendar.MONTH) + 1; // Month starts from 0 in Calendar
                                         int day = calendar.get(Calendar.DAY_OF_MONTH);

                                         LocalDate localExpirationDate = LocalDate.of(year, month, day);
                                         
                                         
                                         if(localExpirationDate.isAfter(currentDate)){%>
                                            <a href="#" class="btn rounded-pill mt-20">
                                                <span>Faire un don </span>
                                            </a>
                                            <% } %>
                                        </div>
                                    </div><%}
                                    	 
                                    	 } else{%>
                                    		 
                                    		 
                                    		  <p>Aucun résultat trouvé.</p><%
                                    	 }
                                    	 
                                     }else{
                                    	  for(Poste item:dao.allPoste()) { %>
                                     
                                    <div class="col-6 col-lg-3 col-sm-6 card-width">
                                        <div class="product-card">
                                            <div class="img">
                                             <% Iterator<Image> iterator =(item.getImages()).iterator();
                                    if (iterator.hasNext()) {
                                    	Image firstElement =(Image)iterator.next(); %>
                                               <img src="<%=firstElement.getImageData() %>" alt=""><% } %>
                                        <span class="label new"><%=item.getCategorie() %></span>

                                                 
    
                                            </div>
                                            <div class="info">
                                                
                                               <h6 > <a href="un-seule-projet.jsp?id_poste=<%=item.getId_poste()%>"> <%=item.getNomProjet()%></a></h6>
                                                <div class="rate">
                                                    <div class="stars"> 
                                   <% for(int i=0;i<nbr_dollars(item.getFonds(),item.getObjectifDuFond());i++)
                                   {%>
                                        <i class="fas fa-dollar-sign active"></i>
                                        <%} %>
                                        <%for(int i=0;i<10-(nbr_dollars(item.getFonds(),item.getObjectifDuFond()));i++)
                                   {%>
                                        <i class="fas fa-dollar-sign  "></i>
                                        <%} %>
                                    </div>
                                                    <span class="rev"><%=purcentage_fond(item.getFonds(),item.getObjectifDuFond())%> %</span>
                                                </div>
                                            </div>
                                            
                                            <div class="price">
                                              <span ><%=item.getFonds()%> </span>  /
                                        <span class=""><%=item.getObjectifDuFond()%> DH</span>
                                            </div>
                                            
                                            <div class="date-creation mt-15">
                                            

                                                 <i class="bi bi-calendar"></i> <%=item.getDateExpiration() %> 
                                            </div>
                                            <div class="auther">
                                                <span>
                                                   <img class="auther-img" src="<%=item.getCreateur().getImageProfile()%>" alt="">
                                                    <small><a href="profile.jsp?id_util=<%=item.getCreateur().getId_util()%>"> <%=item.getCreateur().getLogin()%></a></small>
                                                </span>
                                               
                                            </div>
                                            
                                            <%

                                            LocalDate currentDate = LocalDate.now();

                                         // Get the expiration date as a Date object
                                         Date expirationDate = item.getDateExpiration(); // Assuming item.getDateExpiration() returns a java.util.Date object

                                         // Convert the expiration date to LocalDate using Calendar
                                         Calendar calendar = Calendar.getInstance();
                                         calendar.setTime(expirationDate);

                                         int year = calendar.get(Calendar.YEAR);
                                         int month = calendar.get(Calendar.MONTH) + 1; // Month starts from 0 in Calendar
                                         int day = calendar.get(Calendar.DAY_OF_MONTH);

                                         LocalDate localExpirationDate = LocalDate.of(year, month, day);
                                         
                                         
                                         if(localExpirationDate.isAfter(currentDate)&&item.getFonds()<item.getObjectifDuFond()){%>
                                            <a href="#" class="btn rounded-pill mt-20">
                                                <span>Faire un don </span>
                                            </a>
                                            <% } %>
                                        </div>
                                    </div><%} } %>
                                   
                                        
                                 
                                </div>
                                <div class="pagination style-5 color-4 justi     fy-content-center mt-50">
                                    <a href="#" class="active">
                                        <span>1</span>
                                    </a>
                                    <a href="#">
                                        <span>2</span>
                                    </a>
                                    <a href="#">
                                        <span>3</span>
                                    </a>
                                    <a href="#">
                                        <span>4</span>
                                    </a>
                                    <a href="#">
                                        <span>...</span>
                                    </a>
                                    <a href="#">
                                        <span>20</span>
                                    </a>
                                    <a href="#">
                                        <span class="text">next <i class="fas fa-chevron-right"></i> </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ====== end shop page ====== -->
    </main>
    <!--End-Contents-->

    <!-- ====== start footer ====== -->
     <footer class="style-4 mt-0 pt-100">
        <div class="container">
            <div class="section-head text-center style-4">
                <h2 class="mb-10"> Bienvenue sur  <span> AWSII </span> </h2>
                <% if (moi==null){%>
                <p>Prét a  commencer? Rejoignez des milliers d'autres aujourd'hui.</p>
               
                <div class="d-flex align-items-center justify-content-center mt-50">
                    <a href="sign-in.jsp" class="btn rounded-pill bg-hindred fw-bold text-white me-4" target="_blank">
                        <small> <i class="bi bi-box-arrow-in-right me-2 pe-2 border-end"></i> S'identifier </small>
                    </a>
                    <a href="sign-up.jsp" class="btn rounded-pill hover-hindred fw-bold border-hindred" target="_blank">
                        <small> <i class="bi bi-person-plus-fill me-2 pe-2 border-end"></i>S'inscrire </small>
                    </a>
                </div>
                 <%}%>
            </div>
            <div class="foot mt-80">
                
            </div>
            
        </div>
      
    </footer>
    <!-- ====== end footer ====== -->

    <!-- ====== start to top button ====== -->
    <a href="#" class="to_top bg-gray rounded-circle icon-40 d-inline-flex align-items-center justify-content-center">
        <i class="bi bi-chevron-up fs-6 text-dark"></i>
    </a>
    <!-- ====== end to top button ====== -->

    <!-- ====== request ====== -->
    <script src="assets/js/lib/jquery-3.0.0.min.js"></script>
    <script src="assets/js/lib/jquery-migrate-3.0.0.min.js"></script>
    <script src="assets/js/lib/bootstrap.bundle.min.js"></script>
    <script src="assets/js/lib/jquery-ui.min.js"></script>
    <script src="assets/js/lib/slider-mob-touch.js"></script>
    <script src="assets/js/lib/wow.min.js"></script>
    <script src="assets/js/lib/jquery.fancybox.js"></script>
    <script src="assets/js/lib/lity.js"></script>
    <script src="assets/js/lib/swiper.min.js"></script>
    <script src="assets/js/lib/jquery.waypoints.min.js"></script>
    <script src="assets/js/lib/jquery.counterup.js"></script>
   
    <script src="assets/js/lib/scrollIt.min.js"></script>
    <script src="assets/js/main.js"></script>


</body>


</html>