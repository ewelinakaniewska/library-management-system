<?php
    $conn = oci_connect('biblioteka', 'biblioteka', '//localhost:1521/XEPDB1');
    if (!$conn) {
        $e = oci_error();
        throw new Exception($e['message']);
    }
?>