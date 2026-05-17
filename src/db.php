<?php
	// Create connection to Oracle
	
	?>

<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {

  $id = 69;
  $imie = $_POST['imie'];
  $nazwisko = $_POST['nazwisko'];
  $adres = $_POST['adres'];
  $dataur = $_POST['dataur'];
  $datazap = $date = date('Y-m-d');




  $servername = "localhost";
  $username = "root";
  $password = "";
  $dbname = "ai1_lab4";


    try {
        $conn = new PDO("oci:dbname=//localhost/XEPDB1", 'biblioteka', 'biblioteka');
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        echo 'Connected to database';
    } catch(PDOException $e) {
        echo 'ERROR: ' . $e->getMessage();
    }
    $sql = "BEGIN INSERT_CZYTELNICY(:id, :imie, :nazwisko, :adres, TO_DATE(:dataur, 'YYYY-MM-DD'), TO_DATE(:datazap, 'YYYY-MM-DD'), 1); END;";
    $stmt = $conn->prepare($sql);

    $stmt->bindParam(':id', $id);
    $stmt->bindParam(':imie', $imie);
    $stmt->bindParam(':nazwisko', $nazwisko);
    $stmt->bindParam(':adres', $adres);
    $stmt->bindParam(':dataur', $dataur);
    $stmt->bindParam(':datazap', $datazap);
    $stmt->execute();


     echo "New record created successfully. <br>";
     $conn = null;
} else {
    echo "Method not supported. <br>";
}
