<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biblioteka - Zamówienia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php require('connection.php'); ?>
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
        <div class="container">
            <h2 class="mt-4" id="zamowienia">Zamówienia</h2>
            <a href="insertZamowienie.php"><button class="btn btn-outline-success">Dodaj nowe zamówienie</button></a>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Czytelnik ID</th>
                            <th scope="col">Data Zamówienia</th>
                            <th scope="col">Status</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        try {
                            $table_name = 'ZAMoWIENIA';

                            $sql = 'BEGIN :result := SELECT_DATA(:table_name); END;';
                            $stmt = oci_parse($conn, $sql);

                            $result = oci_new_cursor($conn);
                            oci_bind_by_name($stmt, ':result', $result, -1, OCI_B_CURSOR);
                            oci_bind_by_name($stmt, ':table_name', $table_name);

                            oci_execute($stmt);

                            oci_execute($result);

                            while ($row = oci_fetch_assoc($result)) {
                                echo "<tr>\n";
                                echo "<td>" . htmlentities($row['ID'], ENT_QUOTES) . "</td>\n";
                                echo "<td>" . htmlentities($row['CZYTELNIKID'], ENT_QUOTES) . "</td>\n";
                                echo "<td>" . htmlentities($row['DATAZAMOWIENIA'], ENT_QUOTES) . "</td>\n";
                                echo "<td>" . htmlentities($row['STATUS'], ENT_QUOTES) . "</td>\n";
                                echo "<td><form action='updateZamowienie.php' method='post'><input type='hidden' name='update' value='" . htmlentities($row['ID'], ENT_QUOTES) . "'><input type='submit' class='btn btn-outline-success' value='Edytuj'></form></td>\n";
                                echo "<td><form action='zamowienia.php' method='post'><input type='hidden' name='delete' value='" . htmlentities($row['ID'], ENT_QUOTES) . "'><input type='submit' class='btn btn-outline-danger' value='Usuń'></form></td>\n";
                                echo "<td><form action='pokazZamowienie.php' method='post'><input type='hidden' name='select' value='" . htmlentities($row['ID'], ENT_QUOTES) . "'><input type='submit' class='btn btn-outline-warning' value='Pokaż szczegóły'></form></td>\n";
                                echo "</tr>\n";
                                echo "</tr>\n";
                            }

                            oci_free_statement($stmt);
                            oci_free_statement($result);
                            oci_close($conn);

                        } catch (Exception $e) {
                            echo '<tr><td colspan="5">Error: ' . $e->getMessage() . '</td></tr>';
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <?php
   
    if($_SERVER['REQUEST_METHOD'] == "POST" and isset($_POST['delete']))
    {
        func_delete();
    }
    function func_delete()
    {
      require('connection.php');
        $ID = $_POST['delete'];

        $sql = "BEGIN zamowienia_pkg.DELETE_ZAMOWIENIE(:id); END;";
        $stmt = oci_parse($conn, $sql);

        oci_bind_by_name($stmt, ':id', $ID);

        if (!oci_execute($stmt)) {
            $e = oci_error($stmt);
            throw new Exception($e['message']);
        }

        echo "Rekord usunięty.";

        oci_free_statement($stmt);
        oci_close($conn);
    }

    ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
