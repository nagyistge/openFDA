<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="large-12 medium-12 small-12 columns">
		<header><h1><b><spring:message code = "openfda.header" /></b></h1></header>
		<h1><small>${message}</small></h1>
		<input type="submit" class="tiny button radius" value="<spring:message code="button.submit"/>">
	</div>
</div>
<%--<h1>Get FDA Data</h1>
<h1>${message}</h1>
<small>New item 1</small>
<a href="<c:url value='/getFdaData'/>" onclick="" class="tiny button radius">submit</a>--%>
