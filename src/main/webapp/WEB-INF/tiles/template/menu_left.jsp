<%--
  Created by IntelliJ IDEA.
  User: ehung
  Date: 6/22/2015
  Time: 10:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="<c:url value="/theme/js/foundation/foundation.js" />" ></script>
<script src="<c:url value="/theme/js/foundation/foundation.topbar.js" />" ></script>

<!-- Left Nav. Section -->
<ul class="left">

  <!-- Home Button -->
  <li><a href="#"><spring:message code="menu.item.home" /></a></li>
  <li class="divider"></li>

  <!-- Openfda Button -->
  <li><a href="#"><spring:message code="menu.item.openfda" /></a></li>
  <li class="divider"></li>

  <!-- My Data Button -->
  <li><a href="#"><spring:message code="menu.item.mydata" /></a></li>

</ul>