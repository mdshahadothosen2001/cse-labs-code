<!DOCTYPE html>
<html>
<head>
	<title>Employee Registration Form</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="form-container">
		<h2>Employee Registration Form</h2>
		<form action="data.php" method="post">
			<label for="employee_name">Employee Name:</label>
			<input type="text" id="employee_name" name="employee_name" required>

			<label for="street">Street:</label>
			<input type="text" id="street" name="street" required>

			<label for="city">City:</label>
			<input type="text" id="city" name="city" required>

			<label for="company_name">Company Name:</label>
			<input type="text" id="company_name" name="company_name" required>

			<label for="company_city">Company City:</label>
			<input type="text" id="company_city" name="company_city" required>

			<label for="salary">Salary:</label>
			<input type="number" id="salary" name="salary" required>

			<input type="submit" value="Submit">
		</form>
	</div>
</body>
</html>