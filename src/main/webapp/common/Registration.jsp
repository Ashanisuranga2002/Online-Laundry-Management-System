<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Laundry Management Registration</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-image: url('<%=request.getContextPath()%>/img/7497382_33056.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            position: relative;
        }
        
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.7));
            z-index: 1;
        }
        
        .register-container {
            width: 450px;
            padding: 40px;
            background: rgba(20, 20, 35, 0.4);
            backdrop-filter: blur(15px);
            border-radius: 10px;
            z-index: 2;
            color: white;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.25);
        }
        
        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 500;
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
        }
        
        .input-group {
            margin-bottom: 20px;
        }
        
        input[type="text"], input[type="password"], input[type="email"], input[type="tel"] {
            width: 100%;
            padding: 10px 0;
            background: transparent;
            border: none;
            border-bottom: 1px solid rgba(255, 255, 255, 0.6);
            color: white;
            font-size: 16px;
            outline: none;
            transition: border-color 0.3s;
        }
        
        input[type="text"]::placeholder, input[type="password"]::placeholder, 
        input[type="email"]::placeholder, input[type="tel"]::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }
        
        input[type="text"]:focus, input[type="password"]:focus, 
        input[type="email"]:focus, input[type="tel"]:focus {
            border-bottom: 1px solid white;
        }
        
        button {
            width: 100%;
            padding: 12px;
            background: white;
            border: none;
            border-radius: 5px;
            color: #333;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
            margin-top: 10px;
        }
        
        button:hover {
            background: #f0f0f0;
        }
        
        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }
        
        .login-link a {
            color: white;
            text-decoration: none;
        }
        
        .login-link a:hover {
            text-decoration: underline;
        }
        
        .password-match-message {
            font-size: 12px;
            margin-top: 5px;
            color: #ff6b6b;
            display: none;
        }
    </style>
    <script>
        function validateForm() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            
            if (password !== confirmPassword) {
                document.getElementById("passwordMatchError").style.display = "block";
                return false;
            }
            return true;
        }
        
        function checkPasswordMatch() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var errorElement = document.getElementById("passwordMatchError");
            
            if (password !== confirmPassword && confirmPassword !== "") {
                errorElement.style.display = "block";
            } else {
                errorElement.style.display = "none";
            }
        }
    </script>
</head>
<body>
    <div class="register-container">
        <h2>Create Account</h2>
        <form action="<%=request.getContextPath()%>/UserInsertServlet" method="post" onsubmit="return validateForm()">
            <div class="input-group">
                <input type="text" id="name" name="name" placeholder="Full Name" required>
            </div>
            
            <div class="input-group">
                <input type="email" id="email" name="email" placeholder="Email Address" required>
            </div>
            
            <div class="input-group">
                <input type="tel" id="phone" name="phone" placeholder="Phone Number" required>
            </div>
            
            <div class="input-group">
                <input type="text" id="address" name="address" placeholder="Address" required>
            </div>
            
            <div class="input-group">
                <input type="password" id="password" name="password" placeholder="Password" required>
            </div>
            
            <div class="input-group">
                <input type="password" id="confirmPassword"  placeholder="Confirm Password" required onkeyup="checkPasswordMatch()">
                <div id="passwordMatchError" class="password-match-message">Passwords do not match!</div>
            </div>
            
            <button type="submit">Register</button>
            
            <div class="login-link">
                Already have an account? <a href="login.jsp">Login</a>
            </div>
        </form>
    </div>
</body>
</html>
