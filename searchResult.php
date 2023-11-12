<?php
session_start();
if (!isset($_SESSION['UID'])) {
    header('Location: error.php?ec=1'); //user is not logged in
    exit;
} else {
    include('mylib.php');
    $errors = [];
    if (
        empty($_POST['nm']) &&
        empty($_POST['ic']) &&
        !isset($_POST['ct']) &&
        $_POST['pf'] == "" && //because empty function recognize zero as empty
        $_POST['pt'] == "" &&
        empty($_POST['sl']) &&
        $_POST['qf'] == "" &&
        $_POST['qt'] == "" &&
        empty($_POST['ls'])
        ) {
            $errors[] = "Please fill at lease one field from searching page";
            $pageTitle = 'Error';
            include('header.php');
            DisplayErrors();
        }
        else {
            $pageTitle = 'Search Result';
            include('header.php');
            include('dbconnect.php');

            echo "<form style='width: 90%'>\n";
            echo "<h2>The Result of Searching for Items - <a href='javascript:history.back()'>Change your search values</a></h2>\n";

            $q = "select * from items where iCode = iCode";

            echo "<i>You are searching for:<br></i>\n";
            if (!empty($_POST['nm'])) {
                echo "<b>Description (start with):</b> $mo{$_POST['nm']}$mc<br>";
                $q .= " and iDesc like '{$_POST['nm']}%'";
            }

            if (!empty($_POST['ic'])) {
                echo "<b>Item Code:</b> $mo{$_POST['ic']}$mc<br>";
                $q .= " and iCode like '%{$_POST['ic']}%'";
            }

            if (isset($_POST['ct'])) {
                echo "<b>Category(s):</b><br>";
                foreach($_POST['ct'] as $v) {
                    $p = mysqli_fetch_row(mysqli_query($conn, "select categoryDesc from categories where categoryCode = $v"));
                    echo "- $mo{$p[0]}$mc<br>";
                }
                $x = implode(", ", $_POST['ct']);
                $q .= " and iCategoryCode in($x)";
            }

            if (!empty($_POST['sl'])) {
                echo "<b>Storage Location:</b> $mo{$_POST['sl']}$mc<br>";
                $q .= " and iStorageLoc like '%{$_POST['sl']}%'";
            }

            if ($_POST['pf'] != "" && $_POST['pt'] != "") {
                echo "<b>Price:</b> Between $mo{$_POST['pf']}$mc and $mo{$_POST['pt']}$mc<br>";
                $q .= " and iPrice between {$_POST['pf']} and {$_POST['pt']}";
            } elseif ($_POST['pf'] != "" && $_POST['pt'] == "") {
                echo "<b>Price:</b> more than or equal $mo{$_POST['pf']}$mc<br>";
                $q .= " and iPrice >= {$_POST['pf']}";
            } elseif ($_POST['pf'] == "" && $_POST['pt'] != "") {
                echo "<b>Price:</b> less than or equal $mo{$_POST['pt']}$mc<br>";
                $q .= " and iPrice <= {$_POST['pt']}";
            }

            if (!empty($_POST['ls'])) {
                $p = mysqli_fetch_row(mysqli_query($conn, "select supplierName from suppliers where supplierId = {$_POST['ls']}"));
                echo "<b>Last Supplier:</b> $mo{$p[0]}$mc<br>";
                $q .= " and iLastSupplierId = {$_POST['ls']}";
            }

            if ($_POST['qf'] != "" && $_POST['qt'] != "") {
                echo "<b>Quantity on hand:</b> Between $mo{$_POST['qf']}$mc and $mo{$_POST['qt']}$mc<br>";
                $q .= " and iQtyOnHand between {$_POST['qf']} and {$_POST['qt']}";
            } elseif ($_POST['qf'] != "" && $_POST['qt'] == "") {
                echo "<b>Quantity on hand:</b> more than or equal $mo{$_POST['qf']}$mc<br>";
                $q .= " and iQtyOnHand >= {$_POST['qf']}";
            } elseif ($_POST['qf'] == "" && $_POST['qt'] != "") {
                echo "<b>Quantity on hand:</b> less than or equal $mo{$_POST['qt']}$mc<br>";
                $q .= " and iQtyOnHand <= {$_POST['qt']}";
            }

            echo "<hr>\n";

            $q .= " order by iDesc";
            $r = mysqli_query($conn, $q) or die("Error in query: <mark>$q</mark><br>\n". mysqli_error($conn));

            $i = mysqli_num_rows($r);
            if ($i == 0) {
                echo "<i>There are no item(s) matching your search values</i>\n";
            } else {
                echo "<i>There are $mo $i item(s) $mc matching your search values</i>\n";
                
                if ($_SESSION['TYPE'] == 'A') {
                    $admin = "<th>Actions</th>";
                } else {
                    $admin = "";
                }
                echo "<table>\n";
                echo "<tr><th>Item Code</th> <th>Desc & Spec</th> <th>Category</th> <th>QTY on Hand</th> <th>Price</th> <th>Cost</th> <th>Location</th> <th>Last Supplier</th> $admin</tr>\n";
                $n = 0;
                while ($item = mysqli_fetch_assoc($r)) {
                    $n++;
                    $desc = mysqli_fetch_row(mysqli_query($conn, "select categoryDesc from categories where categoryCode = {$item['iCategoryCode']}"));
                    $supl = mysqli_fetch_row(mysqli_query($conn, "select supplierName from suppliers where supplierId = {$item['iLastSupplierId']}"));
                    $code = "?x={$item['iCode']}";
                    if ($item['iQtyOnHand'] > 0) {
                        if ($_SESSION['TYPE'] == 'A') {
                            $action = "<td><a href='formToIssueItem.php$code'>Issue this item</a> | <a href='formToPurchase.php$code'>New Purchase</a></td>";
                        } else {
                            $action = "";
                        }
                        $st = "";
                    } else {
                        if ($_SESSION['TYPE'] == 'A') {
                            $action = "<td><a href='formToPurchase.php$code'>New Purchase</a></td>";
                        } else {
                            $action = "";
                        }
                        $st = "style = 'background-color: #ff0;'";
                    }
                    echo "<tr $st><td>($n) {$item['iCode']}</td> <td>{$item['iDesc']}</td> <td>{$desc[0]}</td> <td>{$item['iQtyOnHand']}</td> <td>{$item['iPrice']}</td> <td>{$item['iCost']}</td> <td>{$item['iStorageLoc']}</td> <td>{$supl[0]}</td> $action</tr>\n";
                }
                echo "</table>\n";
            }
            echo "</form>\n";
        }

    include('footer.php');
}
?>