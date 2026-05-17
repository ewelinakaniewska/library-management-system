<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Biblioteka</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
<div id="inne" class="container mt-5 mb-3">
    <div class="row d-flex justify-content-center">
        <div class="col-sm-12 col-md-6">
            <h2>Dodaj nowe wypożyczenie</h2>
            <form method="POST" action="#">
                <div class="form-group mt-2 mb-3">
                    <label for="czytelnik_id">ID Czytelnika</label>
                    <input type="number" class="form-control" name="czytelnik_id" id="czytelnik_id" placeholder="1">
                </div>
                <div class="form-group mb-3">
                    <label for="ksiazka_id">ID Książki</label>
                    <input type="number" class="form-control" name="ksiazka_id" id="ksiazka_id" placeholder="1">
                </div>
                <div class="form-group mb-3">
                    <label for="data_wypozyczenia">Data wypożyczenia</label>
                    <input type="date" name="data_wypozyczenia" class="form-control" id="data_wypozyczenia">
                </div>
                <div class="form-group mb-3">
                    <label for="data_zwrotu">Data zwrotu</label>
                    <input type="date" name="data_zwrotu" class="form-control" id="data_zwrotu">
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
    $ksiazka_id = $_POST['ksiazka_id'];
    $data_wypozyczenia = $_POST['data_wypozyczenia'];
    $data_zwrotu = $_POST['data_zwrotu'];

    require('connection.php');

    $sql = "BEGIN wypozyczenie_pkg.INSERT_WYPOZYCZENIA(:czytelnik_id, :ksiazka_id, TO_DATE(:data_wypozyczenia, 'YYYY-MM-DD'), TO_DATE(:data_zwrotu, 'YYYY-MM-DD')); END;";
    $stmt = oci_parse($conn, $sql);
    oci_bind_by_name($stmt, ':czytelnik_id', $czytelnik_id);
oci_bind_by_name($stmt, ':ksiazka_id', $ksiazka_id);
oci_bind_by_name($stmt, ':data_wypozyczenia', $data_wypozyczenia);
oci_bind_by_name($stmt, ':data_zwrotu', $data_zwrotu);

if (!oci_execute($stmt)) {
    $e = oci_error($stmt);
    throw new Exception($e['message']);
}

echo "Wypożyczenie dodane.";

oci_free_statement($stmt);
oci_close($conn);
}
?>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
