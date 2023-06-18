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

// Get the form data
$employee_name = $_POST["employee_name"];
$street = $_POST["street"];
$city = $_POST["city"];
$company_name = $_POST["company_name"];
$company_city = $_POST["company_city"];
$salary = $_POST["salary"];

// Insert data into the database
$sql1 = "INSERT INTO employee (employee_name, street, city) VALUES ('$employee_name', '$street', '$city')";
$sql2 = "INSERT INTO company (company_name, city) VALUES ('$company_name', '$city')";
$sql3 = "INSERT INTO works (employee_name, company_name, salary) VALUES ('$employee_name', '$company_name', $salary)";

if (mysqli_query($conn, $sql1) && mysqli_query($conn, $sql2) && mysqli_query($conn, $sql3)) {
  echo "New record created successfully";
} else {
  echo "Error: " . mysqli_error($conn);
}

mysqli_close($conn);
?>