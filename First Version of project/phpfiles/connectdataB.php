<?php

 //Include the constants file
 include('Constants.php');
    
 //create a function to connect to the database
 function connectToDb()
 {
     //Initialize our connection object
     $mysqli = new mysqli(HOST_NAME, HOST_USERNAME, HOST_PASSWORD, DB_NAME);
     
     //Check if our connection was successful
     if(mysqli_connect_errno())
     {
         echo "Unable to connect to database". mysqli_error($mysqli);
     }
     else
     {
         return $mysqli;
     }
 }
 
 function disconnectDb($mysqli)
 {
     $mysqli->close();
 }
?>