<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="row">
	<div class="large-10 large-centered medium-12 small-12 columns">
		<br />
		<nav class="breadcrumbs" role="navigation">
			<a class="current" href="<c:url value="/welcome"/>"><spring:message code="welcome.label" /></a>
			<a class="unavailable" href="<c:url value="/fdaData"/>"><spring:message code = "openPDA.label" /></a>
			<a class="unavailable" href="<c:url value="/myData"/>"><spring:message code="myData.label" /></a>
		</nav>
	</div>
	<div class="large-10 large-centered medium-12 small-12 columns">
		<header><h1><b>${greeting}</b><small></small></h1></header>
		<h3><b>${title}</b></h3>
		<p>${message}</p>
	</div>
</div>