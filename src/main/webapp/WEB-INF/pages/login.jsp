<%--
  Created by IntelliJ IDEA.
  User: yipty
  Date: 6/19/2015
  Time: 4:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
    <div class="large-3 medium-12 small-12 columns">
        <h1><img src="<c:url value="/img/WSI_Logo.png"/>" alt="Washington Software Logo" ></h1>
        <div class="panel">
            <form name="loginForm" action="<c:url value="j_spring_security_check" />" method="POST">
                <header><h3><b><spring:message code="login.header" /></b></h3></header>
                <label><spring:message code = "login.label.username" /></label>
                <input type="text" name="j_username" value="" placeholder="<spring:message code = "login.placeholder.username" />" required />
                <label><spring:message code = "login.label.password" /></label>
                <input type="password" name="j_password" value="" autocomplete="off" placeholder="<spring:message code = "login.placeholder.password" />" required />
                <c:if test="${not empty error}">
                    <div class="error"><c:out value="${error}" /></div>
                </c:if>
                <c:if test="${not empty msg}">
                    <div class="msg"><c:out value="${msg}" /></div>
                </c:if>
                <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
                    <font color="red"><spring:message code = "login.failAttempt.alert" />
                        <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />.
                    </font>
                </c:if>
                <input type="submit" name="submit" value="<spring:message code="button.submit" />" class="tiny blue radius button" />
                <br />
            </form>
        </div>
    </div>

    <!-- right panel -->
    <div class="large-9 medium-12 small-12 end columns">
        <br /><br />
        <header><h1><b><spring:message code = "home.greeting" /></b></h1></header>
        <h3><b><spring:message code = "home.topic.aboutUs" /></b></h3>
        <p><spring:message code = "home.aboutUs.introduction" /></p>
        <h3><b><spring:message code = "home.topic.whoMadeOpenFDAPortal" /></b></h3>
        <p><spring:message code = "home.whoMadeOpenFDAPortal" /></p>
        <h3><b><spring:message code = "home.topic.whatCanOpenFDAPortalDo" /></b></h3>
        <p><spring:message code = "home.whatCanOpenFDAPortalDo" /></p>
    </div>
</div>

<script>
    $(document).ready(function(){
        document.loginForm.username.focus();
    });
</script>

