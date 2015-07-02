<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--<style> /* set the CSS */

path {
    stroke: steelblue;
    stroke-width: 1;
    fill: none;
}
.axis path, .axis line {
    fill: none;
    stroke: grey;
    stroke-width: 1;
    shape-rendering: crispEdges;
}
</style>--%>

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

    <!-- Content section -->
    <div class="large-10 large-centered medium-12 small-12 columns">
        <header><h1><b><spring:message code = "dataSet.title"/></b></h1></header>
        <h4><spring:message code = "dataSet.datatype"/>${currentDataSetListEntity.dataSetType}</h4>
        <h4><spring:message code = "dataSet.id"/>${currentDataSetListEntity.id}</h4>
        <p><c:out value="${errorMessage}" /></p>
    </div>

    <div class="large-10 large-centered medium-12 small-12 columns">
        <form accept-charset="UTF-8" name="form1" method="post" action="<c:url value="/viewDataSets"/>" id="form1">
            <div class="row">
                <div class="large-3 medium-12 small-12 columns">
                    <div class="row collapse prefix-radius">
                        <div class="large-2 medium-2 small-2 columns"><span class="prefix"><spring:message code="drugs.datefrom"/></span></div>
                        <div class="large-2 medium-2 small-2 columns end"><input type="text" value="<c:out value="${currentDataSetListEntity.startDate}"/>" data-date-format="mm/dd/yyyy" id="fromDate" name="fromDate" /></div>
                    </div>
                </div>
                <div class="large-3 medium-12 small-12 columns">
                    <div class="row collapse prefix-radius">
                        <div class="large-2 medium-2 small-2 columns"><span class="prefix"><spring:message code="drugs.dateto"/></span></div>
                        <div class="large-2 medium-2 small-2 columns end"><input type="text" value="<c:out value="${currentDataSetListEntity.endDate}"/>" data-date-format="mm/dd/yyyy" id="toDate" name="toDate"/></div>
                    </div>
                </div>
                <div class="large-3 medium-12 small-12 columns end">
                    <input type="submit"  name="reloadData" value="<spring:message code="viewdataset.reloaddata"/>" class="tiny button radius"/>
                    <input type="submit"  name="overwriteData" value="<spring:message code="viewdataset.overwritedate"/>" class="tiny button radius"/>
                </div>
                <input type="hidden" id="hasResult" name="hasResult" value="<c:out value="${hasResult}"/>" />
            </div>
        </form>
    </div>

    <div id="svghome" ></div>


</div>


<script src="http://d3js.org/d3.v3.min.js"></script>
<script>

    $(function(){
        $("#fromDate").fdatepicker();
        $("#toDate").fdatepicker();
    });

    var hasResult = document.getElementById("hasResult");
    if (hasResult.value == "yes"){
        drawChart();
    }
    // Set the dimensions of the canvas / graph
    function drawChart(){
        /*var margin = {top: 30, right: 20, bottom: 30, left: 50},*/
          /*width = 1200 - margin.left - margin.right,*/
          /*height = 600 - margin.top - margin.bottom;*/
        var margin = {top: 30, right: 20, bottom: 50, left: 80},
                width = $(window).width() - margin.left - margin.right,
                height = $(window).height() - margin.top - margin.bottom;

        // Parse the date / time
        var parseDate = d3.time.format("%Y%m%d").parse;

        // Set the ranges
        var x = d3.time.scale().range([0, width]);
        var y = d3.scale.linear().range([height, 0]);

        // Define the axes
        var xAxis = d3.svg.axis().scale(x)
                .orient("bottom").ticks(5);

        var yAxis = d3.svg.axis().scale(y)
                .orient("left").ticks(5);

        // Define the line
        var valueline = d3.svg.line()
                .x(function(d) { return x(d.time); })
                .y(function(d) { return y(d.count); });

        // Adds the svg canvas
        var svg = d3.select("#svghome")
                .append("svg")
                .attr("width", width + margin.left + margin.right)
                .attr("height", height + margin.top + margin.bottom)
                .append("g")
                .attr("transform",
                "translate(" + margin.left + "," + margin.top + ")");

        // Get the data
        var data = null;
        <c:if test="${not empty ResultSet}">
           data = ${ResultSet};
        </c:if>

        data.forEach(function(d) {
            d.time = parseDate(d.time);
            d.count = +d.count;
        });

        // Scale the range of the data
        x.domain(d3.extent(data, function(d) { return d.time; }));
        y.domain([0, d3.max(data, function(d) { return d.count; })]);

        // Add the valueline path.
        svg.append("path")
                .attr("class", "line")
                .attr("d", valueline(data));

        // Add the X Axis
        svg.append("g")
                .attr("class", "x axis")
                .attr("transform", "translate(0," + height + ")")
                .call(xAxis);

        // Add the Y Axis
        svg.append("g")
                .attr("class", "y axis")
                .call(yAxis);
    }
</script>

