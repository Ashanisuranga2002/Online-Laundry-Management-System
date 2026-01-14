<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Update Form</title>
</head>
<body>

	<%
	String id = request.getParameter("employee_id");
	String name = request.getParameter("name");
	String gmail = request.getParameter("email");
	String password = request.getParameter("password");
	String phone = request.getParameter("contact_number");
	
	%>

<form action="<%=request.getContextPath()%>/UpdateUserServlet" method="POST">
    
	<label for="id">ID:</label>
    <input type="text" id="id" name="id" value="<%=id%>"readonly>
	
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="<%=name%>" required>

    <label for="price">Gmail:</label>
    <input type="email" id="gmail" name="gmail" value="<%=gmail%>" required>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" value="<%=password%>"required>

    <label for="phone">Phone:</label>
    <input type="text" id="phone" name="phone" min="1" value="<%=phone%>" required>

    <button type="submit">Submit</button>
    
</form>

</body>
</html>