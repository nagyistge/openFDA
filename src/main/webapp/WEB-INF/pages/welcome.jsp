<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="row">
	<div class="large-10 large-centered medium-12 small-12 columns">
		<div class="right">
			<label>Logged in as: ${currentLoggedUsername}</label>
		</div>
		<br />
		<nav class="breadcrumbs" role="navigation">
			<li role="label"><spring:message code="breadcrumbs.label" /></li>
			<li role="menuitem"><a class="current" href="<c:url value="/welcome"/>"><spring:message code="welcome.label" /></a></li>
		</nav>
	</div>
	<div class="large-10 large-centered medium-12 small-12 columns">
		<header><h1><b><c:out value="${greeting}" /></b></h1></header>
		<h3><b><c:out value="${topic1}" /></b></h3>
		<p><c:out value="${message1}" /></p>
		<h3><b><c:out value="${topic2}" /></b></h3>
		<p><c:out value="${message2}" /></p>
		<h3><b><c:out value="${topic3}" /></b></h3>
		<p><c:out value="${message3}" /></p>
	</div>
</div>