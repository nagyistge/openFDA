<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: ehung
  Date: 6/20/2015
  Time: 8:57 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>

<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title><tiles:insertAttribute name="title" /></title>

  <!-- CSS -->
  <link href="<c:url value="/theme/css/normalize.css" />" rel="stylesheet">
  <link href="<c:url value="/theme/css/slick/style.css" />" rel="stylesheet">
  <link href="<c:url value="/theme/css/animate.min.css" />" rel="stylesheet">
  <link href="<c:url value="/theme/css/font-awesome.min.css" />" rel="stylesheet">
  <link href="<c:url value="/theme/lib/hovericon/css/component.css" />" rel="stylesheet">
  <link href="<c:url value="/theme/css/foundation.css" />" rel="stylesheet">
  <link href="<c:url value="/theme/css/style.css" />" rel="stylesheet">
  <link href="<c:url value="/theme/css/style-responsive.css" />" rel="stylesheet">
  <%--<link href="<c:url value="/css/jquery-ui.css" />" rel="stylesheet">--%>
  <link href="<c:url value="/css/foundation.datepicker.css" />" rel="stylesheet">
  <!--Override CSS-->
  <link href="<c:url value="/css/app.css" />" rel="stylesheet">
</head>

<body>
  <!--Foundation Requirements-->
  <script src="<c:url value="/theme/js/vendor/jquery.js" />" ></script>
  <script src="<c:url value="/theme/js/vendor/modernizr.js" />" ></script>
  <script src="<c:url value="/theme/js/vendor/fastclick.js" />" ></script>
  <script src="<c:url value="/theme/js/vendor/jquery.cookie.js" />" ></script>
  <script src="<c:url value="/theme/js/vendor/placeholder.js" />" ></script>
  <script src="<c:url value="/theme/js/foundation.min.js" />" ></script>
  <%--<script src="<c:url value="/lib/jquery-ui.js" />" ></script>--%>
  <script src="<c:url value="/lib/foundation.datepicker.js" />" ></script>

  <div id="wrapper" class="container">
    <!-- header section -->
    <div id="header">

      <!-- top bar section -->
      <nav class="top-bar" data-topbar role="navigation">
        <ul class="title-area">
          <li class="name">
            <a href="search" data-toggle="tooltip" title="Home"></a>
          </li>
          <li class="toggle-topbar menu-icon">
            <a href="#"><span>Menu Items</span></a>
          </li>
        </ul>
        <section class="top-bar-section">
          <tiles:insertAttribute name="menu" />
        </section>
      </nav>
    </div>

    <div class="row">
      <div id="content-row" class="large-12 columns">
        <tiles:insertAttribute name="body" />
      </div>
    </div>
    <div id="footer">
      <tiles:insertAttribute name="footer" />
    </div>
  </div>

  <!-- Landing Page Requirements -->
  <script src="<c:url value="/lib/jquery.throttle-debounce.js" />"></script>
  <script src="<c:url value="/lib/jquery.smooth-scroll.min.js" />"></script>
  <script src="<c:url value="/lib/parallax/jquery.parallax-1.1.3.js" />"></script>
  <script src="<c:url value="/lib/parallax/TweenMax.min.js" />"></script>
  <script src="<c:url value="/lib/parallax/jquery.superscrollorama.js" />"></script>
  <script src="<c:url value="/lib/jquery.backstretch.min.js" />"></script>
  <script src="<c:url value="/lib/jquery-scrollspy.js" />"></script>
  <script src="<c:url value="/lib/jquery.shuffle.js" />"></script>
  <script src="<c:url value="/lib/slick.min.js" />"></script>
  <script src="<c:url value="/theme/js/agency-nyc.js" />"></script>
  <script>
    $(document).foundation();
  </script>

</body>

</html>
