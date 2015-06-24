<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="row">
	<div class="large-12 large-centered columns">
		<br />
		<nav class="breadcrumbs" role="navigation">
			<li class="current"><a href="<c:url value="/welcome"/>"></a><spring:message code = "welcome.label" /></li>
			<li class="unavailable"><a href="<c:url value="/fdaData"/>"></a><spring:message code = "openPDA.label" /></li>
			<li class="unavailable"><a href="<c:url value="/myData"/>"></a><spring:message code="myData.label" /></li>
		</nav>
		<br />
	</div>
	<div class="large-12 medium-12 small-12 columns">
		<header><h1><b>${greeting}</b><small></small></h1></header>
		<h3><b>${title}</b></h3>
		<p>${message}</p>
	</div>
</div>