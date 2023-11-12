<?php
session_start();
if (!isset($_SESSION['UID'])) {
    header('Location: error.php?ec=1'); //user is not logged in
    exit;
} else {
    $pageTitle = 'Inventory Management System';
    include('header.php');
    include('dbconnect.php');

    echo "<form action='searchResult.php' method='post'>\n";
    echo "<h2>Searching for Items</h2>\n";

    $st = "style = 'display: inline-block; width: 55%;'";
    $st2 = "style = 'display: inline-block; width: 44%;'";
    $inp = "style = 'width: 80px;'";

    echo "<div $st2><b>Description:</b> <br><input type='text' name='nm'></div>\n";

    echo "<div $st><b>Item Code:</b> <br><input type='text' name='ic'></div><p>\n";

    echo "<div style='clear: both'><b>Category:</b>\n";
    $q = "select * from categories";
    $r = mysqli_query($conn, $q) or die("Error in query: <mark>$q</mark><br>\n". mysqli_error($conn));
    while ($cat = mysqli_fetch_assoc($r)) {
        echo " <label><input type='checkbox' name='ct[]' value={$cat['categoryCode']}>{$cat['categoryDesc']}</label>\n";
    }

    echo "<p></div><div $st2><b>Storage Location:</b> <br><input type='text' name='sl'></div>\n";

    echo "<div $st><b>Price:</b> <br>Between <input type='number' name='pf' $inp> and <input type='number' name='pt' $inp></div><p>\n";

    echo "<div $st2><b>Last Supplier:</b><br>\n";
    echo "<select name='ls'>\n";
    $q = "select * from suppliers";
    $r = mysqli_query($conn, $q) or die("Error in query: <mark>$q</mark><br>\n". mysqli_error($conn));
    $i = mysqli_num_rows($r);
    echo "<option value=''>Select from $i suppliers</option>";
    $n = 0;
    while ($sup = mysqli_fetch_assoc($r)) {
        $p = mysqli_num_rows(mysqli_query($conn, "select * from items where iLastSupplierId = {$sup['supplierId']}"));
        $n++;
        echo "<option value='{$sup['supplierId']}'>($n) {$sup['supplierName']} [ $p products ]</option>\n";
    }
    echo "</select></div>\n";

    echo "<div $st><b>Quantity on hand:</b> <br>Between <input type='number' name='qf' $inp> and <input type='number' name='qt' $inp></div>\n";

    echo "<hr>\n";

    echo "<div class='buttons'>\n";
    echo "<input type='submit' value='Show Result'> <input type='reset' value='Clear Data'>\n";
    echo "</div>\n";
    echo "</form>\n";

    include('footer.php');
}
?>