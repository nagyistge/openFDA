<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Existing Data Set Lists</h3>
<c:if test="${!empty dataSetListsEntityList}">
    <table >
        <tr>
            <th >Data Set List ID</th>
            <th >Note</th>
            <th >Date Type</th>
            <th >Start Date</th>
            <th >End Date</th>
            <th >Meta Data</th>
            <th >View</th>
            <th >Delete</th>
        </tr>
        <c:forEach items="${dataSetListsEntityList}" var="dataSetListItem">
            <tr>
                <td>${dataSetListItem.id}</td>
                <td>${dataSetListItem.notes}</td>
                <td>${dataSetListItem.dataSetType}</td>
                <td>${dataSetListItem.startDate}</td>
                <td>${dataSetListItem.endDate}</td>
                <td>${dataSetListItem.metadata}</td>
                <td><a href="<c:url value='/viewDataSets/${dataSetListItem.id}' />" >View</a></td>
                <td><a href="<c:url value='/deleteDataSets/${dataSetListItem.id}' />" >Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>