<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Laundry Management Login</title>
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
        
        .login-container {
            width: 400px;
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
            margin-bottom: 25px;
        }
        
        input[type="text"], input[type="password"] {
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
        
        input[type="text"]::placeholder, input[type="password"]::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }
        
        input[type="text"]:focus, input[type="password"]:focus {
            border-bottom: 1px solid white;
        }
        
        .remember-forgot {
            display: flex;
            justify-content: space-between;
            margin-bottom: 25px;
            font-size: 14px;
        }
        
        .remember-forgot a {
            color: white;
            text-decoration: none;
        }
        
        .remember-forgot a:hover {
            text-decoration: underline;
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
        }
        
        button:hover {
            background: #f0f0f0;
        }
        
        .register-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }
        
        .register-link a {
            color: white;
            text-decoration: none;
        }
        
        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login Form</h2>
        <form action="<%=request.getContextPath()%>/LoginServlet" method="post">
            <div class="input-group">
                <input type="text" id="gmail" name="gmail" placeholder="Enter your email" required>
            </div>
            
            <div class="input-group">
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            
            <div class="remember-forgot">
                <label><input type="checkbox"> Remember me</label>
                <a href="#">Forgot password?</a>
            </div>
            
            <button type="submit">Log In</button>
            
            <div class="register-link">
                Don't have an account? <a href="Registration.jsp">Register</a>
            </div>
        </form>
    </div>
</body>
</html>
