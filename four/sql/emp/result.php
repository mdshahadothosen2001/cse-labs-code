<?php
// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "emp";

$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

// Query the works table for the number of tuples
$sql = "SELECT COUNT(*) AS num_tuples FROM works";
$result = mysqli_query($conn, $sql);

if ($result && mysqli_num_rows($result) > 0) {
  // Output the number of tuples
  $row = mysqli_fetch_assoc($result);
  echo "Number of tuples in the works table: " . $row["num_tuples"];
} else {
  echo "Error: " . mysqli_error($conn);
}

mysqli_close($conn);
?>
