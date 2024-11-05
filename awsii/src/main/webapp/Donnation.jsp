<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="dao.CredentialsDAO"%>
<%@page import="dao.ICredentialsDao"%>
<%@page import="entities.Utilisateur"%>
<!DOCTYPE html>
<html>
<head>
    <title> awsii moroccan Platforme</title>
     <link rel="shortcut icon" href="assets/img/Hind-21-01.png" title="Favicon" sizes="16x16" />
    <script src="https://checkout.stripe.com/checkout.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f1f1f1;
        }

        .card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 40px;
            text-align: center;
            width: 400px;
            max-width: 100%;
        }
        

        h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }

        p {
            margin-bottom: 20px;
            font-size: 16px;
        }

        input[type="text"],select {
            width: 100%;
            padding: 10px; 
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background: url('https://cdn.jsdelivr.net/gh/ckrack/boxicons/css/boxicons.min.css') no-repeat right #fff;
            background-position-x: 100%;
        }

        button {
            padding: 12px 24px;
            background-color: #9c152c;
            color: white;
            border: none;
            cursor: pointer;
            width: 100%;
            border-radius: 6px;
            font-size: 16px;
        }

        button:hover {
            background-color: #9c152c;
        }
      

    </style>
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
    <div class="card">
        <h2>Effectuer Paiement</h2>
        <p>Entrez le montant que vous souhaitez donner :</p>
        
        <form  action="addDonnation"  method ="post" onsubmit=" payWithStripe();">
            <input type="text" name="mantant" id="donationAmount" placeholder="Montant" pattern="^\d+(\.\d{1,2})?$" required />
            <select id="bankSelect" name="banke"  required>
                <option value="">Sélectionnez une banque</option>
                <option value="bank1">Banque 1</option>
                <option value="bank2">Banque 2</option>
                <option value="bank3">Banque 3</option>
            </select>
             <input type="text" name="id_util"  value="<%=moi.getId_util()%>" style="display:none">
             <input type="text" name="id_poste"  value="<%=Integer.parseInt(request.getParameter("id_poste"))%>" style="display:none">
           
            <input type="submit" value="Payer"/>
        </form>
    </div>

    <script>
        function payWithStripe() {
            var amount = document.getElementById("donationAmount").value;
           // var bank = document.getElementById("bankSelect").value;

            if (!amount ||!bank) {
                alert("Veuillez saisir le montant et sélectionner une banque pour effectuer le paiement.");
                return;
            }

            
        }
    </script>
</body>
</html>