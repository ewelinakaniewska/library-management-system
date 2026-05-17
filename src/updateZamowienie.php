<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aktualizacja danych zamówienia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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

<?php
require('connection.php');


$ID = $_POST['update'];

$sql = "SELECT * FROM ZAMOWIENIA WHERE ID = :id";
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
            <h2>Zaktualizuj dane zamówienia</h2>
            <form method="POST" action="updateZamowienie.php">

                <input type="hidden" class="form-control" name= "update" id="update"
                       value=<?php echo $ID?>>
                <div class="form-group mt-2 mb-3">
                    <label for="data">Data Zamówienia</label>
                    <input type="date" class="form-control" name= "data" id="data"
                           value="<?php  $dataZamówienia = $result[0]['DATAZAMOWIENIA']; $dataZamówieniaFormatted = date('Y-m-d', strtotime($dataZamówienia)); echo $dataZamówieniaFormatted?>">                                        
                </div>
                <div class="form-group mt-2 mb-3">
                    <label for="data">ID czytelnika</label>
                    <input type="number" class="form-control" name= "idczyt" id="idczyt"
                           value="<?php echo $result[0]['CZYTELNIKID']?>">
                </div>
                <div class="form-group mb-3">
                    <label for="status">Status</label>
                    <input type="text" class="form-control" name= "status" id="status"
                           value="<?php echo $result[0]['STATUS']?>">
                </div>
                <div class="form-group mb-3 d-flex justify-content-center">
                    <input class="btn btn-outline-success" type="submit" value="Wyślij">
                </div>
            </form>
        </div>
    </div>

</div>
<?php
if($_SERVER['REQUEST_METHOD'] == "POST" and isset($_POST['data']))
{
    require('connection.php');
    $data = $_POST['data'];
    $idczyt = $_POST['idczyt'];
    $status = $_POST['status'];
    $ID = $_POST['update'];

    echo $data;
    echo $idczyt;
    echo $status;
    echo $ID;

    $sql = "BEGIN zamowienia_pkg.UPDATE_ZAMOWIENIE(:id, :idczyt, TO_DATE(:data, 'YYYY-MM-DD'), :status); END;";
    $stmt = oci_parse($conn, $sql);

    oci_bind_by_name($stmt, ':id', $ID);
    oci_bind_by_name($stmt, ':data', $data);
    oci_bind_by_name($stmt, ':idczyt', $idczyt);
    oci_bind_by_name($stmt, ':status', $status);

    if (!oci_execute($stmt)) {
        $e = oci_error($stmt);
        throw new Exception($e['message']);
    }

    echo "Dane zamówienia zaktualizowane. <br>";

    oci_free_statement($stmt);
    oci_close($conn);
}

?>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
