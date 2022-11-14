<?php

include 'requete/conn.php';


?>
<?php
   session_start();
   @$login=$_POST["login"];
   @$pass=md5($_POST["pass"]);
   @$valider=$_POST["valider"];
   $erreur="";
   if(isset($valider)){
      include("connexion.php");
      $sel=$pdo->prepare("select * from users where login=? and pass=? limit 1");
      $sel->execute(array($login,$pass));
      $tab=$sel->fetchAll();
      if(count($tab)>0){
         $_SESSION["prenomNom"]=ucfirst(strtolower($tab[0]["prenom"])).
         " ".strtoupper($tab[0]["nom"]);
		  $_SESSION["prenom"]=ucfirst(strtolower($tab[0]["prenom"]));
		  $_SESSION["nom"]=ucfirst(strtolower($tab[0]["nom"]));
		  $_SESSION["login"]=ucfirst(strtolower($tab[0]["login"]));
         $_SESSION["autoriser"]="oui";
		 $_SESSION["prof"]=ucfirst(strtolower($tab[0]["perm"]));
		  $_SESSION["classeid"]=ucfirst(strtolower($tab[0]["classeid"]));
         header("location:prof/index.php");
      }
      else
         $erreur="Mauvais login ou mot de passe!";
   }
?>

<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title>formulaire de connexion en HTML | sonoretech</title>
      <link rel="stylesheet" href="style/css/style.css">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
   <body>
      <div class="wrapper">
         <div class="title-text">
            <div class="title login">
					Se connecter
            </div>
            <div class="title signup">
               S'inscrire
            </div>
         </div>
		  
		  
		  
		  
		  
         <div class="form-container">
            <div class="slide-controls">
               <input type="radio" name="slide" id="login" checked>
               <input type="radio" name="slide" id="signup">
               <label for="login" class="slide login">Connexion</label>
               <label for="signup" class="slide signup">Inscription</label>
               <div class="slider-tab"></div>
            </div>
			 
			 
		 
			 
			 
            <div class="form-inner" >
				
				 
				
				
				<div class="erreur"><?php echo $erreur ?></div>
               <form form name="fo" method="post" action="login.php" class="login">
                  <div class="field">
                      <input type="text" name="login" placeholder="Login" /><br />
                  </div>
                  <div class="field">
                     <input type="password" name="pass" placeholder="Mot de passe" /><br />
                  </div>
                  <div class="pass-link">
                     <a href="#">Mot de passe oublié ?</a>
                  </div>
                  <div class="field btn">
                     <div class="btn-layer"></div>
                     <input type="submit" name="valider" value="S'authentifier" />
                  </div>
                  <div class="signup-link">
                     Pas encore inscrit? <a href="">S'inscrire maintenant</a>
                  </div>
               </form>
 
 
				
	 
				
				
				<?php
   session_start();
   @$nom=$_POST["nom"];
   @$prenom=$_POST["prenom"];
   @$login=$_POST["login"];
   @$pass=$_POST["pass"];
   @$repass=$_POST["repass"];
   @$valider=$_POST["valider"];
   $erreur="";
   if(isset($valider)){
      if(empty($nom)) $erreur="Nom laissé vide!";
      elseif(empty($prenom)) $erreur="Prénom laissé vide!";
      elseif(empty($prenom)) $erreur="Prénom laissé vide!";
      elseif(empty($login)) $erreur="Login laissé vide!";
      elseif(empty($pass)) $erreur="Mot de passe laissé vide!";
      elseif($pass!=$repass) $erreur="Mots de passe non identiques!";
      else{
         include("connexion.php");
         $sel=$pdo->prepare("select id from users where login=? limit 1");
         $sel->execute(array($login));
         $tab=$sel->fetchAll();
         if(count($tab)>0)
            $erreur="Login existe déjà!";
         else{
            $ins=$pdo->prepare("insert into users(nom,prenom,login,pass) values(?,?,?,?)");
            if($ins->execute(array($nom,$prenom,$login,md5($pass))))
               header("location:login.php");
         }   
      }
   }
?>
				<div class="erreur"><?php echo $erreur ?></div>
               <form name="fo" method="post" action="login.php" class="signup">
                  <div class="field">
                     <input type="text" name="nom" placeholder="Nom" value="<?php echo $nom?>" /><br /> </div>
				   <div class="field">
					  <input type="text" name="prenom" placeholder="Prénom" value="<?php echo $prenom?>" /><br />
				   </div>
				   <div class="field">
					   <input type="text" name="login" placeholder="Login" value="<?php echo $login?>" /><br />
                  </div>
                  <div class="field">
                    <input type="password" name="pass" placeholder="Mot de passe" /><br />
                  </div>
                  <div class="field">
                      <input type="password" name="repass" placeholder="Confirmer Mot de passe" /><br />
                  </div>
                  <div class="field btn">
                     <div class="btn-layer"></div>
                      <input type="submit" name="valider" value="S'inscrire" />
                  </div>
               </form>
            </div>
         </div>
      </div>
      <script>
         const loginText = document.querySelector(".title-text .login");
         const loginForm = document.querySelector("form.login");
         const loginBtn = document.querySelector("label.login");
         const signupBtn = document.querySelector("label.signup");
         const signupLink = document.querySelector("form .signup-link a");
         signupBtn.onclick = (()=>{
           loginForm.style.marginLeft = "-50%";
           loginText.style.marginLeft = "-50%";
         });
         loginBtn.onclick = (()=>{
           loginForm.style.marginLeft = "0%";
           loginText.style.marginLeft = "0%";
         });
         signupLink.onclick = (()=>{
           signupBtn.click();
           return false;
         });
      </script>
   </body>
</html>