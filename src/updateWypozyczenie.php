<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Biblioteka</title>
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
                <li class="nav-item">
                    <a class="nav-link" href="czytelnicy.php">Czytelnicy</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="pracownicy.php">Pracownicy</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="zamowienia.php">Zamówienia</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="wypozyczenia.php">Wypożyczenia</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ksiazki.php">Książki</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="czasopisma.php">Czasopisma</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="artykuly.php">Artykuły</a>
                </li>
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
<?php
require('connection.php');


$ID = $_POST['update'];

$sql = "SELECT * FROM WYPOZYCZENIA WHERE ID = :id";
$stmt = oci_parse($conn, $sql);

oci_bind_by_name($stmt, ':id', $ID);

if (!oci_execute($stmt)) {
    $e = oci_error($stmt);
    throw new Exception($e['message']);
}

$result = [];
while ($row = oci_fetch_assoc($stmt)) {
    $result[] = $row;
}

oci_free_statement($stmt);
oci_close($conn);

?>
<div id="inne" class="container mt-5 mb-3">
    <div class="row d-flex justify-content-center">
        <div class="col-sm-12 col-md-6">
            <h2>Zaktualizuj dane wypożyczenia</h2>
            <form method="POST" action="updateWypozyczenie.php">

                <input type="hidden" class="form-control" name= "update" id="update"
                       value=<?php echo $ID?>>
                <div class="form-group mt-2 mb-3">
                    <label for="zamowienieid">ID Zamówienia</label>
                    <input type="number" class="form-control" name= "zamowienieid" id="zamowienieid"
                           value="<?php echo $result[0]['ZAMOWIENIEID']?>">
                </div>
                <div class="form-group mb-3">
                    <label for="pracownikid">ID Pracownika</label>
                    <input type="number" class="form-control" name= "pracownikid" id="pracownikid" value="<?php echo $result[0]['PRACOWNIKID']?>">
                </div>
                <div class="form-group mb-3">
                    <label for="datawypozyczenia">Data wypożyczenia</label>
                    <input type="date" name= "datawypozyczenia"class="form-control"  id="datawypozyczenia" value="<?php  $dataWypozyczenia = $result[0]['DATAWYPOZYCZENIA']; $dataWypozyczeniaFormatted = date('Y-m-d', strtotime($dataWypozyczenia)); echo $dataWypozyczeniaFormatted?>">                                                                               
                </div>
                <div class="form-group mb-3">
                    <label for="datazwrotu">Data zwrotu</label>
                    <input type="date" name= "datazwrotu" class="form-control"  id="datazwrotu" value="<?php  $dataZwrotu = $result[0]['DATAZWROTU']; $dataZwrotuFormatted = date('Y-m-d', strtotime($dataZwrotu)); echo $dataZwrotuFormatted?>">                                                 
                </div>
                <div class="form-group mb-3 d-flex justify-content-center">
                    <input class="btn btn-outline-success" type="submit" value="wyślij">
                </div>
            </form>
        </div>
    </div>

</div>
<?php

if($_SERVER['REQUEST_METHOD'] == "POST" and isset($_POST['zamowienieid']))
{
    require('connection.php');
    $pracownikid = $_POST['pracownikid'];
    $datawypozyczenia = $_POST['datawypozyczenia'];
    $datazwrotu = $_POST['datazwrotu'];
    $zamowienieid = $_POST['zamowienieid'];
    $ID = $_POST['update'];


    $sql = "BEGIN wypozyczenie_pkg.UPDATE_WYPOZYCZENIE(:id, :zamowienieid, :pracownikid, TO_DATE(:datawypozyczenia, 'YYYY-MM-DD'), TO_DATE(:datazwrotu, 'YYYY-MM-DD')); END;";
    $stmt = oci_parse($conn, $sql);

    oci_bind_by_name($stmt, ':id', $ID);
    oci_bind_by_name($stmt, ':zamowienieid', $zamowienieid);
    oci_bind_by_name($stmt, ':pracownikid', $pracownikid);
    oci_bind_by_name($stmt, ':datawypozyczenia', $datawypozyczenia);
    oci_bind_by_name($stmt, ':datazwrotu', $datazwrotu);

    if (!oci_execute($stmt)) {
        $e = oci_error($stmt);
        throw new Exception($e['message']);
    }

    echo "Dane zaktualizowane. <br>";

    oci_free_statement($stmt);
    oci_close($conn);
}
?>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

