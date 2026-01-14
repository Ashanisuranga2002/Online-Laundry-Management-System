<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert New Service</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<style>
body {
  margin: 0;
  font-family: 'Poppins', sans-serif;
  background-color: #1E1E2F;
  color: #F3F3F3;
}

.main {
  max-width: 600px;
  margin: 60px auto;
  padding: 30px;
  background-color: #2B2C40;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.3);
}

.main h2 {
  text-align: center;
  font-size: 30px;
  color: #6079E8;
  margin-bottom: 30px;
}

form {
  display: flex;
  flex-direction: column;
}

form label {
  margin-bottom: 6px;
  font-weight: 600;
  color: #F3C6F1;
}

form input[type="text"],
form input[type="number"],
form select {
  margin-bottom: 20px;
  padding: 12px;
  font-size: 14px;
  border: none;
  border-radius: 8px;
  background-color: #3E3F5E;
  color: #F3F3F3;
  appearance: none;
}

form input[type="submit"] {
  background-color: #D0BCFF;
  color: #1E1E2F;
  font-size: 16px;
  padding: 12px;
  border: none;
  border-radius: 8px;
  font-weight: 600;
  cursor: pointer;
  transition: 0.3s;
}

form input[type="submit"]:hover {
  background-color: #EADFFB;
}
</style>

<script>
// Client-side validation
function validateForm() {
  const name = document.getElementById("name").value.trim();
  const description = document.getElementById("description").value.trim();
  const price = document.getElementById("price").value;
  const duration = document.getElementById("duration").value.trim();
  const available = document.getElementById("available").value;
  const category = document.getElementById("category").value;

  if (!name || !description || !price || !duration || !available || !category) {
    alert("Please fill in all fields.");
    return false;
  }

  if (!/^[a-zA-Z0-9\s]+$/.test(name)) {
    alert("Service Name can only contain letters, numbers, and spaces.");
    return false;
  }

  if (description.length < 10) {
    alert("Description must be at least 10 characters long.");
    return false;
  }

  if (isNaN(price) || price <= 0) {
    alert("Price must be a positive number.");
    return false;
  }

  return true;
}
</script>
</head>
<body>

<div class="main">
  <h2>Enter New Service</h2>
  <form action="<%=request.getContextPath() %>/Services_InsertServlet" method="POST" onsubmit="return validateForm();">

    <label for="name">Service Name:</label>
    <input type="text" id="name" name="service_name" required>

    <label for="description">Description:</label>
    <input type="text" id="description" name="description" required>

    <label for="price">Price:</label>
    <input type="number" id="price" name="price" step="100" min="100" required>

    <label for="duration">Duration (e.g., 24 hours):</label>
    <input type="text" id="duration" name="duration" required>

    <label for="available">Available:</label>
    <select id="available" name="available" required>
      <option value="">--Select--</option>
      <option value="Yes">Yes</option>
      <option value="No">No</option>
    </select>

    <label for="category">Category:</label>
    <select id="category" name="category" required>
      <option value="">--Select Category--</option>
      <option value="Standard">Standard</option>
      <option value="Premium">Premium</option>
      <option value="Special">Special</option>
    </select>

    <input type="submit" value="Submit Service">
  </form>
</div>

</body>
</html>
