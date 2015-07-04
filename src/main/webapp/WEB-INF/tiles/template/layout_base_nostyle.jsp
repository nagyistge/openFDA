<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

  <!-- CSS -->
  <%-- <link href="<c:url value="/resources/foundation/css/normalize.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/foundation/css/slick/style.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/foundation/css/animate.min.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/foundation/css/font-awesome.min.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/foundation/lib/hovericon/css/component.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/foundation/css/foundation.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/foundation/css/style.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/foundation/css/style-responsive.css" />" rel="stylesheet">--%>

  <!--Override CSS-->
  <%--<link href="<c:url value="/resources/css/app.css" />" rel="stylesheet">--%>
    </head>


  <!--Foundation Requirements-->
<%--  <script src="<c:url value="/resources/foundation/js/vendor/jquery.js" />" />
  <script src="<c:url value="/resources/foundation/js/vendor/modernizr.js" />" />
  <script src="<c:url value="/resources/foundation/js/vendor/fastclick.js" />" />
  <script src="<c:url value="/resources/foundation/js/vendor/jquery.cookie.js" />" />
  <script src="<c:url value="/resources/foundation/js/vendor/placeholder.js" />" />
  <script src="<c:url value="/resources/foundation/js/foundation.min.js" />" />--%>

  <div id="wrapper" class="container" style="border: #1c1c1c solid 1px; border-radius: 10px;">
    <div id="header"></div>
    <div class="row">
      <div id="content-row" class="large-12 columns">
        <tiles:insertAttribute name="body" />
      </div>
    </div>
  </div>

  <!-- Landing Page Requirements -->
 <%-- <script src="<c:url value="/resources/lib/jquery.throttle-debounce.js" />"></script>
  <script src="<c:url value="/resources/lib/jquery.smooth-scroll.min.js" />"></script>
  <script src="<c:url value="/resources/lib/parallax/jquery.parallax-1.1.3.js" />"></script>
  <script src="<c:url value="/resources/lib/parallax/TweenMax.min.js" />"></script>
  <script src="<c:url value="/resources/lib/parallax/jquery.superscrollorama.js" />"></script>
  <script src="<c:url value="/resources/lib/jquery.backstretch.min.js" />"></script>
  <script src="<c:url value="/resources/lib/jquery-scrollspy.js" />"></script>
  <script src="<c:url value="/resources/lib/jquery.shuffle.js" />"></script>
  <script src="<c:url value="/resources/lib/slick.min.js" />"></script>
  <script src="<c:url value="/resources/foundation/js/agency-nyc.js" />"></script>--%>
  <script>
    $(document).foundation();
  </script>

</body>

</html>
