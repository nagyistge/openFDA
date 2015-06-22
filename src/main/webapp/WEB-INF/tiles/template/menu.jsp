<%--
  Created by IntelliJ IDEA.
  User: ehung
  Date: 6/22/2015
  Time: 10:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="/foundation/js/foundation/foundation.js"></script>
<script src="/foundation/js/foundation/foundation.topbar.js"></script>

<ul class="right">

  <!-- Login/Logout Button -->
  <li><a href="#"><spring:message code="menu.item.logout" /></a></li>
  <li class="divider"></li>

  <!-- Button 1 -->
  <li class="has-dropdown">
    <a href="#"><spring:message code="menu.item1" /></a>
    <ul class="dropdown">
      <li><a href="item1"><spring:message code="item1.subItem1" /></a></li>
    </ul>
  </li>

  <li class="divider"></li>

  <!-- Button 2 -->
  <li class="has-dropdown"><a href="#"><spring:message code="menu.item2" /></a>
    <ul class="dropdown">
      <li><a href="item2"><spring:message code="item2.subItem1" /></a></li>
    </ul>
  </li>

  <!-- Language Button -->
  <li class="has-dropdown"><a href="#"><spring:message code="menu.language" /></a>
          <ul class="dropdown">
              <li><a href="?language=en"><spring:message code = "language.english" /></a></li>
              <li><a href="?language=es"><spring:message code = "language.spanish" /></a></li>
          </ul>
  </li>
</ul>