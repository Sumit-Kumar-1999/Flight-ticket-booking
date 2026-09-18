```jsp
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>

        <meta charset="ISO-8859-1">

        <title>AirGo User Login</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <style>

            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            body {
                min-height: 100vh;
                overflow: hidden;

                background:
                    linear-gradient(rgba(0,0,0,0.60), rgba(0,0,0,0.78)),
                    url("image/AirGo.jpg");

                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;

                display: flex;
                justify-content: center;
                align-items: center;

                position: relative;
            }

            /* Animated Neon Background */

            body::before {
                content: "";
                position: absolute;

                width: 450px;
                height: 450px;

                background: linear-gradient(#00e5ff, #0072ff);

                border-radius: 50%;
                filter: blur(180px);

                top: -120px;
                left: -120px;

                opacity: 0.35;

                animation: float1 8s infinite alternate;
            }

            body::after {
                content: "";
                position: absolute;

                width: 400px;
                height: 400px;

                background: linear-gradient(#ff00ff, #7b2ff7);

                border-radius: 50%;
                filter: blur(180px);

                bottom: -120px;
                right: -120px;

                opacity: 0.30;

                animation: float2 8s infinite alternate;
            }

            @keyframes float1 {
                100% {
                    transform: translateY(60px) translateX(40px);
                }
            }

            @keyframes float2 {
                100% {
                    transform: translateY(-50px) translateX(-40px);
                }
            }

            /* Login Container */

            .login-box {
                position: relative;
                z-index: 2;

                width: 430px;

                padding: 45px 35px;

                border-radius: 30px;

                background: rgba(255,255,255,0.08);

                backdrop-filter: blur(18px);

                border: 1px solid rgba(255,255,255,0.15);

                box-shadow:
                    0 8px 32px rgba(0,0,0,0.45),
                    inset 0 0 10px rgba(255,255,255,0.04);

                animation: fadeUp 1s ease;
            }

            @keyframes fadeUp {
                from {
                    opacity: 0;
                    transform: translateY(70px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* Logo */

            .logo-box {
                display: flex;
                justify-content: center;
                margin-bottom: 15px;
            }

            .logo {
                width: 85px;
                height: 85px;

                background-image: url("image/airplane-icon-png-22.png");

                background-position: center;
                background-repeat: no-repeat;
                background-size: contain;

                transition: 0.5s;
            }

            .logo:hover {
                transform: rotate(-15deg) scale(1.08);
            }

            /* Heading */

            h2 {
                text-align: center;
                color: white;
                font-size: 38px;
                margin-bottom: 8px;
                letter-spacing: 1px;
            }

            .sub-title {
                text-align: center;
                color: #d6d6d6;
                margin-bottom: 35px;
                font-size: 15px;
            }

            /* Input Fields */

            .input-box {
                position: relative;
                margin-bottom: 28px;
            }

            .input-box input {
                width: 100%;
                height: 58px;

                border: none;
                outline: none;

                border-radius: 18px;

                background: rgba(255,255,255,0.10);

                border: 1px solid rgba(255,255,255,0.08);

                padding: 0 50px 0 18px;

                color: white;
                font-size: 16px;

                transition: 0.4s;
            }

            .input-box input:focus {
                border: 1px solid #00e5ff;

                box-shadow: 0 0 18px rgba(0,229,255,0.5);

                transform: translateY(-3px);
            }

            .input-box input::placeholder {
                color: #d7d7d7;
            }

            .input-box ion-icon {
                position: absolute;

                right: 18px;
                top: 18px;

                color: white;
                font-size: 22px;
            }

            /* Error Messages */

            .error {
                color: #ff4d6d;
                font-size: 13px;
                margin-bottom: 8px;
                margin-left: 5px;
            }

            /* Remember Me */

            .options {
                display: flex;
                justify-content: space-between;
                align-items: center;

                margin-bottom: 30px;

                color: white;
                font-size: 14px;
            }

            .options label {
                display: flex;
                align-items: center;
                gap: 6px;
            }

            .options input[type="checkbox"] {
                accent-color: #00e5ff;
                cursor: pointer;
            }

            .options a {
                text-decoration: none;
                color: #d6d6d6;
                transition: 0.3s;
            }

            .options a:hover {
                color: #00e5ff;
            }

            /* Button */

            button {
                width: 100%;
                height: 58px;

                border: none;
                outline: none;

                border-radius: 18px;

                background: linear-gradient(135deg, #00e5ff, #0072ff);

                color: white;

                font-size: 18px;
                font-weight: 600;

                cursor: pointer;

                transition: 0.5s;

                box-shadow: 0 0 25px rgba(0,229,255,0.4);
            }

            button:hover {
                transform: translateY(-5px);

                box-shadow: 0 0 35px rgba(0,229,255,0.7);
            }

            /* Register */

            .register {
                margin-top: 28px;

                text-align: center;

                color: #d6d6d6;
                font-size: 15px;
            }

            .register a {
                text-decoration: none;
                color: #00e5ff;
                font-weight: 600;
            }

            .register a:hover {
                text-decoration: underline;
            }

            /* Responsive */

            @media(max-width: 500px) {

                .login-box {
                    width: 90%;
                    padding: 35px 25px;
                }

                h2 {
                    font-size: 30px;
                }
            }

            /* =========================================
               FORGOT PASSWORD MODAL
               ========================================= */

            .modal-overlay {
                display: none;

                position: fixed;

                z-index: 1000;

                top: 0;
                left: 0;

                width: 100%;
                height: 100%;

                background: rgba(0,0,0,0.70);

                backdrop-filter: blur(8px);

                justify-content: center;
                align-items: center;
            }

            /* Forgot Password Box */

            .forgot-box {
                position: relative;

                width: 430px;

                padding: 40px 35px;

                border-radius: 30px;

                background: rgba(255,255,255,0.08);

                backdrop-filter: blur(20px);

                border: 1px solid rgba(255,255,255,0.18);

                box-shadow:
                    0 8px 32px rgba(0,0,0,0.55),
                    inset 0 0 15px rgba(255,255,255,0.04);

                animation: forgotPopup 0.4s ease;
            }

            @keyframes forgotPopup {

                from {
                    opacity: 0;
                    transform: scale(0.75) translateY(30px);
                }

                to {
                    opacity: 1;
                    transform: scale(1) translateY(0);
                }
            }

            /* Close Button */

            .close-btn {
                position: absolute;

                top: 15px;
                right: 22px;

                font-size: 32px;

                color: #ffffff;

                cursor: pointer;

                transition: 0.3s;
            }

            .close-btn:hover {
                color: #00e5ff;

                transform: rotate(90deg);
            }

            /* Forgot Logo */

            .forgot-logo-box {
                display: flex;
                justify-content: center;
                margin-bottom: 12px;
            }

            .forgot-logo {
                width: 65px;
                height: 65px;

                background-image: url("image/airplane-icon-png-22.png");

                background-position: center;
                background-repeat: no-repeat;
                background-size: contain;
            }

            /* Forgot Heading */

            .forgot-box h2 {
                text-align: center;

                color: white;

                font-size: 30px;

                margin-bottom: 6px;

                letter-spacing: 1px;
            }

            .forgot-subtitle {
                text-align: center;

                color: #d6d6d6;

                font-size: 14px;

                margin-bottom: 28px;
            }

            /* Forgot Input */

            .forgot-input-box {
                position: relative;
                margin-bottom: 20px;
            }

            .forgot-input-box input {
                width: 100%;
                height: 55px;

                border: none;
                outline: none;

                border-radius: 17px;

                background: rgba(255,255,255,0.10);

                border: 1px solid rgba(255,255,255,0.08);

                padding: 0 50px 0 18px;

                color: white;

                font-size: 15px;

                transition: 0.4s;
            }

            .forgot-input-box input:focus {
                border: 1px solid #00e5ff;

                box-shadow: 0 0 18px rgba(0,229,255,0.5);

                transform: translateY(-2px);
            }

            .forgot-input-box input::placeholder {
                color: #d7d7d7;
            }

            .forgot-input-box ion-icon {
                position: absolute;

                right: 18px;
                top: 16px;

                color: white;

                font-size: 22px;
            }

            /* Buttons Container */

            .forgot-buttons {
                display: flex;

                gap: 15px;

                margin-top: 25px;
            }

            /* Common Forgot Password Button */

            .forgot-buttons button {
                height: 52px;

                border: none;
                outline: none;

                border-radius: 16px;

                font-size: 15px;

                font-weight: 600;

                cursor: pointer;

                transition: 0.4s;
            }

            /* Cancel */

            .cancel-btn {
                width: 40%;

                background: rgba(255,255,255,0.10);

                border: 1px solid rgba(255,255,255,0.18) !important;

                color: white;
            }

            .cancel-btn:hover {
                background: rgba(255,255,255,0.20);

                transform: translateY(-3px);
            }

            /* Update */

            .update-btn {
                width: 60%;
                height: 52px;

                display: flex;

                justify-content: center;
                align-items: center;

                text-decoration: none;

                border-radius: 16px;

                background: linear-gradient(135deg, #00e5ff, #0072ff);

                color: white;

                font-size: 15px;
                font-weight: 600;

                cursor: pointer;

                transition: 0.4s;

                box-shadow: 0 0 20px rgba(0,229,255,0.35);
            }

            .update-btn:hover {
                transform: translateY(-3px);

                box-shadow: 0 0 30px rgba(0,229,255,0.65);
            }

            /* Responsive */

            @media(max-width: 500px) {

                .forgot-box {
                    width: 90%;
                    padding: 35px 25px;
                }
            }

        </style>

    </head>

    <body>

        <%

            String email = (String) request.getAttribute("emsg");
            String pass = (String) request.getAttribute("pmsg");
            String erremail = (String) request.getAttribute("errmsg");
            String enteredEmail = (String) request.getAttribute("enteredEmail");

        %>

        <div class="login-box">

            <!-- Logo -->

            <div class="logo-box">
                <div class="logo"></div>
            </div>

            <!-- Heading -->

            <h2>User Login</h2>

            <p class="sub-title">
                Welcome Back To AirGo Flight Booking
            </p>

            <!-- Login Form -->

            <form action="userLogin" method="post">

                <!-- Email -->

                <div class="input-box">

                    <% if (email != null) { %>

                        <div class="error">
                            <%= email %>
                        </div>

                    <% } %>

                    <input type="email"
                           name="email"
                           placeholder="Enter Email Address"
                           required>

                    <ion-icon name="mail-outline"></ion-icon>

                </div>

                <!-- Password -->

                <div class="input-box">

                    <% if (pass != null) { %>

                        <div class="error">
                            <%= pass %>
                        </div>

                    <% } %>

                    <input type="password"
                           name="password"
                           placeholder="Enter Password"
                           required>

                    <ion-icon name="lock-closed-outline"></ion-icon>

                </div>

                <!-- Remember Me -->

                <div class="options">

                    <label>

                        <input type="checkbox">

                        Remember Me

                    </label>

                    <a href="javascript:void(0)"
                       onclick="openForgotPassword()">

                        Forgot Password?

                    </a>

                </div>

                <!-- Button -->

                <button type="submit">
                    LOGIN NOW
                </button>

                <!-- Register -->

                <div class="register">

                    <p>

                        Don't have an account?

                        <a href="user-registration.jsp">
                            Register here
                        </a>

                    </p>

                </div>

            </form>

        </div>

        <!-- Icons -->

        <script type="module"
                src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js">
        </script>

        <script nomodule
                src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js">
        </script>

        <!-- Forgot Password Popup -->

        <div id="forgotPasswordModal"
             class="modal-overlay">

            <div class="forgot-box">

                <!-- Close Button -->

                <span class="close-btn"
                      onclick="closeForgotPassword()">

                    &times;

                </span>

                <!-- Logo -->

                <div class="forgot-logo-box">
                    <div class="forgot-logo"></div>
                </div>

                <!-- Heading -->

                <h2>
                    Reset Password
                </h2>

                <p class="forgot-subtitle">
                    Update your AirGo account password
                </p>

                <form action="forgetPassword"
                      method="post">

                    <!-- Email -->

                    <div class="forgot-input-box">

                        <% if (erremail != null) { %>

                            <div class="error">
                                <%= erremail %>
                            </div>

                        <% } %>

                        <input type="email"
                               id="forgotEmail"
                               name="email"
                               placeholder="Enter Email Address"
                               value="<%= enteredEmail != null ? enteredEmail : "" %>"
                               required>

                        <ion-icon name="mail-outline"></ion-icon>

                    </div>

                    <!-- New Password -->

                    <div class="forgot-input-box">

                        <input type="password"
                               id="newPassword"
                               name="newPassword"
                               placeholder="Enter New Password"
                               required>

                        <ion-icon name="lock-closed-outline"></ion-icon>

                    </div>

                    <!-- Buttons -->

                    <div class="forgot-buttons">

                        <button type="button"
                                class="cancel-btn"
                                onclick="closeForgotPassword()">

                            CANCEL

                        </button>

                        <button type="submit"
                                class="update-btn">
                            UPDATE
                        </button>

                    </div>

                </form>

            </div>

        </div>

        <script>

            function openForgotPassword() {

                document.getElementById("forgotPasswordModal").style.display = "flex";

            }

            function closeForgotPassword() {

                // Error message remove

                const error =
                    document.querySelector("#forgotPasswordModal .error");

                if (error) {
                    error.remove();
                }

                // Email blank

                document.getElementById("forgotEmail").value = "";

                // Password blank

                document.getElementById("newPassword").value = "";

                // Modal close

                document.getElementById("forgotPasswordModal").style.display = "none";

            }

            function updatePassword() {

                let email =
                    document.getElementById("forgotEmail").value;

                let password =
                    document.getElementById("newPassword").value;

                if (email === "" || password === "") {

                    alert("Please enter Email and New Password.");

                    return;
                }

                /*
                 * Yahan baad mein AJAX / form submission
                 * se UserController ko request bhejenge.
                 */

                alert("Password update request sent.");

            }

            <% if (erremail != null) { %>

                openForgotPassword();

            <% } %>

        </script>

    </body>
</html>