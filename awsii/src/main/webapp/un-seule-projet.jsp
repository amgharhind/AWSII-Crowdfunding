
<%@page import="dao.CredentialsDAO"%>
<%@page import="dao.ICredentialsDao"%>
<%@page import="entities.*"%>
<%@page import="java.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import ="java.time.ZoneId"%>
<%@ page import ="java.time.format.DateTimeFormatter"%>
<%@ page import ="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">

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
    <link rel="stylesheet" href="assets/css/lib/jquery-ui.css">
    
  
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
                            <li><a  href="createProjet.jsp?id_util=<%=moi.getId_util()%>" class="dropdown-item"> CRée  PROJET </a></li>
                            <%}%>
                            <li><a class="dropdown-item" href="#"> ABOUT us</a></li>
                            <li><a class="dropdown-item" href="#"> FAQ </a></li>
                            <li><a class="dropdown-item" href="sign-in.jsp"> S'IDENTIFIER </a></li>
                            <li><a class="dropdown-item" href="sign-up.jsp"> S'INSCRIRE </a></li>
                           
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
                            Créer  PROJET
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
    <main class="product-page style-5">
        <!-- ====== start product ====== -->
        <%
Poste pses=(Poste)session.getAttribute("poste");
Poste p=null;
  if(pses!=null){
	   p=dao.getPosteById(pses.getId_poste());
  }else{
	 int id_poste=Integer.parseInt(request.getParameter("id_poste"));
	 p=dao.getPosteById(id_poste);
  }


%>
        <section class="product pt-50">
            <div class="container">
                <div class="section-head text-center mb-80 style-5">
                    <div class="page-links color-999">
                        <a href="home_principale.jsp" class="me-2">
                            Home
                        </a>
                        <span class="me-2">/</span>
                        <a href="liste-projets.jsp" class="me-2">
                           AWSII Projets
                        </a>
                        <span class="me-2">/</span>
                        <a href="#" class="color-000">
                           <%=p.getNomProjet()%>
                        </a>
                    </div>
                </div>

                <div class="content">
                    <div class="row gx-5">
                     
                        <div class="col-lg-6">
                        
                            <div class="product-slider">
                            
                                <div class="swiper-container gallery-thumbs">
                            <div class="swiper-wrapper">
                            <%  for(Image item:p.getImages()  ){%>
                                        <div class="swiper-slide">
                                       <%  if(!item.getImageData().equals("")){%>
                                            <div class="img">
                                            
                                                <img src="<%=item.getImageData() %>" alt=""> 
                                                </div>
                                              <%}  %>
                                         </div> 
                                         <%} %>
                                       
                                       
                                    </div>
                                </div>
                                
                                <div class="swiper-container gallery-top">
                                    <div class="swiper-wrapper">
                                   <%  for(Image item:p.getImages()){%>
                                        <div class="swiper-slide">
                                        <%  if(item.getImageData()!= null  ){%>
                                            <div class="img">
                                                <img src="<%=item.getImageData() %>" alt="">
                                                 </div>
                                                 <%}  %>
                                         </div>
                                         <% }%>
                                      
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-6">
                            <div class="product-info">
                                <h4 class="category color-salmaN fs-28px"> <%=p.getCategorie() %></h4>
                                <h5 class="title"> <%=p.getNomProjet()%></h5>
                                <div class="rate">
                                    <div class="stars"> 
                                   <%for(int i=0;i<nbr_dollars(p.getFonds(),p.getObjectifDuFond());i++)
                                   {%>
                                        <i class="fas fa-dollar-sign active"></i>
                                        <%} %>
                                        <%for(int i=0;i<10-(nbr_dollars(p.getFonds(),p.getObjectifDuFond()));i++)
                                   {%>
                                        <i class="fas fa-dollar-sign  "></i>
                                        <%} %>
                                    </div>
                                    <span class="rev"><%= purcentage_fond(p.getFonds(), p.getObjectifDuFond())%> %</span>
                                </div>
                                <div class="price">
                                    <%=p.getObjectifDuFond() %> DH
                                </div>
                                <div class="info-text">
                                   <%=p.getDescription()%>
                                </div>
                               
                                <div class="color-quantity">
                                  <span class="color-000 fw-bolder fs-44px  justify-content-center "> </span>
                                    </div>
                                    <div class="qyt-addCart">
                                      <%

                                            LocalDate currentDate = LocalDate.now();

                                         // Get the expiration date as a Date object
                                         Date expirationDate = p.getDateExpiration(); // Assuming item.getDateExpiration() returns a java.util.Date object

                                         // Convert the expiration date to LocalDate using Calendar
                                         Calendar calendar = Calendar.getInstance();
                                         calendar.setTime(expirationDate);

                                         int year = calendar.get(Calendar.YEAR);
                                         int month = calendar.get(Calendar.MONTH) + 1; // Month starts from 0 in Calendar
                                         int day = calendar.get(Calendar.DAY_OF_MONTH);

                                         LocalDate localExpirationDate = LocalDate.of(year, month, day);
                                         
                                         
                                         if(localExpirationDate.isAfter(currentDate)&&p.getFonds()<p.getObjectifDuFond()){%>
                                        <a href="Donnation.jsp?id_poste=<%=p.getId_poste()%>" class="btn rounded-pill bg-hindred fw-bold text-white" target="_blank">
                                            <small>Faire un don </small>
                                        </a>

                                      <% } %>
                                    </div>
                                </div>

                                <div class="more-info pt-20 mt-1 border-1 border-top brd-gray">
                                    <p class="text-uppercase fs-14px color-666 mb-1"> <strong
                                            class="color-000">Date de création:</strong> <%=p.getDateDeCreation()%></p>
                             <p class="text-uppercase fs-14px color-666 mb-1"> <strong class="color-000">Date d'éxpiration:</strong> <%=p.getDateExpiration()%></p>
                                    <p class="text-uppercase fs-14px color-666 mb-1"> <strong class="color-000">Createur:</strong>
                                        <a href="profile.jsp?id_util=<%=p.getCreateur().getId_util()%>"><%=p.getCreateur().getLogin()%></a></p>
                                    <p class="text-uppercase fs-14px color-666 mb-1"> <strong class="color-000">La Ville Ciblée:</strong> <%=p.getVilleCiblee()%></p>
                                </div>

                                <div class="socail-icons">
                                    <a href="#"
                                        class="icon-35 rounded-circle bg-gray overflow-hidden d-inline-flex align-items-center justify-content-center text-gray me-2 ">
                                        <i class="fab fa-twitter"></i>
                                    </a>
                                    <a href="#"
                                        class="icon-35 rounded-circle bg-gray overflow-hidden d-inline-flex align-items-center justify-content-center text-gray me-2 ">
                                        <i class="fab fa-facebook-f"></i>
                                    </a>
                                    <a href="#"
                                        class="icon-35 rounded-circle bg-gray overflow-hidden d-inline-flex align-items-center justify-content-center text-gray me-2">
                                        <i class="fab fa-instagram"></i>
                                    </a>
                                    <a href="#"
                                        class="icon-35 rounded-circle bg-gray overflow-hidden d-inline-flex align-items-center justify-content-center text-gray me-2">
                                        <i class="fab fa-pinterest"></i>
                                    </a>
                                    <a href="#"
                                        class="icon-35 rounded-circle bg-gray overflow-hidden d-inline-flex align-items-center justify-content-center text-gray">
                                        <i class="fab fa-linkedin-in"></i>
                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ====== end product ====== -->


        <!-- ====== start product details ====== -->
        <section class="product-details pt-100">
            <div class="container">
                <ul class="nav nav-pills" id="pills-tab" role="tablist">
                    
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-reviews-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-reviews" type="button" role="tab" aria-controls="pills-reviews"
                            aria-selected="false">Les Contributeurs</button>
                    </li>
                   
                </ul>
                <div class="tab-content" id="pills-tabContent">
                    
                    <div class="tab-pane fade" id="pills-reviews" role="tabpanel" aria-labelledby="pills-reviews-tab">
                        <div class="product-reviews pt-30">
                            <div class="row gx-5">
                                <div class="col-lg-7">
                                    <div class="reviews-content pt-30">
                        <!-- contributeurs -->
                        <%Map<Integer, Float> contrubutions=dao.SumDonByUtilByPoste(p.getId_poste());
                        if(!contrubutions.isEmpty()){
                        	for(Map.Entry<Integer, Float> entry:contrubutions.entrySet()){
                        		%>
                                        <div class="comment-replay-cont bg-light py-5 px-4 mb-20">
                                            <div class="d-flex comment-cont">
                                                <div class="icon-60 rounded-circle img-cover overflow-hidden me-3 flex-shrink-0">
                                                    <% Utilisateur util=dao.getutilById(entry.getKey()); %>
                                                    <img src="<%=util.getImageProfile()%>" alt="">
                                                </div>
                                                <div class="inf">
                                                    <div class="title d-flex justify-content-between">
                                                   
                                                        <h6 class="fw-bold fs-14px"><%=util.getLogin()%></h6>
                                                        <div class="time fs-12px text-uppercase d-inline-block">
                                                           
                                                        </div>
                                                    </div>
                                                    <div class="text color-000 fs-12px mt-10">
                                                       <p><%=entry.getValue() %> DH</p> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                           <% }}else{ %>
                                          <div class="comment-replay-cont bg-light py-5 px-4 mb-20">
                                            <div class="d-flex comment-cont">
                                               <p> Aucune contribution </p>
                                               
                                            </div>
                                        </div>
                                           <%} %>
                                          <!-- fin -->
                                        
                                    </div>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                   
                </div>
            </div>
        </section>
        <!-- ====== end product details ====== -->


        <!-- ====== start Related products ====== -->
  
       

                      
        <!-- ====== end services ====== -->
        <!-- ====== end Related products ====== -->
        <section class="related-products section-padding">
            <div class="container">
                <div class="text-center title">
                    <h3>Autre Projets :</h3>
                </div>
                <div class="related-products-slider position-relative">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                        <% for(Poste item:dao.allPoste()) {%>
                        
                            <div class="swiper-slide">
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

                                            LocalDate CD = LocalDate.now();

                                         // Get the expiration date as a Date object
                                         Date ED = item.getDateExpiration(); // Assuming item.getDateExpiration() returns a java.util.Date object

                                         // Convert the expiration date to LocalDate using Calendar
                                         Calendar cal = Calendar.getInstance();
                                         cal.setTime(ED);

                                         int y = cal.get(Calendar.YEAR);
                                         int m = cal.get(Calendar.MONTH) + 1; // Month starts from 0 in Calendar
                                         int d = cal.get(Calendar.DAY_OF_MONTH);

                                         LocalDate lEDate = LocalDate.of(y, m, d);
                                         
                                         
                                         if(lEDate.isAfter(CD)&&item.getFonds()<item.getObjectifDuFond()){
                                         %>
                                            <a href="un-seule-projet.jsp?id_poste=<%=item.getId_poste()%>" class="btn rounded-pill mt-20">
                                                <span>Faire un don </span>
                                            </a>
                                            <% } %>
                                </div>
                               
                            </div>
                            
                             <% } %>
                      
                        </div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
            </div>
        </section>

    </main>
    <!--End-Contents-->

   
    <!-- ====== start footer ====== -->
     <footer class="style-4 mt-0 pt-100">
        <div class="container">
            <div class="section-head text-center style-4">
                <h2 class="mb-10"> Bienvenue sur  <span> AWSII </span> </h2>
                <% if (moi==null){%>
                <p>Prét a commencer? Rejoignez des milliers d'autres aujourd'hui.</p>
               
                <div class="d-flex align-items-center justify-content-center mt-50">
                    <a href="sign-in.jsp" class="btn rounded-pill bg-hindred fw-bold text-white me-4" target="_blank">
                        <small> <i class="bi bi-box-arrow-in-right me-2 pe-2 border-end"></i> Sign In </small>
                    </a>
                    <a href="sign-up.jsp" class="btn rounded-pill hover-hindred fw-bold border-hindred" target="_blank">
                        <small> <i class="bi bi-person-plus-fill me-2 pe-2 border-end"></i> Sign Up </small>
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
    <script src="assets/js/lib/wow.min.js"></script>
    <script src="assets/js/lib/jquery.fancybox.js"></script>
    <script src="assets/js/lib/lity.js"></script>
    <script src="assets/js/lib/swiper.min.js"></script>
    <script src="assets/js/lib/jquery.waypoints.min.js"></script>
    <script src="assets/js/lib/jquery.counterup.js"></script>
    <!-- <script src="assets/js/lib/pace.js"></script> -->

    <script src="assets/js/lib/scrollIt.min.js"></script>
    <script src="assets/js/main.js"></script>

</body>

</html>