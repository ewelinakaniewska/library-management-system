<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Szczegóły zamówienia</title>
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
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
    <div class="container mt-5">
      <h2>Szczegóły zamówienia</h2>
      <?php
      if (isset($_POST['select'])) {
        $zamowienie_id = $_POST['select'];

        require('connection.php');

        $sql = "BEGIN :result := zamowienia_pkg.GET_ZAMOWIENIE_SZCZEGOLY(:id); END;";
        $stmt = oci_parse($conn, $sql);

        oci_bind_by_name($stmt, ':id', $zamowienie_id);

        $cursor = oci_new_cursor($conn);
        oci_bind_by_name($stmt, ':result', $cursor, -1, OCI_B_CURSOR);

        oci_execute($stmt);
        oci_execute($cursor, OCI_DEFAULT);

        $zamowienie_details = oci_fetch_assoc($cursor);
        if ($zamowienie_details) {
            echo "<p>ID Zamówienia: " . $zamowienie_details['ZAMOWIENIE_ID'] . "</p>";
            echo "<p>ID Czytelnika: " . $zamowienie_details['CZYTELNIKID'] . "</p>";
            echo "<p>Data Zamówienia: " . $zamowienie_details['DATAZAMOWIENIA'] . "</p>";
            echo "<p>Status: " . $zamowienie_details['STATUS'] . "</p>";

            echo "<h3>Przedmioty w zamówieniu</h3>";
            echo "<ul>";
            do {
                echo "<li>" . $zamowienie_details['TYP'] . ": " . $zamowienie_details['ITEM_TYTUL'] . " (ID: " . $zamowienie_details['ITEM_ID'] . ")</li>";
            } while ($zamowienie_details = oci_fetch_assoc($cursor));
            echo "</ul>";
        } else {
            echo "<p>Nie znaleziono zamówienia o podanym ID.</p>";
        }

        oci_free_statement($stmt);
        oci_free_statement($cursor);
        oci_close($conn);
    }
      ?>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>
