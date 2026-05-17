<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Biblioteka - Dodaj Zamówienie</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Biblioteka</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="czytelnicy.php">Czytelnicy</a></li>
                <li class="nav-item"><a class="nav-link" href="pracownicy.php">Pracownicy</a></li>
                <li class="nav-item"><a class="nav-link" href="zamowienia.php">Zamówienia</a></li>
                <li class="nav-item"><a class="nav-link" href="wypozyczenia.php">Wypożyczenia</a></li>
                <li class="nav-item"><a class="nav-link" href="ksiazki.php">Książki</a></li>
                <li class="nav-item"><a class="nav-link" href="czasopisma.php">Czasopisma</a></li>
                <li class="nav-item"><a class="nav-link" href="artykuly.php">Artykuły</a></li>
                <li class="nav-item"><a class="nav-link" href="kary.php">Kary</a></li>
            </ul>
            <div>
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </div>
</nav>
<div id="inne" class="container mt-5 mb-3">
    <div class="row d-flex justify-content-center">
        <div class="col-sm-12 col-md-6">
            <h2>Dodaj nowe zamówienie</h2>
            <form method="POST" action="#">
                <div class="form-group mt-2 mb-3">
                    <label for="czytelnik_id">ID Czytelnika</label>
                    <input type="number" class="form-control" name="czytelnik_id" id="czytelnik_id" placeholder="123">
                </div>
                <div class="form-group mb-3">
                    <label for="data_zamowienia">Data Zamówienia</label>
                    <input type="date" class="form-control" name="data_zamowienia" id="data_zamowienia">
                </div>
                <div class="form-group mb-3">
                    <label for="status">Status</label>
                    <input type="text" class="form-control" name="status" id="status" placeholder="W trakcie realizacji">
                </div>
                <div class="form-group mb-3">
                    <label for="ksiazki">Wybierz Książki</label>
                    <select class="form-control" name="ksiazki[]" id="ksiazki" multiple>
                        <?php
                        require('connection.php');
                        $sql = "SELECT ID, NAZWA FROM KSIAZKI";
                        $stmt = oci_parse($conn, $sql);

                        if (!oci_execute($stmt)) {
                            $error = oci_error($stmt);
                            echo "SQL execution failed: " . $error['message'];
                            exit; 
                        }
                        
                        while ($row = oci_fetch_assoc($stmt)) {
                            echo "<option value='" . $row['ID'] . "'>" . $row['NAZWA'] . "</option>";
                        }
                        
                        oci_free_statement($stmt);
                        ?>
                    </select>
                </div>
                <div class="form-group mb-3">
                    <label for="ksiazki">Wybierz Czasopisma</label>
                    <select class="form-control" name="czasopisma[]" id="czasopisma" multiple>
                        <?php

                        require('connection.php');
                        $sql = "SELECT ID, NAZWA, NUMERWYDANIA FROM CZASOPISMA";
                        $stmt = oci_parse($conn, $sql);

                        if (!oci_execute($stmt)) {
                            $error = oci_error($stmt);
                            echo "SQL execution failed: " . $error['message'];
                            exit; 
                        }
                        
                        while ($row = oci_fetch_assoc($stmt)) {
                            echo "<option value='" . $row['ID'] . "'>" . $row['NAZWA'] ." " .$row['NUMERWYDANIA'] . "</option>";
                        }
                        
                        oci_free_statement($stmt);
                        ?>
                    </select>
                </div>
               
                <div class="form-group mb-3 d-flex justify-content-center">
                    <input class="btn btn-outline-success" type="submit" value="Wyślij">
                </div>
            </form>
        </div>
    </div>
</div>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" and isset($_POST['czytelnik_id'])) {
    $czytelnik_id = $_POST['czytelnik_id'];
    $data_zamowienia = $_POST['data_zamowienia'];
    $status = $_POST['status'];
    if(isset($_POST['ksiazki'])){
        $ksiazki = $_POST['ksiazki'];
    }
    if(isset($_POST['czasopisma'])){
        $czasopisma = $_POST['czasopisma'];
    }


    


    $sql = "BEGIN :ilosc := czytelnik_pkg.liczba_wypozyczonych_pozycji(:czytelnik_id); END;";
    
    $stmt = oci_parse($conn, $sql);
    oci_bind_by_name($stmt, ':ilosc', $ilosc, 32);
    oci_bind_by_name($stmt, ':czytelnik_id', $czytelnik_id, -1, SQLT_INT);
    oci_execute($stmt);
    
    oci_fetch($stmt);
    
    oci_close($conn);
    //Warning: oci_fetch(): ORA-24374: define not done before fetch or execute and fetch in C:\xampp\htdocs\gui\insertZamowienie.php on line 125
    $c = $ilosc;
    if(isset($_POST['ksiazki'])){
       $c+=count($ksiazki);
    }
    if(isset($_POST['czasopisma'])){
        $c+=count($czasopisma);
    }

    echo $c;

    require('connection.php');
    if(isset($ksiazki) || isset($czasopisma)){
    $sql = "BEGIN zamowienia_pkg.INSERT_ZAMOWIENIE(:czytelnik_id, TO_DATE(:data_zamowienia, 'YYYY-MM-DD'), :status, :zamowienie_id); END;";
        
        $stmt = oci_parse($conn, $sql);
        oci_bind_by_name($stmt, ':czytelnik_id', $czytelnik_id);
        oci_bind_by_name($stmt, ':data_zamowienia', $data_zamowienia);
        oci_bind_by_name($stmt, ':status', $status);
        oci_bind_by_name($stmt, ':zamowienie_id', $zamowienie_id, -1, SQLT_INT);


        if (!oci_execute($stmt)) {
            throw new Exception(oci_error($stmt)['message']);
        }
    }
    else{
        throw new Exception("Proszę wybrać książki lub czasopisma");
    }
        if(isset($ksiazki)){
        foreach ($ksiazki as $ksiazka_id) {
            $sql = "BEGIN zamowienia_pkg.insert_ksiazka(:zamowienie_id,:ksiazka_id);END;";
            $stmt = oci_parse($conn, $sql);
            oci_bind_by_name($stmt, ':zamowienie_id', $zamowienie_id);
            oci_bind_by_name($stmt, ':ksiazka_id', $ksiazka_id);


            if (!oci_execute($stmt)) {
                throw new Exception(oci_error($stmt)['message']);
            }
        }
    }
        if(isset($czasopisma)){
        foreach ($czasopisma as $czasopismo_id) {
          $sql = "BEGIN zamowienia_pkg.insert_czasopismo(:zamowienie_id, :czasopismo_id); END;";
          $stmt = oci_parse($conn, $sql);
          oci_bind_by_name($stmt, ':zamowienie_id', $zamowienie_id);
          oci_bind_by_name($stmt, ':czasopismo_id', $czasopismo_id);

          if (!oci_execute($stmt)) {
              throw new Exception(oci_error($stmt)['message']);
          }
      }
    }

        
        echo "Zamówienie dodane.";
    

    oci_free_statement($stmt);
    oci_close($conn);
}
?>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
