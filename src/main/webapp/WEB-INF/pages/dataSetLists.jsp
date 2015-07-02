<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">

    <!-- Breadcrumbs section -->
    <div class="large-10 large-centered medium-12 small-12 columns">
        <br />
        <nav class="breadcrumbs" role="navigation">
            <li role="label"><spring:message code="breadcrumbs.label" /></li>
            <li><a class="" href="<c:url value="/welcome"/>"><spring:message code = "welcome.label" /></a></li>
            <li><a class="" href="<c:url value="/dataSetLists"/>"><spring:message code = "dataSetList.title"/></a></li>
            <li><a class="current" href=""><spring:message code = "dataSet.title"/></a></li>
        </nav>
    </div>

    <!-- Content Section -->
    <div class="large-10 large-centered medium-12 small-12 columns">
       <h3><spring:message code="dataSetList.title"/></h3>
       <c:if test="${!empty dataSetListsEntityList}">
           <table >
               <tr>
                   <th><spring:message code="dataSetList.column1"/></th>
                   <th><spring:message code="dataSetList.column2"/></th>
                   <th><spring:message code="dataSetList.column3"/></th>
                   <th><spring:message code="dataSetList.column4"/></th>
                   <th><spring:message code="dataSetList.column5"/></th>
                   <th><spring:message code="dataSetList.column6"/></th>
                   <th><spring:message code="dataSetList.column7"/></th>
                   <th><spring:message code="dataSetList.column8"/></th>
               </tr>
               <c:forEach items="${dataSetListsEntityList}" var="dataSetListItem">
                   <tr>
                       <td>${dataSetListItem.id}</td>
                       <td>${dataSetListItem.notes}</td>
                       <td>${dataSetListItem.dataSetType}</td>
                       <td>${dataSetListItem.startDate}</td>
                       <td>${dataSetListItem.endDate}</td>
                       <td>${dataSetListItem.metadata}</td>
                       <td><a href="<c:url value='/viewDataSets/${dataSetListItem.id}' />" ><spring:message code="dataSetList.column7"/></a></td>
                       <td><a href="<c:url value='/deleteDataSets/${dataSetListItem.id}' />" ><spring:message code="dataSetList.column8"/></a></td>
                   </tr>
               </c:forEach>
           </table>
       </c:if>
       <c:if test="${empty dataSetListsEntityList}">
           <spring:message code="drugs.nodata"/>
       </c:if>
   </div>
</div>