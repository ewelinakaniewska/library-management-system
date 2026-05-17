<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Biblioteka - Dodaj Nowe Czasopismo</title>
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
          <h2>Dodaj nowe czasopismo</h2>
          <form method="POST" action="#">
            <div class="form-group mt-2 mb-3">
              <label for="nazwa">Nazwa</label>
              <input type="text" class="form-control" name="nazwa" id="nazwa" placeholder="Nazwa czasopisma">
            </div>
            <div class="form-group mb-3">
              <label for="wydawca">Wydawca</label>
              <input type="text" class="form-control" name="wydawca" id="wydawca" placeholder="Wydawca czasopisma">
            </div>
            <div class="form-group mb-3">
              <label for="czytelniaID">Czytelnia ID</label>
              <input type="number" class="form-control" name="czytelniaID" id="czytelniaID" placeholder="ID czytelni">
            </div>
            <div class="form-group mb-3">
              <label for="status">Status</label>
              <input type="text" class="form-control" name="status" id="status" placeholder="Status czasopisma">
            </div>
            <div class="form-group mb-3">
              <label for="numerWydania">Numer Wydania</label>
              <input type="text" class="form-control" name="numerWydania" id="numerWydania" placeholder="Numer wydania czasopisma">
            </div>
            <div class="form-group mb-3 d-flex justify-content-center">
              <input class="btn btn-outline-success" type="submit" value="wyślij">
            </div>
          </form>
        </div>
      </div>
    </div>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['nazwa'])) {
      $nazwa = $_POST['nazwa'];
      $wydawca = $_POST['wydawca'];
      $czytelniaID = (int)$_POST['czytelniaID'];
      $status = $_POST['status'];
      $numerWydania = $_POST['numerWydania'];

      require('connection.php');

      $sql = "BEGIN czasopismo_pkg.INSERT_CZASOPISMO(:nazwa, :wydawca, :czytelniaID, :status, :numerWydania); END;";
      $stmt = oci_parse($conn, $sql);

      oci_bind_by_name($stmt, ':nazwa', $nazwa);
      oci_bind_by_name($stmt, ':wydawca', $wydawca);
      oci_bind_by_name($stmt, ':czytelniaID', $czytelniaID);
      oci_bind_by_name($stmt, ':status', $status);
      oci_bind_by_name($stmt, ':numerWydania', $numerWydania);

      if (!oci_execute($stmt)) {
          $e = oci_error($stmt);
          throw new Exception($e['message']);
      }

      echo "Rekord dodany.";

      oci_free_statement($stmt);
      oci_close($conn);
    } 
    ?>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>
