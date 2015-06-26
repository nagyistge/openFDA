<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="row">
	<div class="large-10 large-centered medium-12 small-12 columns">
		<br />
		<nav class="breadcrumbs" role="navigation">
			<a class="current" href="<c:url value="/welcome"/>"><spring:message code="welcome.label" /></a>

		</nav>
	</div>
	<div class="large-10 large-centered medium-12 small-12 columns">
		<header><h1><b>${greeting}</b></h1></header>
		<h3><b>${topic1}</b></h3>
		<p>${message1}</p>
		<h3><b>${topic2}</b></h3>
		<p>${message2}</p>
	</div>
</div>