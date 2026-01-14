<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Laundry Services Dashboard</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<script src="https://unpkg.com/lucide@latest"></script>

<style>
body {
  margin: 0;
  padding: 0;
  font-family: 'Poppins', sans-serif;
  background-color: #1E1E2F;
  color: #F3F3F3;
}

.main {
  max-width: 1100px;
  margin: 40px auto;
  padding: 20px;
}

h2 {
  text-align: center;
  font-size: 40px;
  margin-bottom: 30px;
  color: #6079E8;
}

.button-link {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  background-color: #A3C4F3;
  color: #1E1E2F;
  padding: 12px 22px;
  border-radius: 10px;
  text-decoration: none;
  font-weight: 600;
  margin-bottom: 20px;
  box-shadow: 0 4px 10px rgba(163, 196, 243, 0.2);
  transition: 0.3s;
}
.button-link:hover {
  background-color: #BDE0FE;
  box-shadow: 0 4px 15px rgba(189, 224, 254, 0.3);
}

table {
  width: 100%;
  border-collapse: collapse;
  background-color: #2B2C40;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 4px 12px rgba(0,0,0,0.2);
}

th, td {
  padding: 16px;
  text-align: left;
}

th {
  background-color: #3E3F5E;
  color: #4E60FF;
}

tr:nth-child(even) {
  background-color: #262738;
}
tr:hover {
  background-color: #3B3C56;
}

.action-container {
  display: flex;
  gap: 10px;
}

.action-btn, form button {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  padding: 8px 14px;
  font-size: 14px;
  border-radius: 8px;
  cursor: pointer;
  border: none;
  transition: 0.3s;
  text-decoration: none;
}

.action-btn {
  background-color: #D0BCFF;
  color: green;
  font-weight: 500;
}
.action-btn:hover {
  background-color: #EADFFB;
}

form button {
  background-color: #FFB5C2;
  color: red;
  font-weight: 500;
}
form button:hover {
  background-color: #FFD6DD;
}
</style>
</head>
<body>

<div class="main">
  <h2> Laundry Management Dashboard</h2>

  <a href="<%=request.getContextPath() %>/service/Services_Insert.jsp" class="button-link">
    <i data-lucide="plus-circle" style="width: 18px; height: 18px;"></i> Add New Service
  </a>

  <table>
    <tr>
      <th>Service ID</th>
      <th>Service Name</th>
      <th>Description</th>
      <th>Price</th>
      <th>Created At</th>
      <th>Duration</th>
      <th>Available</th>
      <th>category</th>
      <th>Actions</th>
    </tr>
    <c:forEach var="services" items="${allServices}">
    <tr>
      <td>${services.service_id}</td>
      <td>${services.service_name}</td>
      <td>${services.description}</td>
      <td>${services.price}</td>
      <td>${services.created_at}</td>
      <td>${services.duration}</td>
      <td>${services.available}</td>
	  <td>${services.category}</td>      
      <td>
        <div class="action-container">
          <a href="<%=request.getContextPath() %>/service/Services_update.jsp?service_id=${services.service_id}&service_name=${services.service_name}&description=${services.description}&price=${services.price}&created_at=${services.created_at}&duration=${services.duration}&available=${services.available}&category=${services.category}" class="action-btn">
            <i data-lucide="edit" style="width: 16px; height: 16px;"></i> Update
          </a>
          <form action="Services_DeleteServlet" method="POST" style="margin: 0;">
            <input type="hidden" name="service_id" value="${services.service_id}">
            <button type="submit">
              <i data-lucide="trash-2" style="width: 16px; height: 16px;"></i> Delete
            </button>
          </form>
        </div>
      </td>
    </tr>
    </c:forEach>
  </table>
</div>

<script>
  lucide.createIcons();
</script>

</body>
</html>
