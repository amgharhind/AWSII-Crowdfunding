
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr">


<head>
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
</head>

<body>

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
                       <a class="nav-link active dropdown-toggle" href="home_principale.jsp" id="navbarDropdown1" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            Acceuil
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown1">
                           <li><a class="dropdown-item" href="liste-projets.jsp"> PROJETS </a></li>
                           
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
                     
                        <a href="sign-in.jsp" class="btn rounded-pill brd-gray hover-hindred sm-butn fw-bold">
                            <span>S'identifier <i class="bi bi-arrow-right ms-1"></i> </span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </nav>
        <br>
<br>
        <section class="contact section-padding pt-0 style-6">
            <div class="container">
                <h1><p class="text-center fw-bold fs-2" > Création d'un compte <span  class="color-hindred">AWSII</span></p></h1> <br>
                <br>
                <div class="content">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <form action="signup" class="form" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">

                               
                                <h3 class="text-center color-black fs-159px mb-30">Les champs sont obligatoire!!</h3>
                                <div class="row">
                                    <div class="col-lg-12 text-center ">
                                        <div class="form-group mb-20"> 
                                      
                                              
                                        <label for="profile-pic" class="profile-pic">
                                            <input type="file" id="profile-pic" name="profile-pic" accept="image/*" style="display:none">
                                            <i class="bi bi-plus "></i>
                                            <img id="profile-pic-preview" src="#" alt="Profile Picture" style="display:none">
                                          </label>
                                
                                    </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">  
                                            <input type="text" name="name" class="form-control" placeholder="Nom" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">  
                                            <input type="text" name="prenom" class="form-control" placeholder="Prenom" required>
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">
                                            <input type="text"   name="username" class="form-control" placeholder="Username" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">
                                            <input type="password" name="password" id="password" class="form-control" pattern="^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$"
                                            
                                            title="Le mot de passe doit inclure au moins un chiffre, un caractÃ¨re spÃ©cial, une lettre minuscule, une lettre majuscule et avoir une longueur d'au moins 8 caractÃ¨res."
                                            placeholder="mot de passe" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">
                                            <input type="password" id="confirmPassword" class="form-control" placeholder="confirmer mot de passe" required>
                                            <small id="passwordError"  style="color: red; display: none;">Les mots de passe ne correspondent pas.</small>
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">  
                                            <input type="text"   class="form-control" name="age" placeholder="entrer votre age" required>
                                            <div id="ageValidationMessage" ></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">
                                            <select id="regionSelect" name="regionSelect" class="form-control border-0 rounded-5  glass-effect" onchange="populateCountries()">
                                                <option value="">Sélectionnez une région</option>
                                                <option value="africa">Africa</option>
                                                <option value="europe">Europe</option>

                                                <!-- Add more regions here -->
        
                                              </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">
                                            <select id="countrySelect" name="countrySelect" class="form-control border-0 rounded-5  glass-effect" onchange="populateCities()">
                                                <option value="">Choisissez un pays</option>
                                               
                                                <!-- Add more countries here -->
                                              </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">
                                            <select id="citySelect" name="citySelect" class="form-control border-0 rounded-5  glass-effect" >
                                                <option value="">Sélectionnez une ville</option>
                                            
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">  
                                            <select id="cardTypeSelect" name="cardTypeSelect"class="form-control border-0 rounded-5  glass-effect" >
                                                <option value="visa">Visa</option>
                                                <option value="mastercard">Mastercard</option>
                                                <option value="amex">American Express</option>
                                                <!-- Add more card types here -->
                                              </select>
                                        </div>
                                    </div>
                                    
                                   
                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">
                                            <input type="text" id="pinInput"  name="pin" class="form-control" placeholder="Entrez votre PIN" pattern="\d{4}" title="PIN must be a 4-digit number">
                                        </div>
                                    </div>




                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">

                                            
                                                
                                            
                                            <input type="text" id="ribInput" name="rib" placeholder="Saisissez votre RIB" class ="form-control" pattern="[0-9]{24}" title="PIN must be a 24-digit number"> 
                                            <div id="validationMessage"></div>
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">
                                            <input type="text" id="datepicker" name="dateExp" placeholder="Sélectionnez la date d'expiration" class="form-control"  >
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">
                                            <input type="text" id="phoneNumberInput" name="tel" class="form-control" placeholder="Entrez votre numéro de téléphone">
                                           
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-20">
                                            <input type="email" id="gmailInput" name="gmail" class="form-control" placeholder="Entrez votre adresse Gmail" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}">
                                <div id="gmailValidationMessage"></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group  mb-20">
                                            <input type="text" id="linkedinInput" name="linkdin" class="form-control" placeholder="Enter your LinkedIn profile link" pattern="^(https?://)?([a-z]+\.)?linkedin\.com/.*$"  class="form-control">
                                           
                                 
                                            <div id="linkedinValidationMessage" ></div>
                                        </div>
                                    </div>
                                    
                                  
                                    <div class="col-lg-12 text-center">
                                        <div class="form-check d-inline-flex mt-30 mb-30">
                                            <input class="form-check-input me-2 mt-0" type="checkbox" value="" id="flexCheckDefault">
                                            <label class="form-check-label small" for="flexCheckDefault">
                                                En soumettant, j'accepte les termes et conditions <a href="policies.jsp" target ="blank_ "class="text-decoration-underline" required>les termes et conditions</a>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 text-center">
                                        <input type="submit" value="Valider" id="submitButton" class="btn rounded-pill bg-hindred fw-bold text-white text-light fs-36px">
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
                <p>Prét a commencer? Rejoignez des milliers d'autres aujourd'hui.</p>
               
                <div class="d-flex align-items-center justify-content-center mt-50">
                    <a href="#" class="btn rounded-pill bg-hindred fw-bold text-white me-4" target="_blank">
                        <small> <i class="bi bi-box-arrow-in-right me-2 pe-2 border-end"></i> S'identifier </small>
                    </a>
                    <a href="" class="btn rounded-pill hover-hindred fw-bold border-hindred" target="_blank">
                        <small> <i class="bi bi-person-plus-fill me-2 pe-2 border-end"></i> S'inscrire </small>
                    </a>
                </div>
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
       <script src="assets/js/main.js"></script>
    
    

</body>


</html>