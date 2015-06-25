<%--
  Created by IntelliJ IDEA.
  User: ehung
  Date: 6/22/2015
  Time: 9:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="<c:url value="/css/webicons-master/webicons.scss" />" rel="stylesheet">

<footer class="large-12 columns">
  <div class="large-6 medium-10 small-12 columns">
    <p>
      <b><spring:message code="footer.copyRight.text" /></b><br />
      <a href="mailto:info@wasoftware.com?subject=Mail from the site."><spring:message code="footer.contact.text" /></a>
    </p>
  </div>

  <div class="large-6 medium-10 small-12 columns">
    <div class="row text-right">
      <div class="large-11 large-push-1 medium-10 small-12 columns">
        <a href="#" class="fc-webicons facebook" data-toggle="tooltip" title="<spring:message code = "footer.soicalIcon.fackbook"/>">
          <img src="<c:url value="/css/webicons-master/webicons/webicon-facebook.svg" />" id="facebook-icon" width=5% height=5% >
        </a>
        <a href="#" class="fc-webicons twitter" data-toggle="tooltip" title="<spring:message code = "footer.soicalIcon.twitter"/>">
          <img src="<c:url value="/css/webicons-master/webicons/webicon-twitter.svg" />" id="twitter-icon" width=5% height=5% >
        </a>
        <a href="#" class="fc-webicons linkedin" data-toggle="tooltip" title="<spring:message code = "footer.soicalIcon.linkedin"/>">
          <img src="<c:url value="/css/webicons-master/webicons/webicon-linkedin.svg" />" id="linkedin-icon" width=5% height=5% >
        </a>
      </div>
    </div>
  </div>
</footer>


