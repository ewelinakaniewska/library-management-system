<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Biblioteka - Aktualizacja Pracownika</title>
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

      $sql = "SELECT * FROM PRACOWNICY WHERE ID = :id";
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
                <h2>Zaktualizuj dane pracownika</h2>
                <form method="POST" action="updatePracownik.php">

                <input type="hidden" class="form-control" name= "update" id="update"
                           value=<?php echo $ID?>>
                    <div class="form-group mt-2 mb-3">
                        <label for="imie">Imię</label>
                        <input type="text" class="form-control" name= "imie" id="imie"
                           value="<?php echo $result[0]['IMIE']?>">
                    </div>
                    <div class="form-group mb-3">
                        <label for="nazwisko">Nazwisko</label>
                        <input type="text" class="form-control" name= "nazwisko" id="nazwisko" value="<?php echo $result[0]['NAZWISKO']?>">
                    </div>
                    <div class="form-group mb-3">
                        <label for="stanowisko">Stanowisko</label>
                        <input type="text" class="form-control" name= "stanowisko" id="stanowisko" value="<?php echo $result[0]['STANOWISKO']?>">
                    </div>
                    <div class="form-group mb-3">
                        <label for="czytelniaid">Czytelnia ID</label>
                        <input type="text" class="form-control" name= "czytelniaid" id="czytelniaid" value="<?php echo $result[0]['CZYTELNIAID']?>">
                    </div>
                    <div class="form-group mb-3">
                        <label for="pensja">Pensja</label>
                        <input type="text" class="form-control" name= "pensja" id="pensja" value="<?php echo $result[0]['PENSJA']?>">
                    </div>
                    <div class="form-group mb-3">
                        <label for="datazatrudnienia">Data Zatrudnienia</label>
                        <input type="date" class="form-control" name= "datazatrudnienia" id="datazatrudnienia" value="<?php  $dataZatrudnienia = $result[0]['DATAZATRUDNIENIA']; $dataZatrudnieniaFormatted = date('Y-m-d', strtotime($dataZatrudnienia)); echo $dataZatrudnieniaFormatted?>">
                    </div>
                    <div class="form-group mb-3 d-flex justify-content-center">
                        <input class="btn btn-outline-success" type="submit" value="wyślij">
                    </div>
                </form>
            </div>
        </div> 

	</form>
    <?php
    
    if($_SERVER['REQUEST_METHOD'] == "POST" and isset($_POST['imie']))
    {
        require('connection.php');
        $imie = $_POST['imie'];
        $nazwisko = $_POST['nazwisko'];
        $stanowisko = $_POST['stanowisko'];
        $czytelniaid = $_POST['czytelniaid'];
        $pensja = $_POST['pensja'];
        $datazatrudnienia = $_POST['datazatrudnienia'];
        $ID = (int)$ID;
        $czytelniaid = (int)$czytelniaid;
        $pensja = (float)$pensja;
        $sql = "BEGIN pracownik_pkg.UPDATE_PRACOWNIK(:id, :imie, :nazwisko, :stanowisko, :czytelniaid, :pensja, TO_DATE(:datazatrudnienia, 'YYYY-MM-DD')); END;";
        $stmt = oci_parse($conn, $sql);

        oci_bind_by_name($stmt, ':id', $ID);
        oci_bind_by_name($stmt, ':imie', $imie);
        oci_bind_by_name($stmt, ':nazwisko', $nazwisko);
        oci_bind_by_name($stmt, ':stanowisko', $stanowisko);
        oci_bind_by_name($stmt, ':czytelniaid', $czytelniaid);
        oci_bind_by_name($stmt, ':pensja', $pensja);
        oci_bind_by_name($stmt, ':datazatrudnienia', $datazatrudnienia);

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
