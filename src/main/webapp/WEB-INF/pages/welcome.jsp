<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="row">
	<nav class="breadcrumbs" role="navigation" aria-label="breadcrumbs">
		<li role="menuitem" class="current"><a href="/welcome"/></li>
		<li role="menuitem" class="unavailable"><a href="/fdaData"/></li>
		<li role="menuitem" class="unavailable"><a href="/myData"/></li>
	</nav>
	<div class="large-12 medium-12 small-12 columns">
		<header><h1><b>${greeting}</b><small></small></h1></header>
		<h2>${title}</h2>
		<p>${message}</p>
	</div>
</div>