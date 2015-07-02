<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="center">
    <div class="row">
        <div class="large-6 medium-12 small-12 columns">
            <%--<img src="<c:url value="/img/WSI_Logo.png"/>" style="width:50%;height:50%;">--%>
        </div>
        <div class="large-6 medium-12 small-12 columns">
            <h1><b><spring:message code="404.title" /></b></h1>
            <p><spring:message code = "404.message" /></p>
            <p><spring:message code = "404.suggestion" /></p>
            <p><spring:message code = "404.contact" /></p>
        </div>
    </div>
</div>