<!DOCTYPE html>
<html>
<head>
	<title>Customer Table</title>
	<link rel="stylesheet" href="style.css">
</head>
<body>
	<h1>Customer Table</h1>
	<table>
		<tr>
			<th>Name</th>
			<th>Street</th>
			<th>City</th>
		</tr>

		<?php
			// Database credentials
			$servername = "localhost";
			$username = "root";
			$password = "";
			$dbname = "bank";

			// Create connection
			$conn = new mysqli($servername, $username, $password, $dbname);

			// Check connection
			if ($conn->connect_error) {
			    die("Connection failed: " . $conn->connect_error);
			}

			// Fetch data from customers table
			$sql = "SELECT * FROM customer";
			$result = $conn->query($sql);

			// Output data of each row
			while($row = $result->fetch_assoc()) {
			    echo "<tr>";
			    echo "<td>" . $row["customer_name"] . "</td>";
			    echo "<td>" . $row["customer_street"] . "</td>";
			    echo "<td>" . $row["customer_city"] . "</td>";
			    echo "</tr>";
			}

			// Close database connection
			$conn->close();
		?>

	</table>
</body>
</html>