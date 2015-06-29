<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style> /* set the CSS */

path {
    stroke: steelblue;
    stroke-width: 1;
    fill: none;
}
.axis path,
.axis line {
    fill: none;
    stroke: grey;
    stroke-width: 1;
    shape-rendering: crispEdges;
}
</style>

<div class="row">
	<!-- Breadcrumbs section -->
    <div class="large-10 large-centered medium-12 small-12 columns">
        <br />
        <nav class="breadcrumbs" role="navigation">
            <a class="" href="<c:url value="/welcome"/>"><spring:message code = "welcome.label" /></a>
        </nav>
    </div>

	<!-- Body section -->
    <div class="large-10 large-centered medium-12 small-12 columns">
        <header><h1><b><spring:message code = "drugs.title"/></b></h1></header>
        <p>${errorMessage}</p>
    </div>
    <div class="large-10 large-centered medium-12 small-12 columns">
        <form accept-charset="UTF-8" name="form1" method="post" action="<c:url value="/drugs"/>" id="form1">
            <div class="row">
                <div class="large-3 medium-12 small-12 columns">
					<div class="row collapse prefix-radius">
						<div class="large-2 medium-2 small-2 columns"><span class="prefix"><spring:message code="drugs.datefrom"/></span></div>
						<div class="large-2 medium-2 small-2 columns end"><input type="text" value="${fromDate}" data-date-format="mm/dd/yyyy" id="fromDate" name="fromDate" place/></div>
					</div>
				</div>
                <div class="large-3 medium-12 small-12 columns">
					<div class="row collapse prefix-radius">
						<div class="large-2 medium-2 small-2 columns"><span class="prefix"><spring:message code="drugs.dateto"/></span></div>
						<div class="large-2 medium-2 small-2 columns end"><input type="text" value="${toDate}" data-date-format="mm/dd/yyyy" id="toDate" name="toDate"/></div>
					</div>
                </div>
                <div class="large-3 medium-12 small-12 columns end">
                    <input type="submit" value="<spring:message code="drugs.submit"/>" class="tiny button radius"/>
                </div>
				<input type="hidden" id="hasResult" name="hasResult" value="${hasResult}"/>
            </div>
        </form>
    </div>
	<div class="large-10 large-centered medium-12 small-12 columns">
		<div id="svghome" ></div>
		<script src="http://d3js.org/d3.v3.min.js"></script>
	</div>
</div>

<div class="row" id="notebox" style="display:none;">
    <div class="large-10 large-centered medium-12 small-12 columns">
        <form accept-charset="UTF-8" name="form1" method="get" action="<c:url value="/drugsSaveDrugData"/>" id="form2">
            <label><spring:message code="drugs.notelabel"/></label>
            <input type="text" id="inputNote" name="inputNote" value="" placeholder="<spring:message code="drugs.noteplacehoder"/>"/>
            <input type="submit" value="<spring:message code="drugs.savedrugdatabutton"/>" class="tiny button radius"/>
        </form>
    </div>
</div>

<script>

	$(function(){
		$("#fromDate").fdatepicker();
		$("#toDate").fdatepicker();
	});

    var hasResult = document.getElementById("hasResult");
    if (hasResult.value == "yes"){
        drawChart()
        $("#notebox").show();
    }
    // Set the dimensions of the canvas / graph
    function drawChart(){
        /*var margin = {top: 30, right: 20, bottom: 30, left: 50},*/
		var margin = {top: 30, right: 20, bottom: 50, left: 80},
                /*width = 1200 - margin.left - margin.right,*/
				width = $(window).width() - margin.left - margin.right,
                /*height = 600 - margin.top - margin.bottom;*/
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
        <c:if test="${not empty drugResultSet}">
            data = ${drugResultSet};
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

