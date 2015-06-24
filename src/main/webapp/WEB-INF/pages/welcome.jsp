<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="row">
	<div class="large-12 large-centered columns">
		<nav class="breadcrumbs" role="navigation" aria-label="breadcrumbs">
			<li role="menuitem" class="current"><a href="/welcome"/><spring:message code = "welcome.label" /></li>
			<li role="menuitem" class="unavailable"><a href="/fdaData"/><spring:message code = "openPDA.label" /></li>
			<li role="menuitem" class="unavailable"><a href="/myData"/><spring:message code="myData.label" /></li>
		</nav>
	</div>
	<div class="large-12 medium-12 small-12 columns">
		<header><h1><b>${greeting}</b><small></small></h1></header>
		<h3><b>${title}</b></h3>
		<p>${message}</p>
	</div>
</div>