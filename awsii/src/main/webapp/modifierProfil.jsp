<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  
  <!-- Metas -->
  <meta charset="utf-8">   
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <meta name="author" content="" />

  <!-- Title  -->
  <title>awsii moroccan Platforme</title>

  <!-- Favicon -->
  <link rel="shortcut icon" href="assets/img/Hind-21-01.png" title="Favicon" sizes="16x16" />

 <!-- ====== bootstrap icons cdn ====== -->
   <link rel="stylesheet" href="assets/bootstrap/font/bootstrap-icons.css">

    <!-- bootstrap 5 -->
    <link rel="stylesheet" href="assets/css/lib/bootstrap.min.css">

  <!-- ====== font family ====== -->

  <link rel="stylesheet" href="assets/css/lib/all.min.css" />
 

  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .container {
      width: 850px;
      padding: 40px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: rgb(232, 230, 230);
      height: 620px; 
    }


    .form-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 10px;
    }

    .form-row label {
      width: 17%;
      margin-bottom: 15px;
      margin-top: 15px; margin-left:7px;
    }

    .form-row input,
    .form-row select {
      flex: 1;
    
      border-radius: 5px;
      border: 1px solid #ccc;
      padding: 6px;margin-right: 7px;
    }

    input[type="submit"] {
      display: block;
      margin-top: 20px;
      margin: 0 auto;
      width: 20%;
      height: 80px;background-color: #f0f0f0;
      align-self: center;
      height: 30px;
      border-radius: 6px; padding-bottom: 15px;
      border-color:white;
    }

    .profile-pic {
      position: relative;
      display: flex;
      justify-content: center;
      align-items: center;
      width: 100px;
      height: 100px;
      border-radius: 50%;
      background: linear-gradient(135deg, #fff 0%, #f0f0f0 100%);
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      text-align: center;
      line-height: 80px;
      overflow: hidden;
      backdrop-filter: blur(30px);
      -webkit-backdrop-filter: blur(30px); /* Safari support */
      opacity: 0.7;
      cursor: pointer;
      margin: 0 auto;
      margin-bottom: 15px;
    }

    .profile-pic input[type="file"] {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      opacity: 0;
      cursor: pointer;
    }

    .profile-pic i {
      color: var(--color-salmablueN);
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      font-size: 48px;
    }

    #profile-pic-preview {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      object-fit: cover;
      display: none;
      border-radius: 50%;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2 class="text-center color-black fs-159px mb-30">Modifier Profile :</h2>
    <form>
      <div class="col-lg-12 text-center">
        <div class="form-group mb-20">
          <label for="profile-pic" class="profile-pic">
            <input type="file" id="profile-pic" name="profile-pic" accept="image/*" style="display:none">
            <i class="bi bi-plus "></i>
            <img id="profile-pic-preview" src="#" alt="Profile Picture" style="display:none">
          </label>
        </div>
      </div>

      <div class="form-row">
        <label for="nom">Nom:</label>
        <input type="text" id="nom" name="nom">
        <label for="prenom">Prénom:</label>
        <input type="text" id="prenom" name="prenom">
      </div>
      <div class="form-row">
        <label for="login">Login:</label>
        <input type="text" id="login" name="login">
        <label for="password">Mot de passe:</label>
        <input type="password" id="password" name="password">
      </div>

      <div class="form-row">
        <label for="region">Région:</label>
        <select id="region" name="region">
          <option value="">Select Region</option>
          <option value="North America">North America</option>
          <option value="Europe">Europe</option>
          <option value="Asia">Asia</option>
          <option value="Africa">Africa</option>
        </select>
        <label for="country">Pays:</label>
        <select id="country" name="country">
          <option value="">Selectionner pays</option>
        </select>
      </div>

      <div class="form-row">
        <label for="city">Ville:</label>
        <select id="city" name="city">
          <option value="">Selectionner Ville</option>
        </select>
        <label for="linkedin">Profil LinkedIn:</label>
        <input type="text" id="linkedin" name="linkedin" pattern="^(https?:\/\/)?(www\.)?linkedin\.com\/[a-zA-Z0-9]+\/?$" placeholder="Entrer a LinkedIn profile URL">
      </div>

      <div class="form-row">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email">
        <label for="phone">Numéro de téléphone:</label>
        <input type="text" id="phone" name="phone" pattern="[0-9]+" placeholder="Enter numero de thelephone">
      </div>

      <input type="submit" value="enregister ">
    </form>
  </div>

  <script>
    const regionSelect = document.getElementById("region");
    const countrySelect = document.getElementById("country");
    const citySelect = document.getElementById("city");
    const profilePicInput = document.getElementById("profile-pic");
    const profilePicPreview = document.getElementById("profile-pic-preview");

    const data = {
      "North America": {
        countries: ["United States", "Canada", "Mexico"],
      },
      Africa: {
        countries: ["Morocco", "Tunis", "Egypt"],
      },
      Europe: {
        countries: ["Germany", "France", "United Kingdom"],
      },
      Asia: {
        countries: ["China", "Japan", "India"],
      },
      "United States": {
        cities: ["New York", "Los Angeles", "Chicago"],
      },
      Canada: {
        cities: ["Toronto", "Vancouver", "Montreal"],
      },
      Mexico: {
        cities: ["Mexico City", "Guadalajara", "Monterrey"],
      },
      Germany: {
        cities: ["Berlin", "Munich", "Hamburg"],
      },
      France: {
        cities: ["Paris", "Marseille", "Lyon"],
      },
      "United Kingdom": {
        cities: ["London", "Manchester", "Birmingham"],
      },
      China: {
        cities: ["Beijing", "Shanghai", "Guangzhou"],
      },
      Japan: {
        cities: ["Tokyo", "Osaka", "Kyoto"],
      },
      India: {
        cities: ["Mumbai", "Delhi", "Bangalore"],
      },
      Morocco: {
        cities: ["Casablanca", "Tanger", "Marrakech"],
      },
    };

    regionSelect.addEventListener("change", () => {
      const selectedRegion = regionSelect.value;
      countrySelect.innerHTML = "<option value=''>Select Country</option>";
      citySelect.innerHTML = "<option value=''>Select City</option>";

      if (selectedRegion) {
        const countries = data[selectedRegion].countries;
        countries.forEach((country) => {
          const option = document.createElement("option");
          option.value = country;
          option.textContent = country;
          countrySelect.appendChild(option);
        });
      }
    });

    countrySelect.addEventListener("change", () => {
      const selectedCountry = countrySelect.value;
      citySelect.innerHTML = "<option value=''>Select City</option>";

      if (selectedCountry) {
        const cities = data[selectedCountry].cities;
        cities.forEach((city) => {
          const option = document.createElement("option");
          option.value = city;
          option.textContent = city;
          citySelect.appendChild(option);
        });
      }
    });

    profilePicInput.addEventListener("change", (event) => {
      const file = event.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = (e) => {
          profilePicPreview.src = e.target.result;
          profilePicPreview.style.display = "block";
        };
        reader.readAsDataURL(file);
      }
    });
  </script>
</body>
</html>