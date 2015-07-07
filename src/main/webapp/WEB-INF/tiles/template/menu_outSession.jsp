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
<script src="<c:url value="/theme/js/vendor/jquery.js" />" ></script>
<script src="<c:url value="/theme/js/foundation.min.js" />" ></script>
<script src="<c:url value="/theme/js/foundation/foundation.offcanvas.js" />" ></script>

<!-- Before Login Menu -->
<!-- Right Menu only show on large and medium screen -->
<nav class="top-bar hide-for-small" data-topbar role="navigation">
  <section class="top-bar-section">
    <ul class="right">
      <!-- Login Button -->
      <li><a href="/"><spring:message code="menu.item.login" /></a></li>
      <li class="divider"></li>
      <!-- Language Button -->
      <li class="has-dropdown"><a href="#"><spring:message code="menu.language" /></a>
        <ul class="dropdown">
          <li><a href="?language=en"><spring:message code = "language.english" /></a></li>
        </ul>
      </li>
    </ul>
  </section>
</nav>

<!-- right menu shows for small screen only -->
<div class="page">
  <div class="off-canvas-wrap show-for-small-only" data-offcanvas>
    <div class="inner-wrap">
      <nav class="tab-bar">
        <section class="tab-bar-section">
          <h1 class="title"><spring:message code = "menu.menu.label" /></h1>
        </section>
        <section class="right-small">
          <a class="right-off-canvas-toggle menu-icon">
            <span></span>
          </a>
        </section>
      </nav>

      <aside class="right-off-canvas-menu">
        <ul class="off-canvas-list">
          <li><a href="/"><spring:message code="menu.item.login" /></a></li>
          <!-- Language Button -->
          <li class="has-submenu"><a href="#"><spring:message code="menu.language" /></a>
            <ul class="right-submenu">
              <li class="back"><a href="#"><spring:message code = "menu.back.button" /></a></li>
              <li><a href="?language=en"><spring:message code = "language.english" /></a></li>
            </ul>
          </li>
        </ul>
      </aside>

    <section class="main-section"></section>

    <a class="exit-off-canvas" href="#"></a>
    </div>
  </div>
</div>