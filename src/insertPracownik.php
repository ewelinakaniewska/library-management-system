<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biblioteka - Dodaj nowego pracownika</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<div id="inne" class="container mt-5 mb-3">
    <div class="row d-flex justify-content-center">
        <div class="col-sm-12 col-md-6">
            <h2>Dodaj nowego pracownika</h2>
            <form method="POST" action="#">
                <div class="form-group mt-2 mb-3">
                    <label for="imie">Imię</label>
                    <input type="text" class="form-control" name= "imie" id="imie" placeholder="Jan">
                </div>
                <div class="form-group mb-3">
                    <label for="nazwisko">Nazwisko</label>
                    <input type="text" class="form-control" name= "nazwisko" id="nazwisko" placeholder="Kolawski">
                </div>
                <div class="form-group mb-3">
                    <label for="stanowisko">Stanowisko</label>
                    <input type="text" class="form-control" name= "stanowisko" id="stanowisko" placeholder="Manager">
                </div>
                <div class="form-group mb-3">
    <label for="czytelniaid">Czytelnia</label>
    <select class="form-select" name="czytelniaid" id="czytelniaid">
        <?php
        require('connection.php');
        $sql = "SELECT NAZWA, ID FROM CZYTELNIA";
        $stmt = oci_parse($conn, $sql);
        oci_execute($stmt);

        while ($row = oci_fetch_assoc($stmt)) {
            echo "<option value='" . $row['ID'] . "'>" . $row['NAZWA'] . "</option>";
        }
        ?>
    </select>
</div>
                <div class="form-group mb-3">
                    <label for="pensja">Pensja</label>
                    <input type="number" class="form-control" name= "pensja" id="pensja" placeholder="2000">
                </div>
                <div class="form-group mb-3">
                    <label for="datazatrudnienia">Data zatrudnienia</label>
                    <input type="date" class="form-control" name= "datazatrudnienia" id="datazatrudnienia">
                </div>
                <div class="form-group mb-3 d-flex justify-content-center">
                    <input class="" type="submit" value="Wyślij">
                </div>
            </form>
        </div>
    </div>
</div>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" and isset($_POST['imie'])) {
    $imie = $_POST['imie'];
    $nazwisko = $_POST['nazwisko'];
    $stanowisko = $_POST['stanowisko'];
    $czytelniaid = $_POST['czytelniaid'];
    $pensja = $_POST['pensja'];
    $datazatrudnienia = $_POST['datazatrudnienia'];

    require('connection.php');

    $sql = "BEGIN pracownik_pkg.INSERT_PRACOWNIK(:imie, :nazwisko, :stanowisko, :czytelniaid, :pensja, TO_DATE(:datazatrudnienia, 'YYYY-MM-DD')); END;";
    $stmt = oci_parse($conn, $sql);

    oci_bind_by_name($stmt, ':imie', $imie);
    oci_bind_by_name($stmt, 'nazwisko', $nazwisko);
    oci_bind_by_name($stmt, 'stanowisko', $stanowisko);
    oci_bind_by_name($stmt, 'czytelniaid', $czytelniaid);
    oci_bind_by_name($stmt, 'pensja', $pensja);
    oci_bind_by_name($stmt, 'datazatrudnienia', $datazatrudnienia);

if (!oci_execute($stmt)) {
    $e = oci_error($stmt);
    throw new Exception($e['message']);
}

echo "Rekord dodany.";

oci_free_statement($stmt);
oci_close($conn);
}
?>