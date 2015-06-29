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
<script src="<c:url value="/theme/js/foundation/foundation.tab.js" />" ></script>

<!-- Left Nav. Section -->
<ul class="left">

    <!-- Home Button -->
    <li><a href="<c:url value="/welcome" />"><spring:message code="menu.item.home" /></a></li>
    <li class="divider"></li>

    <!-- OpenFDA Data Button -->
    <li class="has-dropdown"><a href=""><spring:message code="menu.item.openfda" /></a>
        <ul class="dropdown">
            <li class="divider"></li>
            <li><label><spring:message code = "menu.label.dataset" /></label></li>
            <li class="divider"></li>
            <li><a href="<c:url value="/drugs"/>"><spring:message code="menu.datasets.drugs" /></a></li>
            <li><a href="<c:url value="/devices"/>"><spring:message code="menu.datasets.devices" /></a></li>
            <li><a href="<c:url value="/foods"/>"><spring:message code="menu.datasets.foods" /></a></li>
        </ul>
    </li>
    <li class="divider"></li>

    <!-- My Data Button -->
    <li><a href="#"><spring:message code="menu.item.mySavedData" /></a></li>
</ul>

<!-- Right Nav. Section -->
<ul class="right">

  <!-- Login/Logout Button -->
  <li><a href="<c:url value="j_spring_security_logout"/>"><spring:message code="menu.item.logout" /></a></li>
  <li class="divider"></li>

  <!-- Language Button with dropdown -->
  <li class="has-dropdown"><a href=""><spring:message code="menu.language" /></a>
          <ul class="dropdown">
              <li><a href="?language=en"><spring:message code = "language.english" /></a></li>
              <li><a href="?language=es"><spring:message code = "language.spanish" /></a></li>
          </ul>
  </li>
</ul>
