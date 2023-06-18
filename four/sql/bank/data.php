<?php
$servername = "localhost";
$username = "root"; // replace this with your MySQL username
$password = ""; // replace this with your MySQL password
$dbname = "bank"; // replace this with your MySQL database name

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}


require_once('data.php');

if (isset($_POST['customer_name']) && isset($_POST['customer_street']) && isset($_POST['customer_city'])) {
    $customer_name = $_POST['customer_name'];
    $customer_street = $_POST['customer_street'];
    $customer_city = $_POST['customer_city'];

    // Insert data into database
    $sql = "INSERT INTO customer (customer_name, customer_street, customer_city)
            VALUES ('$customer_name', '$customer_street', '$customer_city')";

    if (mysqli_query($conn, $sql)) {
        echo "New customer record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }

    // Close connection
    mysqli_close($conn);
}
?>