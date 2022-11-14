<?php
   try{
      $pdo=new PDO("mysql:host=localhost;dbname=exo","user","vi0T*3y33");
   }
   catch(PDOException $e){
      echo $e->getMessage();
   }
?> 