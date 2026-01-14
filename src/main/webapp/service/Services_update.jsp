<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Service</title>
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
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
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
  align-items: center;
}

form label {
  margin-bottom: 6px;
  font-weight: 600;
  color: #F3C6F1;
  align-self: flex-start;
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
  width: 100%;
}

form input[readonly] {
  background-color: #4A4B66;
  color: #A0A0B2;
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
  width: 100%;
}

form input[type="submit"]:hover {
  background-color: #EADFFB;
}
</style>

<script>
// Client-side validation
function validateUpdateForm() {
  const form = document.forms["updateForm"];
  const name = form["service_name"].value.trim();
  const description = form["description"].value.trim();
  const price = form["price"].value;
  const duration = form["duration"].value.trim();
  const available = form["available"].value;
  const category = form["category"].value;

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
<%
  String service_id = request.getParameter("service_id");
  String service_name = request.getParameter("service_name");
  String description = request.getParameter("description");
  String price = request.getParameter("price");
  String duration = request.getParameter("duration");
  String available = request.getParameter("available");
  String category = request.getParameter("category");
%>

<div class="main">
  <h2>Update Your Service</h2>
  <form name="updateForm" action="<%=request.getContextPath() %>/Services_UpdateServlet" method="POST" onsubmit="return validateUpdateForm();">
    
    <label>Service ID:</label>
    <input type="text" name="service_id" value="<%=service_id%>" readonly>

    <label>Service Name:</label>
    <input type="text" name="service_name" value="<%=service_name%>" required>

    <label>Description:</label>
    <input type="text" name="description" value="<%=description%>" required>

    <label>Price:</label>
    <input type="number" name="price" value="<%=price%>" min="100" step="100" required>

    <label>Duration:</label>
    <input type="text" name="duration" value="<%=duration%>" required>

    <label>Available:</label>
    <select name="available" required>
      <option value="">--Select--</option>
      <option value="Yes" <%= "Yes".equals(available) ? "selected" : "" %>>Yes</option>
      <option value="No" <%= "No".equals(available) ? "selected" : "" %>>No</option>
    </select>

    <label>Category:</label>
    <select name="category" required>
      <option value="">--Select Category--</option>
      <option value="Standard" <%= "Standard".equals(category) ? "selected" : "" %>>Standard</option>
      <option value="Premium" <%= "Premium".equals(category) ? "selected" : "" %>>Premium</option>
      <option value="Special" <%= "Special".equals(category) ? "selected" : "" %>>Special</option>
    </select>

    <input type="submit" value="Submit Service">
  </form>
</div>
</body>
</html>
