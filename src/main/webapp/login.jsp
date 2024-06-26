<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SQLCrafter</title>
    
    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/logo.png" type="image/x-icon">
    
    <!-- Latest Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <style>
        body {
            background-color: #f8f9fa;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #17a2b8;
            color: #fff;
            border-radius: 10px 10px 0 0;
            text-align: center;
            padding: 1.5rem;
        }

        .btn-primary {
            background-color: #17a2b8;
            border: none;
        }

        .btn-primary:hover {
            background-color: #4fbfd4;
        }

        /* Add space between buttons */
        .btn-group .btn {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container login-container">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h2 class="display-6">Login</h2>
                </div>
                <div class="card-body">
                    <form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label">Username :</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password :</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>

                        <div class="btn-group">
                            <button type="submit" class="btn btn-primary btn-block">Login</button>
                            <button type="button" class="btn btn-secondary btn-block" onclick="loginAsGuest()">Login as a Guest</button>
                        </div>
                    </form>

                    <!-- Display error message if login fails -->
                    <c:if test="${requestScope.error == 'invalid'}">
                        <p class="text-danger mt-3">Invalid username or password.</p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <!-- Latest Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom Script -->
    <script>
        function loginAsGuest() {
            document.getElementById('username').value = 'GUEST';
            document.getElementById('password').value = 'GUEST123';
            document.getElementById('loginForm').submit();
        }
    </script>
</body>
</html>
