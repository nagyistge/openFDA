<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="row">
	<div class="large-12 medium-12 small-12 columns">
		<header><h1><b><spring:message code = "home.greeting" /></b><small></small></h1></header>
		<h2><spring:message code = "home.title" /></h2>
		<p>${message}</p>
	</div>
</div>


