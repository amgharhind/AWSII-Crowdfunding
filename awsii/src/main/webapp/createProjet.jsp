

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@page import="dao.CredentialsDAO"%>
<%@page import="dao.ICredentialsDao"%>
<%@page import="entities.Utilisateur"%>

<!DOCTYPE html>
<html lang="fr">


<head>
<script >
function previewProfilePic(event, previewId) {
    var input = event.target;

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            var previewImg = document.getElementById(previewId);

            previewImg.src = e.target.result;
            previewImg.style.display = "block";
        };

        reader.readAsDataURL(input.files[0]);
    }
}
//Event listeners for file inputs
document.getElementById("poste-pic-preview1").addEventListener("change", function(event) {
    previewProfilePic(event, 'poste-pic-preview1');
});

document.getElementById("poste-pic-preview2").addEventListener("change", function(event) {
    previewProfilePic(event, 'poste-pic-preview2');
});

document.getElementById("poste-pic-preview3").addEventListener("change", function(event) {
    previewProfilePic(event, 'poste-pic-preview3');
});

</script>
  <!--<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
    <!-- Metas -->
    <meta charset="UTF-8">
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
    <link rel="stylesheet" href="assets/css/ourStyle.css" />
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
                <img src="assets/img/LOGO TWIL (1)/logo.png" alt="">
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
                            <li><a  href="createProjet.jsp?id_util=<%=moi.getId_util()%>" class="dropdown-item"> Créer  PROJET </a></li>
                            <%}%>
                            <li><a class="dropdown-item" href="#"> ABOUT us</a></li>
                            <li><a class="dropdown-item" href="#"> FAQ </a></li>
                            <li><a class="dropdown-item" href="sign-in.jsp"> SIGN IN </a></li>
                            <li><a class="dropdown-item" href="sign-in.jsp"> SIGN UP </a></li>
                          
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
        <br>
<br>
        <section class="contact section-padding pt-0 style-6">
            <div class="container">
                <h1><p class="text-center fw-bold fs-2" > Créer  un Projet <span  class="color-hindred">AWSII</span></p></h1> <br>
                <br>
                <div class="content">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <form action="addProject" class="form" method="post" enctype="multipart/form-data" >

                               
                                <h3 class="text-center color-black fs-159px mb-30">Les champs sont obligatoire!!</h3>
                                <div class="row">
                                    <div class="col-lg-12 text-center ">
                                        <div class="form-group mb-20 d-flex justify-content-between"> 
                                        
                                        <label  class="poste-pic">
                                            <input type="file"  name="poste-pic1" accept="image/*" style="display:none" onchange="previewProfilePic(event, 'poste-pic-preview1')" >
                                            <i class="bi bi-plus "></i>
                                            <img id="poste-pic-preview1" src="#" alt="Profile Picture" style="display:none">
                                          </label>
                                           <label  class="poste-pic">
                                            <input type="file"  name="poste-pic2" accept="image/*" style="display:none" onchange="previewProfilePic(event, 'poste-pic-preview2')" >
                                            <i class="bi bi-plus "></i>
                                            <img id="poste-pic-preview2" src="#" alt="Profile Picture" style="display:none">
                                          </label>
                                           <label  class="poste-pic">
                                            <input type="file"  name="poste-pic3" accept="image/*" style="display:none" onchange="previewProfilePic(event, 'poste-pic-preview3')" >
                                            <i class="bi bi-plus "></i>
                                            <img id="poste-pic-preview3" src="#" alt="Profile Picture" style="display:none">
                                          </label>
                                
                                    </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">  
                                            <input type="text" name="title" class="form-control" placeholder="titre" required>
                                        </div>
                                    </div>
                                    
                                    
                                   
                                    
                                    
                                    <div class="col-lg-6">
                                <div class="form-group mb-20">
                                <input type="text" id="price" class="form-control" name="price" placeholder="Entrer le prix" required>
                                  <!--   <div id="priceInvalid" class="invalid-feedback"></div>-->
                                </div>
                                </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">
                                           <select id="city" name="city" class="form-control border-0 rounded-5 glass-effect">
    <option value="">---Sélectionnez une ville---</option>
    <option value="agadir">Agadir</option>
    <option value="ait-melloul">Ait Melloul</option>
    <option value="ait-baha">Ait Baha</option>
    <option value="ait-ourir">Ait Ourir</option>
    <option value="al-hoceima">Al Hoceima</option>
    <option value="azrou">Azrou</option>
    <option value="ben-guerir">Ben Guerir</option>
    <option value="beni-mellal">Beni Mellal</option>
    <option value="berrechid">Berrechid</option>
    <option value="bouznika">Bouznika</option>
    <option value="casablanca">Casablanca</option>
    <option value="chefchaouen">Chefchaouen</option>
    <option value="dakhla">Dakhla</option>
    <option value="el-jadida">El Jadida</option>
    <option value="errachidia">Errachidia</option>
    <option value="essaouira">Essaouira</option>
    <option value="fes">Fes</option>
    <option value="figuig">Figuig</option>
    <option value="fnideq">Fnideq</option>
    <option value="guelmim">Guelmim</option>
    <option value="guercif">Guercif</option>
    <option value="ifrane">Ifrane</option>
    <option value="imintanoute">Imintanoute</option>
    <option value="inezgane">Inezgane</option>
    <option value="jerada">Jerada</option>
    <option value="kelaa-des-sraghna">Kelaâ des Sraghna</option>
    <option value="kenitra">Kenitra</option>
    <option value="khemisset">Khemisset</option>
    <option value="khenifra">Khenifra</option>
    <option value="khouribga">Khouribga</option>
    <option value="ksar-el-kebir">Ksar el-Kebir</option>
    <option value="larache">Larache</option>
    <option value="marrakech">Marrakech</option>
    <option value="martil">Martil</option>
    <option value="meknes">Meknes</option>
    <option value="midelt">Midelt</option>
    <option value="mohammedia">Mohammedia</option>
    <option value="nador">Nador</option>
    <option value="ouarzazate">Ouarzazate</option>
    <option value="ouazzane">Ouazzane</option>
    <option value="oujda">Oujda</option>
    <option value="rabat">Rabat</option>
    <option value="safi">Safi</option>
    <option value="saidia">Saidia</option>
    <option value="sidi-kacem">Sidi Kacem</option>
    <option value="sidi-slimane">Sidi Slimane</option>
    <option value="sidi-yahia-el-gharb">Sidi Yahia El Gharb</option>
    <option value="skhirat">Skhirat</option>
    <option value="tangier">Tangier</option>
    <option value="tan-tan">Tan-Tan</option>
    <option value="taourirt">Taourirt</option>
    <option value="taroudant">Taroudant</option>
    <option value="taza">Taza</option>
    <option value="tetouan">Tetouan</option>
    <option value="tiznit">Tiznit</option>
    <option value="youssoufia">Youssoufia</option>
    <option value="zagora">Zagora</option>
    <!-- Add more cities here -->
</select>

                                        </div>
                                    </div>
                                    
                                   
                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">  
                                            <select id="cardTypeSelect" name="categorie" class="form-control border-0 rounded-5  glass-effect" >
                                                 <option value="">---Choisir une catégorie---</option>
        <option value="Projet d'entreprise">Projets d'entreprise</option>
        <option value="Projet culturel">Projets culturels</option>
        <option value="Projet social">Projets sociaux</option>
        <option value="Projet environnement">Projet d'environnement</option>
                                                <!-- Add more card types here -->
                                              </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">
                                            <input type="text" id="datepicker" name="dateExp" placeholder="Sélectionnez la date d'expiration" class="form-control"  >
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group mb-20">
                                           <textarea id="description" name="description" cols="90" rows="6" placeholder="Donner une description .... " required></textarea>
                                           
                                        </div>
                                    </div>
                                    
                                    
                                    
                                    <div class="col-lg-12 text-center">
                                        <input type="text" name="id_util"  value="<%=moi.getId_util()%>" style="display:none">
                                    </div>
                                  
                                   
                                    <div class="col-lg-12 text-center">
                                        <input type="submit" value="Crée le  Projet" id="submitButton" class="btn rounded-pill bg-hindred fw-bold text-white text-light fs-36px">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                   <img src="assets/img/icons/contact_a.png" alt="" class="contact_a">
                   <!-- <img src="assets/img/icons/users.png" alt="" class="contact_message">-->
                    
                </div>
            </div>
        </section>
        <!-- ====== end contact page ====== -->

        <!-- ====== start contact page ====== -->
       
        <!-- ====== start contact page ====== -->
   
    <!--End-Contents-->

    <!-- ====== start footer ====== -->
 <footer class="style-4 mt-0 pt-100">
        <div class="container">
            <div class="section-head text-center style-4">
                <h2 class="mb-10"> Bienvenue sur  <span> AWSII </span> </h2>
                
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
    <script src="assets/js/lib/jquery-ui.min.js"></script>
    <!-- <script src="assets/js/lib/pace.js"></script> -->

    <script src="assets/js/lib/scrollIt.min.js"></script>
         <script src="assets/js/ourjs.js"></script>
    
       <script src="assets/js/main.js"></script>

</body>


</html>