<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Registration Form</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <form form action="data.php" method="post">
        <h2>Customer Registration Form</h2>
        <div class="form-group">
            <label for="customer-name">Customer Name:</label>
            <input type="text" id="customer-name" name="customer_name" required>
        </div>
        <div class="form-group">
            <label for="customer-street">Customer Street:</label>
            <input type="text" id="customer-street" name="customer_street" required>
        </div>
        <div class="form-group">
            <label for="customer-city">Customer City:</label>
            <input type="text" id="customer-city" name="customer_city" required>
        </div>
        <button type="submit">Register</button>
    </form>
</body>
</html>
