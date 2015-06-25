<%--
  Created by IntelliJ IDEA.
  User: yipty
  Date: 6/19/2015
  Time: 4:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="center">
    <div class="row">
        <div class="large-6 large-push-2 medium-10 small-10 columns">
            <br /><br /><br />
            <img src="/img/WSI_Logo.png" style="width:50%;height:50%;">
            <%--<img src="/img/l_openFDA.png">--%>
        </div>
        <div class="divider"></div>
        <div class="large-6 medium-10 small-10 columns">
            <div id="login-box" class="row">
                <form name="loginForm" action="<c:url value="j_spring_security_check" />" method="POST">
                    <div class="row">
                        <div class="large-6 medium-10 small-10 columns">
                            <br />
                            <header><h1><b><spring:message code="login.header" /></b></h1></header>
                        </div>
                    </div>
                    <div class="row">
                        <div class="large-6 medium-10 small-10 columns">
                            <label><spring:message code = "login.label.username" /></label>
                            <input type="text" name="j_username" value="" placeholder="<spring:message code = "login.placeholder.username" />" />
                            <label><spring:message code = "login.label.password" /></label>
                            <input type="password" name="j_password" value="" placeholder="<spring:message code = "login.placeholder.password" />" />
                            <c:if test="${not empty error}">
                                <div class="error">${error}</div>
                            </c:if>
                            <c:if test="${not empty msg}">
                                <div class="msg">${msg}</div>
                            </c:if>
                            <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
                                <font color="red"><spring:message code = "login.failAttempt.alert" />
                                    <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />.
                                </font>
                            </c:if>
                            <input type="submit" name="submit" value="<spring:message code="button.submit" />" class="tiny blue radius button" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        document.loginForm.username.focus();
    });
</script>

<%--<html>
<head>
    <title>Login</title>
</head>
<body onload='document.loginForm.username.focus();'>

<h1>OpenFDA</h1>

<div id="login-box">

    <h2>Login</h2>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
    <c:if test="${not empty msg}">
        <div class="msg">${msg}</div>
    </c:if>

    <form name='loginForm'
          action="<c:url value='j_spring_security_check'/>"
          method='POST'>

        <table>
            <tr>
                <td>User:</td>
                <td><input type='text' name='j_username' value=''></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type='password' name='j_password'/></td>
            </tr>
            <tr>
                <td colspan='2'><input name="submit" type="submit"
                                       value="submit"/></td>
            </tr>
        </table>

        <!--<input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}"/>-->

    </form>
</div>

</body>
</html>--%>
