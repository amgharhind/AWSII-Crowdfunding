<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@page import="dao.CredentialsDAO"%>
<%@page import="dao.ICredentialsDao"%>
<%@ page import="entities.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="fr">

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

ICredentialsDao dao= new CredentialsDAO();

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

    <!--Contents-->
    <main class="services-page style-5">

        <!-- ====== start services ====== -->
        <section class="services section-padding bg-white pb-50 style-6">
            <div class="container">
                <div class="section-head text-center style-4 mb-60">
                   
                    <h2 class="mb-20">  <span> AWSII</span> </h2>
                   
                    <p class="fw-bold fs-2"> Platforme Marocaine de crowdfunding. </p>
                    <figure class="text-center ">
                        <blockquote class="blockquote">
                          <p class="fs-5">No one has ever become poor by giving.</p>
                        </blockquote>
                        <figcaption class="blockquote-footer">
                            Anne Frank 
                        </figcaption>
                      </figure>
                  
                </div>
            </div>
            <div class="content">
                <div class="services-slider position-relative style-6">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                        <%for(Poste item:dao.allPoste()){%>
                            <div class="swiper-slide">  
                                <div class="card">
                                    <div class="image">
                                    <% Iterator<Image> iterator =(item.getImages()).iterator();
                                    if (iterator.hasNext()) {
                                    	Image firstElement =(Image)iterator.next(); %>
                                    <img src="<%=firstElement.getImageData() %>" alt="" ><%} %>
                                    
                                    
                                    </div>
                                      <span class="name_projet"><%=item.getNomProjet()%></span>
                                      <span class="price"><%=item.getFonds()%> Dh fonds collectées</span>
                                      
                                        <a href="un-seule-projet.jsp?id_poste=<%=item.getId_poste()%>" class="card-link">
                                        
                                        
                                            <span>Voir plus</span>
                                            <div class="icon2">
                                              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"></path><path fill="currentColor" d="M16.172 11l-5.364-5.364 1.414-1.414L20 12l-7.778 7.778-1.414-1.414L16.172 13H4v-2z"></path></svg>
                                            </div>
                                        </a>
                                    </div>


                                   
                                   
                            </div><%} %>
                            
                            
                            
                           

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ====== end services ====== -->


        <!-- ====== start about ====== -->
        <section class="about style-4">
            <div class="content sec-content">
                <div class="container">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-lg-5 order-2 order-lg-0">
                            <div class="info">
                                <div class="section-head style-4">
                                    <small class="title_small">Vue générale sur Crowdfunding.</small>
                                    <h2 class="mb-30">Le financement participatif au  <span> Maroc. </span> </h2>
                                </div>
                                <p class="text mb-40">
                                    <!--Automatically syncs across all your devices. You can also access and write notes without internet connection.-->
                                </p>
                                <div class="faq style-3 style-4">
                                    <div class="accordion" id="accordionExample">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="heading1">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="true" aria-controls="collapse1">
                                                    le rôle des plateformes de Crowdfunding.
                                                </button>
                                            </h2>
                                            <div id="collapse1" class="accordion-collapse collapse show" aria-labelledby="heading1" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    Les plateformes de financement participatif fournissent une source alternative de financement pour les entrepreneurs,
                                                     les organisations à but non lucratif et les individus créatifs au Maroc. <br> Elles permettent de valider des idées, 
                                                     d'augmenter la visibilité et de diversifier les sources de financement.<br> Le financement participatif aide également à 
                                                     créer une communauté autour d'un projet, générant ainsi un sentiment d'engagement parmi les supporters. Dans l'ensemble,
                                                      les plateformes de financement participatif peuvent 
                                                    jouer un rôle important dans le soutien à l'innovation et au développement économique au Maroc.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="heading2">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
                                                   Les types principaux de Crowdfunding
                                                </button>
                                            </h2>
                                            <div id="collapse2" class="accordion-collapse collapse" aria-labelledby="heading2" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    Il y a quatre types principaux de crowdfunding: dons, récompenses, prêt et investissement.<br>
                                                    Le crowdfunding par dons implique que les donateurs font un don sans rien attendre en retour. <br>
                                                    Le crowdfunding par récompenses implique que les donateurs reçoivent une récompense ou un produit en échange de leur contribution.<br> 
                                                    Le crowdfunding par prêt implique que les investisseurs prêtent de l'argent et s'attendent à être remboursés à un taux d'intérêt fixé.<br> Le crowdfunding par investissement implique que les investisseurs achètent des parts ou des actions dans l'entreprise ou le projet avec l'espoir de réaliser un retour sur investissement. 
                                                   Le choix du type de crowdfunding dépend des objectifs du porteur de projet, du type de projet et du public cible.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="heading3">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
                                                  La Loi définit le financement participatif .
                                                </button>
                                            </h2>
                                            <div id="collapse3" class="accordion-collapse collapse" aria-labelledby="heading3" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    La loi 15.18 définit le financement participatif 
                                                    comme une activité où des personnes physiques ou morales mettent en 
                                                    commun des fonds pour financer un projet en échange d'une contrepartie financière, 
                                                    pouvant prendre la forme de remboursements, de parts de capital ou de royalties. <br>
                                                    Cette loi fixe également les limites de financement pour les investisseurs particuliers et les PME
                                                    <abbr>(Les petites et moyennes entreprises ).</abbr> <br>
                                                    Les investisseurs particuliers ne peuvent pas investir plus de 50000 dirhams marocains (environ 4 600 euros) dans une même opération de financement participatif, tandis que les PME ne peuvent pas lever plus de 5 millions de dirhams (environ 460 000 euros) par an sur une plateforme de financement participatif. <br>
                                                    Enfin, selon les articles 55 et 54 de cette loi, le taux d'intérêt pour les prêts dans le financement participatif doit être soumis aux lois de Bank Al-Maghrib.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <a href="https://fr.wikipedia.org/wiki/Financement_participatif" class="btn btn-img mt-40 rounded-pill" target="_blank">
                                    <div class="icon img-contain">
                                        <img src="assets/img/imag2/social.png" alt="">
                                    </div>
                                    <div class="inf">
                                        <small> En savoir plus sur </small>
                                        <h6>Le Financement Participatif</h6>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-6 order-0 order-lg-2">
                            <div class="img mb-30 mb-lg-0">
                                <img src="assets/img/imag2/investisment-rb.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <img src="assets/img/about/about_s4_bubble2 - cp.png" alt="" class="bubble2">
            </div>
            <div class="content trd-content">
                <div class="container">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-lg-6">
                            <div class="img mb-30 mb-lg-0">
                                <img src="assets/img/imag2/online_donation.png" alt="">
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="info">
                                <div class="section-head style-4">
                                    <small class="title_small">About Us</small>
                                    <h2 class="mb-30">Quoi de neuf dans  <span> AWSII </span>? </h2>
                                </div>
                                <p class="text mb-40">
                                    AWSII est un sevice gratuit et sécurisé dédié à la collecte de dons  en ligne au Maroc .
                                     Grâce à son efficacité et à sa simplicité d’utilisation, il permet aux porteur de projet 
                                    de collecter plus facilement des dons en faisant appel à la générosité des internautes .
                                </p>
                                <ul>
                                    
                                    <li class="d-flex align-items-center">
                                        <i class="bi bi-dot fs-2 me-2 lh-1 color-hindred"></i>
                                        <h6 class="fw-bold">Lancez gratuitement votre campagne de Crowdfunding sur Awsii .</h6>
                                    </li>
                                    <li class="d-flex align-items-center op-4">
                                        <i class="bi bi-dot fs-2 me-2 lh-1 color-hindred"></i>
                                        <h6 class="fw-bold">Les contributeurs financent les projets.</h6>
                                    </li>
                                    <li class="d-flex align-items-center op-4">
                                        <i class="bi bi-dot fs-2 me-2 lh-1 color-hindred"></i>
                                        <h6 class="fw-bold">Les créateurs de projet levée les fonds  des projets.</h6>
                                    </li>
                                    <li class="d-flex align-items-center op-4">
                                        <i class="bi bi-dot fs-2 me-2 lh-1 color-hindred"></i>
                                        <h6 class="fw-bold">Utiliser gratuitement l'argent collecté.
                                           </h6>
                                    </li>
                                </ul>
                                <a href="liste-projets.jsp" class="btn rounded-pill bg-salmablue fw-bold text-white mt-50">
                                    <small> Découvrir </small>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <img src="assets/img/about/about_s4_bubble_cp.png" alt="" class="bubble">
            </div>
        </section>
        <!-- ====== end about ====== -->


         <!-- ====== start testimonials ====== -->
        
        <!-- ====== end testimonials ====== -->


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
    <script src="assets/js/lib/scrollIt.min.js"></script>
    <script src="assets/js/main.js"></script>

</body>

</html>