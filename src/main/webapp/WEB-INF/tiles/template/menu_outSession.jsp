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

<!-- Before Login Menu -->
<!-- Right Nav. Section -->
<ul class="right">

  <!-- Login Button -->
  <li><a href="/"><spring:message code="menu.item.login" /></a></li>
  <li class="divider"></li>

  <!-- Language Button -->
  <li class="has-dropdown"><a href="#"><spring:message code="menu.language" /></a>
    <ul class="dropdown">
      <li><a href="?language=en"><spring:message code = "language.english" /></a></li>
      <li><a href="?language=es"><spring:message code = "language.spanish" /></a></li>
    </ul>
  </li>
</ul>
