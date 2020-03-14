<?php
class Validation{
    
    public function verifyusername($username)
    {
        //Create a connection instance
        $mysqli = connectToDb();
        
        $query = "SELECT Username FROM myusers "
                . "WHERE Username='".$username."'";
        $result =  $mysqli->query($query);
        if($result->num_rows > 0)
        {
            //This means that the username already exists
            return false;
        }
        else
        {
            return true;
        }
    }
}
?>