<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
 @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap');
*{
    margin: 0;
    padding: 0;
    font-family: 'poppins',sans-serif;
}
section{
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    width: 100%;
    
    background: url("image/AirGo.jpg") no-repeat;
    background-position: center;
    background-size: cover;
}
.form-box{
    position: relative;
    width: 400px;
    height: 450px;
    background: transparent;
    border: 2px solid rgba(255,255,255,0.5);
    border-radius: 20px;
    backdrop-filter: blur(5px);
    display: flex;
    justify-content: center;
    align-items: center;

}
h2{
    font-size: 2em;
    color: #fff;
    text-align: center;
}
.inputbox{
    position: relative;
    margin: 30px 0;
    width: 310px;
    border-bottom: 2px solid #fff;
}
.inputbox label{
    position: absolute;
    top: 50%;
    left: 5px;
    transform: translateY(-50%);
    color: #fff;
    font-size: 1em;
    pointer-events: none;
    transition: .5s;
}
input:focus ~ label,
input:valid ~ label{
top: -5px;
}
.inputbox input {
    width: 100%;
    height: 50px;
    background: transparent;
    border: none;
    outline: none;
    font-size: 1em;
    padding:0 35px 0 5px;
    color: #fff;
}
.inputbox ion-icon{
    position: absolute;
    right: 8px;
    color: #fff;
    font-size: 1.2em;
    top: 20px;
}
.forget{
    margin: -15px 0 15px ;
    font-size: .9em;
    color: #fff;
    display: flex;
    justify-content: space-between;  
}

.forget label input{
    margin-right: 3px;
    
}
.forget label a{
    color: #fff;
    text-decoration: none;
}
.forget label a:hover{
    text-decoration: underline;
}
button{
    width: 100%;
    height: 40px;
    border-radius: 40px;
    background: #fff;
    border: none;
    outline: none;
    cursor: pointer;
    font-size: 1em;
    font-weight: 600;
}
.register{
    font-size: .9em;
    color: #fff;
    text-align: center;
    margin: 25px 0 10px;
}
.register p a{
    text-decoration: none;
    color: #fff;
    font-weight: 600;
}
.register p a:hover{
    text-decoration: underline;
}

</style>
</head>
<body>
    <%
		String email = (String)request.getAttribute("email");
		String pass = (String)request.getAttribute("pass");
	%>
    <section>
        <div class="form-box">
            <div class="form-value">
                <form action="loginAdmin" method="post">
                    <h2>Login</h2>
                    <div class="inputbox">
                        <ion-icon name="mail-outline"></ion-icon>
                        <%if(email!=null){ %>
        					<h6 style="color: red"><%=email %></h6>
        				<%} %>
                        <input type="email" required name="email">
                        <label for="">Email</label>
                    </div>
                    <div class="inputbox">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                        <%if(pass!=null){ %>
        					<h6 style="color: red"><%=pass %></h6>
        				<%} %>
                        <input type="password" required name="password">
                        <label for="">Password</label>
                    </div>
                    <div class="forget">
                        <label for=""><input type="checkbox">Remember Me<a href="#">Forget Password</a></label>
                      
                    </div>
                    <button>Log in</button>
                    <div class="register">
                        <p>Don't have a account <a href="#">Register</a></p>
                    </div>
                    
                </form>
            </div>
        </div>
    </section>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>