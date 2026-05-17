<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
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

// Przygotowanie zapytania SELECT
$sql = "SELECT * FROM KARY WHERE ID = :id";
$stmt = oci_parse($conn, $sql);

// Bindowanie zmiennej ID
oci_bind_by_name($stmt, ':id', $ID);

// Wykonanie zapytania
if (!oci_execute($stmt)) {
    $e = oci_error($stmt);
    throw new Exception($e['message']);
}

// Pobieranie wyników
$result = [];
while ($row = oci_fetch_assoc($stmt)) {
    $result[] = $row;
}

// Zamknięcie zasobów
oci_free_statement($stmt);
oci_close($conn);

?>
<div id="inne" class="container mt-5 mb-3">
    <div class="row d-flex justify-content-center">
        <div class="col-sm-12 col-md-6">
            <h2>Zaktualizuj dane kary</h2>
            <form method="POST" action="updateKara.php">

                <input type="hidden" class="form-control" name= "update" id="update"
                       value=<?php echo $ID?>>
                <div class="form-group mt-2 mb-3">
                    <label for="opis">Opis</label>
                    <input type="text" class="form-control" name= "opis" id="opis"
                           value="<?php echo $result[0]['OPIS']?>">
                </div>
                <div class="form-group mb-3">
                    <label for="kwota">Kwota</label>
                    <input type="number" class="form-control" name= "kwota" id="kwota" value="<?php echo $result[0]['KWOTA']?>">
                </div>
                <div class="form-group mb-3">
                    <label for="czytelnik_id">ID Czytelnika</label>
                    <input type="number" name= "czytelnik_id"class="form-control"  id="czytelnik_id" value="<?php echo $result[0]['CZYTELNIKID']?>">                                        
                </div>
                <div class="form-group mb-3">
                    <label for="pracownik_id">ID Pracownika</label>
                    <input type="number" name= "pracownik_id" class="form-control"  id="pracownik_id" value="<?php echo $result[0]['PRACOWNIKID']?>">                                        
                </div>
                <div class="form-group mb-3">
                    <label for="data_wystawienia">Data wystawienia</label>
                    <input type="date" name= "data_wystawienia" class="form-control"  id="data_wystawienia" value="<?php  $dataWystawienia = $result[0]['DATAWYSTAWIENIA']; $dataWystawieniaFormatted = date('Y-m-d', strtotime($dataWystawienia)); echo $dataWystawieniaFormatted?>">                                        
                </div>
                <div class="form-group mb-3 d-flex justify-content-center">
                    <input class="btn btn-outline-success" type="submit" value="Wyślij">
                </div>
            </form>
        </div>
    </div>
</div>

<?php

if($_SERVER['REQUEST_METHOD'] == "POST" and isset($_POST['opis']))
{
    require('connection.php');

    $opis = $_POST['opis'];
    $kwota = $_POST['kwota'];
    $czytelnik_id = $_POST['czytelnik_id'];
    $pracownik_id = $_POST['pracownik_id'];
    $data_wystawienia = $_POST['data_wystawienia'];

    $ID = (int)$ID;
    $czytelnik_id = (int)$czytelnik_id;
    $pracownik_id = (int)$pracownik_id;

    $sql = "BEGIN kara_pkg.UPDATE_KARA(:id, :opis, :kwota, :czytelnik_id, :pracownik_id, TO_DATE(:data_wystawienia, 'YYYY-MM-DD')); END;";
    $stmt = oci_parse($conn, $sql);

    oci_bind_by_name($stmt, ':id', $ID);
    oci_bind_by_name($stmt, ':opis', $opis);
    oci_bind_by_name($stmt, ':kwota', $kwota);
    oci_bind_by_name($stmt, ':czytelnik_id', $czytelnik_id);
    oci_bind_by_name($stmt, ':pracownik_id', $pracownik_id);
    oci_bind_by_name($stmt, ':data_wystawienia', $data_wystawienia);

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

