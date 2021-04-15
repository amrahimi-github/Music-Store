<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_Style.css"/>
</head>
<body class="align">
<audio id="mySong" src="${pageContext.request.contextPath}/resources/mp3/click.mp3"></audio>
<c:if test="${not empty userR}">
    <span>
        <span id="listen" onmouseover="PlaySound('mySong')" onmouseout="StopSound('mySong')">LISTEN</span>
        <span id="best" onmouseover="PlaySound('mySong')" onmouseout="StopSound('mySong')">BEST</span>
        <span id="music" onmouseover="PlaySound('mySong')" onmouseout="StopSound('mySong')">MUSIC</span>
    </span>
    <span><br></span>
    <c:set var="userHolder" value="Username"> </c:set>
    <c:set var="passHolder" value="Password"> </c:set>
</c:if>
<c:if test="${not empty adminR}">
    <span>ADMINISTRATOR</span>
    <span><br></span>
    <c:set var="userHolder" value="Username <admin>"> </c:set>
    <c:set var="passHolder" value="Password <admin>"> </c:set>
</c:if>
<div class="grid">
    <form method="post" class="form login">
        <div class="form__field">
            <label for="login__username">
                <svg class="icon">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user"></use>
                </svg>
                <span class="hidden">Username</span></label>
            <input id="login__username" type="text" name="userName" class="form__input" placeholder="${userHolder}"
                   required>
        </div>
        <div class="form__field">
            <label for="login__password">
                <svg class="icon">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#lock"></use>
                </svg>
                <span class="hidden">Password</span></label>
            <input id="login__password" type="password" name="password" class="form__input" placeholder="${passHolder}"
                   required>
        </div>
        <div class="form__field">
            <input type="submit" onclick="return check(this.form)" value="Sign In">
        </div>
    </form>
    <p class="text--center">
        <a id="home" href="${pageContext.request.contextPath}">#Home</a>
        <c:if test="${not empty userR}">
            ----
            <a id="forget" href="${pageContext.request.contextPath}/authenticate/profileRecovery">#Forget
                Username/Password</a>
        </c:if>
    </p>
</div>
<svg xmlns="http://www.w3.org/2000/svg" class="icons">
    <symbol id="arrow-right" viewBox="0 0 1792 1792">
        <path d="M1600 960q0 54-37 91l-651 651q-39 37-91 37-51 0-90-37l-75-75q-38-38-38-91t38-91l293-293H245q-52 0-84.5-37.5T128 1024V896q0-53 32.5-90.5T245 768h704L656 474q-38-36-38-90t38-90l75-75q38-38 90-38 53 0 91 38l651 651q37 35 37 90z"></path>
    </symbol>
    <symbol id="lock" viewBox="0 0 1792 1792">
        <path d="M640 768h512V576q0-106-75-181t-181-75-181 75-75 181v192zm832 96v576q0 40-28 68t-68 28H416q-40 0-68-28t-28-68V864q0-40 28-68t68-28h32V576q0-184 132-316t316-132 316 132 132 316v192h32q40 0 68 28t28 68z"></path>
    </symbol>
    <symbol id="user" viewBox="0 0 1792 1792">
        <path d="M1600 1405q0 120-73 189.5t-194 69.5H459q-121 0-194-69.5T192 1405q0-53 3.5-103.5t14-109T236 1084t43-97.5 62-81 85.5-53.5T538 832q9 0 42 21.5t74.5 48 108 48T896 971t133.5-21.5 108-48 74.5-48 42-21.5q61 0 111.5 20t85.5 53.5 62 81 43 97.5 26.5 108.5 14 109 3.5 103.5zm-320-893q0 159-112.5 271.5T896 896 624.5 783.5 512 512t112.5-271.5T896 128t271.5 112.5T1280 512z"></path>
    </symbol>
</svg>
</body>
<c:if test="${not empty registeredSuccessfully}">
    <script>
        alert("${registeredSuccessfully}");
    </script>
</c:if>
<c:if test="${not empty passwordSuccessfullyChanged}">
    <script>
        alert("${passwordSuccessfullyChanged}");
    </script>
</c:if>
<c:if test="${ not empty invalidInput}">
    <script>
        alert("${invalidInput}");
    </script>
</c:if>
<script>
    function PlaySound(mySound) {
        const sound = document.getElementById(mySound);
        sound.play();
    }

    function StopSound(mySound) {
        const sound = document.getElementById(mySound);
        sound.pause();
        sound.currentTime = 0;
    }
</script>
</html>