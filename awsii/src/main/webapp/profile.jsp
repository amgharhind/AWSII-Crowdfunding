<%@page import="dao.CredentialsDAO"%>
<%@page import="dao.ICredentialsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%@ page import="entities.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="fr">



<head>
    <!-- Metas -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
   
    <meta name="author" content="hind" />

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
</head>

<body>
<%
 Utilisateur moi=(Utilisateur)session.getAttribute("moi");
ICredentialsDao dao= new CredentialsDAO();

 
%>
    <!-- ====== start loading page ====== -->
 
    <!-- ---------- loader ---------- -->
    <!--<div id="preloader">
        <div id="loading-wrapper" class="show">
            <div id="loading-text"> <img src="assets/img/Hind-21-01.png" alt=""> </div>
            <div id="loading-content"></div>
        </div>
    </div> -->
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
                        

                        <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown1" role="button"
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
                            <li><a class="dropdown-item" href="sign-in.jsp"> SIGN IN </a></li>
                            <li><a class="dropdown-item" href="sign-up.jsp"> S'inscrire </a></li>
                           
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
                    <% if (moi!=null) {%>
                    <% int id_message_box = dao.getMessageBoxId(moi.getId_util());
                    
                    //Conversation last_conv=dao.LastConversation(id_message_box);
                    Conversation last_conv=dao.getLastConversation(moi.getId_util());
                    %>
                    
                    <li>
                     <% if(last_conv!=null) {%>
                     
                        <a class="dropdown-item hover-white" target="blank_" href= "inbox3.jsp?id_conversation=<%=last_conv.getId_conv()%>">
                          <i class="bi bi-messenger "></i>
                        </a>
                       
                        
                        <div class="sidebar">
                          <button class="close-button">&times;</button>
                          
                          <div class="conversation" data-conversation="2">
                        <%  if(last_conv.getParticipantB().getId_util()!=moi.getId_util()){%>
                            <img src="<%=last_conv.getParticipantB().getImageProfile() %>" alt="conversation image">
                            <div class="conversation-details">
                              <h4><%=last_conv.getParticipantB().getLogin()%></h4>
                              <p><%=dao.getLastMessage(last_conv.getId_conv())%></p>
                            </div>
                            <%  }else{%>
                            <img src="<%=last_conv.getParticipantA().getImageProfile() %>" alt="conversation image">
                            <div class="conversation-details">
                              <h4><%=last_conv.getParticipantA().getLogin()%></h4>
                              <p><%=dao.getLastMessage(last_conv.getId_conv())%></p>
                            </div>
                            <%  }%>
                          </div>
                        </div>
                        <%}else{%>
                         <a class="dropdown-item hover-white" target="blank_" href= "#">
                          <i class="bi bi-messenger "></i>
                        </a>
                        <%}%>
                      </li>
                       <%}%>

                </ul>
               
                <div class="nav-side">
                    <div class="d-flex align-items-center">
                     <% if (moi!=null) {%>
                     <% if (moi.getRole()!=null) {%>
                        <a href="adminUsers.jsp" class="btn rounded-pill brd-gray hover-hindred sm-butn fw-bold">
                            <i class="bi bi-shield"></i> 
                        </a>
                        <%}%>
                        
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
    <!--    messages-->
                     
    
    <!-- ====== end navbar ====== -->

    <!-- ====== start header ====== -->
   
    <header class="style-13">
        <div class="container">
            <div class="content">
                <div class="row align-items-center gx-0">
                    <div class="col-lg-6">
                        <div class="info">
                         <% int id_ut = Integer.parseInt(request.getParameter("id_util"));
                              Utilisateur u=dao.getutilById(id_ut);%>
                              
                            <p class="color-999 text-uppercase mb-10"> Bienvenue sur mon compte </p>
                            <h1> <%=u.getLogin() %>  </h1>
                            <h4>   <span> <%=u.getNom()%>   </span> <span> <%=u.getPrenom() %> </span>  </h4>
                            <p class="text-muted"> <i class="bi bi-geo-alt-fill color-primary me-2"></i> <span> <%=u.getInformationsPersonnels().getAdresse().getRegion() %> - <%=u.getInformationsPersonnels().getAdresse().getPaye()%> -<%=u.getInformationsPersonnels().getAdresse().getVille()%>  </span></p>
                         <% if (moi!=null&&  id_ut== moi.getId_util() ) {%>
                          <div class="btns d-flex align-content-center mt-30">
                          
                           
                                <a href="modifierProfil.jsp?id_util=<%=moi.getId_util()%>" class="btn rounded-pill text-white bg-bluesalmahind" target="_blank">
                                    <small> <i class="bi bi-wrench me-2 pe-2 border-end"></i>modifier  </small>
                                    
                                </a>
                  
                            </div>
                              <% } %>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="img mt-5 mt-lg-0">
                            <img src="<%=u.getImageProfile()%>" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <div class="social-icons">
            
           
              
           <a href="https://mail.google.com/mail/?view=cm&to=<%=u.getInformationsPersonnels().getMailUrl()%>" target="_blank">
                        
                <i class="far fa-envelope"></i>
                </a>
              
              <a href="https://api.whatsapp.com/send?phone=<%=u.getInformationsPersonnels().getTel()%>" target="_blank" rel="noopener noreferrer">
                <i class="fab fa-whatsapp"></i>
              </a>

              <a href="<%=u.getInformationsPersonnels().getLinkedinUrl()%>" target="_blank" rel="noopener noreferrer">
                <i class="fab fa-linkedin"></i>
              </a>
        </div>
        
        <div class="lines">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
    </header>
     <!-- ====== end of header ====== -->
    <!--Contents-->
    <main class="portfolio-page style-1">
   
       <% if ( moi!=null&& id_ut!= moi.getId_util() ) {%>
          
        <button class="toggle-chat-btn"  id="toggle-chat-btn">Envoyer un message</button>
     



<div class="chat-container" >
  <div class="chat-header">
    <img src="<%=u.getImageProfile() %>" alt="">
    <h4><%=u.getLogin() %></h4>
    <button class="close-chat">&times;</button>
  </div>
  <div class="chat-messages">
    <% 
    Conversation conv=dao.retrieveConversation(moi.getId_util(), u.getId_util());
    if(conv!=null){
    	
    List<Message> listeMessages=dao.ListeMessagesByconvId(conv.getId_conv());
    
    %>
    <%  for( Message m:listeMessages){
    
    if(m.getProprietaire().getId_util()==moi.getId_util()){ %>
    <div class="message sent">
        <p><%=m.getContenue()%></p>
         
      </div>
      <span style="color:grey"><%=m.getDateEnvoi()%></span>
      
    <%} else{%>
      <div class="message received">
        <p><%=m.getContenue()%></p>
      </div>
      <span style="color:grey"><%=m.getDateEnvoi()%></span>
     <%} }}else{%>
    	 <p>nothing</p>
    	 <%}%>
        
  </div>
  
  <form class="chat-form" action="chat" method="post">
   <input type="text" name="sender" value="<%=moi.getId_util()%>" style="display:none"/>
           <input type="text" name="receiver" value="<%=id_ut%>" style="display:none"/>
    <input  name="message" type="text" placeholder="Tapez un message..." required>
    <button type="submit"><i class="fas fa-paper-plane"></i></button>
  </form>
</div>


<% }%>
      
        <!-- ====== start portfolio-projects ====== -->
        <section class="portfolio-projects section-padding pt-50 style-1 bg-white">
            <div class="container">
                
                <div class="controls">
                   
                   <!-- mes projet where createur== moi.id --> 
                    <button type="button" class="control text-uppercase active" data-filter=".security"  >mes projets</button>
                    <button type="button" class="control text-uppercase" data-filter=".website">mes contributions</button>
                  
                </div>
                <section class="portfolio style-1">
                    <div class="content">
                        <div class="row mix-container">
                       <% for(Poste item:dao.MesProjets(u.getId_util())){ %>
                            <div class="col-lg-4 mix security">
                                <div class="portfolio-card mb-50">
                                    <div class="img">
                                     <% Iterator<Image> iterator =(item.getImages()).iterator();
                                    if (iterator.hasNext()) {
                                    	Image firstElement =(Image)iterator.next(); %>
                                        <img src="<%=firstElement.getImageData() %>" alt="<%=firstElement.getImageData() %>">
                                        <%} %>
                                    </div>
                                    <div class="info">
                                        <h5>
                                            <a href="un-seule-projet.jsp?id_poste=<%=item.getId_poste()%>"> <%=item.getNomProjet()%> </a> 
                                        </h5>
                                        <small class="d-block navy-blue text-uppercase"><%=item.getCategorie()%></small>
                                        <div class="text">
                                           <%=item.getDescription()%>
                                        </div>
                                        <div class="auther">
                                            <span>
                                                <img class="auther-img" src="<%=item.getCreateur().getImageProfile()%>" alt="">
                                                <small><a href="profile.jsp?id_util=<%=item.getCreateur().getId_util()%>"><%=item.getCreateur().getLogin()%></a></small>
                                            </span>
                                           
                                        </div>
                                        <div class="tags">
                                            <a href="#"><%=item.getVilleCiblee()%></a>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%} %>
                            
                            
                            <div class="col-lg-4 mix website">
                                <div class="portfolio-card mb-50">
                                <%  if(!dao.getDonationPostes(u.getId_util()).isEmpty()) {%>
                            
                                <% 
                                Iterator<Poste> iterSet=(dao.getDonationPostes(u.getId_util())).iterator();
                                while(iterSet.hasNext()){
                                Poste item=(Poste)iterSet.next();
                               %>
                                    <div class="img">
                                     <% Iterator<Image> iterator =(item.getImages()).iterator();
                                    if (iterator.hasNext()) {
                                    	Image firstElement =(Image)iterator.next(); 
                                    	
                                    	
                                    	%>
                                        <img src="<%=firstElement.getImageData() %>" alt="<%=firstElement.getImageData() %>">
                                        <%} %>
                                    </div>
                                    <div class="info">
                                        <h5>
                                            <a href="un-seule-projet.jsp?id_poste=<%=item.getId_poste()%>"> <%=item.getNomProjet()%> </a> 
                                        </h5>
                                        <small class="d-block navy-blue text-uppercase"><%=item.getCategorie()%></small>
                                        <div class="text">
                                           <%=item.getDescription()%>
                                        </div>
                                        
                                        
                                        <%for(donation d:dao.getDonationsByUserAndPost(u.getId_util(), item.getId_poste())){%>
                                        
                                         <div class="text">
                                            <i class="bi bi-calendar"></i> <%=d.getDateDonation()%>       
                                        </div>
                                          <div class="text">
                                                <%=d.getMontant()%> DH    
                                        </div>
                                
                                 <%}%>
                                        <div class="auther">
                                            <span>
                                                <img class="auther-img" src="<%=item.getCreateur().getImageProfile()%>" alt="">
                                                <small><a href="profile.jsp?id_util=<%=item.getCreateur().getId_util()%>"><%=item.getCreateur().getLogin()%></a></small>
                                            </span>
                                           
                                        </div>
                                        <div class="tags">
                                            <a href="#"><%=item.getVilleCiblee()%></a>
                                           
                                        </div>
                                    </div>
                                      <%} %>
                            
                            <%}else{ %>
                                <p>Aucune contributions.</p>
                                
                                <%}%>
                                </div>
                            </div>
                          
                            

                           
                            
                           
                            
                        </div>
                    </div>
               
                </section>
            </div>
        </section>
        
        <!-- ====== end portfolio-projects ====== -->


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
                        <small> <i class="bi bi-box-arrow-in-right me-2 pe-2 border-end"></i> S'identifier </small>
                    </a>
                    <a href="sign-up.jsp" class="btn rounded-pill hover-hindred fw-bold border-hindred" target="_blank">
                        <small> <i class="bi bi-person-plus-fill me-2 pe-2 border-end"></i> S'inscrire </small>
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
    <script src="assets/js/lib/jquery-ui.js"></script>
    <script src="assets/js/lib/jquery-migrate-3.0.0.min.js"></script>
    <script src="assets/js/lib/bootstrap.bundle.min.js"></script>
    <script src="assets/js/lib/wow.min.js"></script>
    <script src="assets/js/lib/jquery.fancybox.js"></script>
    <script src="assets/js/lib/lity.js"></script>
    <script src="assets/js/lib/swiper.min.js"></script>
    <script src="assets/js/lib/jquery.waypoints.min.js"></script>
    <script src="assets/js/lib/jquery.counterup.js"></script>
  
    <script src="assets/js/lib/mixitup.min.js"></script>
    <script src="assets/js/lib/scrollIt.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="assets/js/ourjs.js"></script>


    

</body>



</html>