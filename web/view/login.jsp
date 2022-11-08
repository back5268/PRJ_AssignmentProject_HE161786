<%-- 
    Document   : Login
    Created on : Oct 30, 2022, 11:10:07 AM
    Author     : bacht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        html,
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            width: 100%;
            background-color: aliceblue;
        }

        ::selection {
            background: #00c9a7;
            color: #fff;
        }

        .wrapper {
            overflow: hidden;
            max-width: 352px;
            background: #fff;
            padding: 32px;
            border-radius: 8px;
            box-shadow: 0px 16px 20px rgba(0, 0, 0, 0.1);
        }

        .wrapper .slide-controls {
            position: relative;
            display: flex;
            height: 50px;
            width: 100%;
            overflow: hidden;
            margin: 24px 0 16px 0;
            justify-content: space-between;
        }

        .slide-controls .slide {
            height: 100%;
            width: 100%;
            color: #845ec2;
            font-size: 24px;
            font-weight: 600;
            text-align: center;
            line-height: 48px;
            cursor: pointer;
            z-index: 1;
            transition: all 0.6s ease;
        }

        .slide-controls label.signup {
            color: lightgrey;
        }

        .slide-controls .slider-tab {
            position: absolute;
            height: 10%;
            width: 50%;
            bottom: 0;
            z-index: 0;
            border-radius: 8px;
            border: 1px solid lightgrey;
            transition: all 0.6s ease;
            background-color: blueviolet;
        }

        input[type="radio"] {
            display: none;
        }

        #signup:checked~.slider-tab {
            left: 50%;
        }

        #signup:checked~.slider-tab {
            left: 50%;
        }

        #signup:checked~label.signup {
            color: #845ec2;
            cursor: default;
        }

        #signup:checked~label.login {
            color: lightgrey;
        }

        #login:checked~label.signup {
            color: lightgrey;
        }

        #login:checked~label.login {
            cursor: default;
        }

        .wrapper .form-container {
            width: 100%;
            overflow: hidden;
        }

        .form-container .form-inner {
            display: flex;
            width: 200%;
        }

        .form-container .form-inner form {
            width: 50%;
            transition: all 0.6s ease;
        }

        .form-inner form .field {
            height: 48px;
            width: 100%;
            margin-top: 16px;
        }

        .form-inner form .field input {
            height: 100%;
            width: 100%;
            outline: none;
            padding-left: 16px;
            border-radius: 8px;
            border: 1px solid lightgrey;
            border-bottom-width: 2px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .form-inner form .field input:focus {
            border-color: #845ec2;
        }

        .form-inner form .field input::placeholder {
            color: #999;
            transition: all 0.3s ease;
        }

        form .field input:focus::placeholder {
            color: #b3b3b3;
        }

        .form-inner form .pass-link {
            margin-top: 16px;
            margin-left: 8px;
        }

        .form-inner form .signup-link {
            text-align: center;
            margin-top: 30px;
        }

        .form-inner form .pass-link a,
        .form-inner form .signup-link a {
            color: #845ec2;
            text-decoration: none;
        }

        .form-inner form .pass-link a:hover,
        .form-inner form .signup-link a:hover {
            text-decoration: underline;
        }

        form .btn {
            height: 50px;
            width: 100%;
            border-radius: 8px;
            position: relative;
            overflow: hidden;
        }

        form .btn .btn-layer {
            height: 100%;
            width: 300%;
            position: absolute;
            left: -100%;
            background-color: blueviolet;
            border-radius: 5px;
            transition: all 0.4s ease;
            ;
        }

        form .btn:hover .btn-layer {
            left: 0;
        }

        form .btn input[type="submit"] {
            height: 100%;
            width: 100%;
            z-index: 1;
            position: relative;
            background: none;
            border: none;
            color: #fff;
            padding-left: 0;
            border-radius: 5px;
            font-size: 20px;
            font-weight: 500;
            cursor: pointer;
        }
    </style>

    <body>
        <div class="wrapper">
            <div class="form-container">
                <div class="slide-controls">
                    <input type="radio" name="slide" id="login" checked>
                    <input type="radio" name="slide" id="signup">
                    <label for="login" class="slide login">Login</label>
                    <label for="signup" class="slide signup">Signup</label>
                    <div class="slider-tab"></div>
                </div>
                <div class="form-inner">
                    <form action="login" method="POST" class="login">
                        <div class="field">
                            <input type="text" placeholder="Username" name="username" required>
                        </div>
                        <div class="field">
                            <input type="password" placeholder="Password" name="password" required>
                        </div>
                        <div class="pass-link">
                            <a href="#">Forgot password?</a>
                        </div>
                        <input type="checkbox" name="remember"> Remember
                        <div class="field btn">
                            <div class="btn-layer"></div>
                            <input type="submit" value="Login">
                        </div>
                        <div class="signup-link">
                            Not a member? <a href="">Signup now</a>
                        </div>
                    </form>
                    <form action="#" class="signup">
                        <div class="field">
                            <input type="text" placeholder="Username" required>
                        </div>
                        <div class="field">
                            <input type="password" placeholder="Password" required>
                        </div>
                        <div class="field">
                            <input type="password" placeholder="Confirm password" required>
                        </div> <br> <br>
                        <div class="field btn">
                            <div class="btn-layer"></div>
                            <input type="submit" value="Signup">
                        </div>
                    </form>
                </div>
            </div>
        </div>


</body>

</html>
