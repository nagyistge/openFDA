<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<!-- Breadcrumbs section -->
    <div class="large-10 large-centered medium-12 small-12 columns">
        <div class="right">
            <label>Logged in as: ${currentLoggedUsername}</label>
        </div>
        <br />
        <nav class="breadcrumbs" role="navigation">
            <li role="label"><spring:message code="breadcrumbs.label" /></li>
            <li role="menuitem"><a class="" href="<c:url value="/welcome"/>"><spring:message code = "welcome.label" /></a></li>
            <li role="menuitem"><a class="unavailable" href="<c:url value="/drugs" />"><spring:message code = "drugs.label" /></a></li>
        </nav>
    </div>

	<!-- Body section -->
    <div class="large-10 large-centered medium-12 small-12 columns">
        <!-- Page Title section -->
        <div class="large-12 medium-12 small-12 columns">
            <header><h1><b><spring:message code = "drugs.title"/></b><small><spring:message code="drugs.subtitle"/></small></h1></header>
            <p style="color:red;"><c:out value="${errorMessage}"/></p>
        </div>
      
        <div class="large-12 medium-12 small-12 columns">
            <form accept-charset="UTF-8" name="form1" method="post" action="<c:url value="/drugs"/>" id="form1">
                <div class="row">
                    <div class="large-3 medium-12 small-12 columns">
                        <div class="row collapse prefix-radius">
                            <div class="large-6 medium-12 small-12 columns">
                                <span class="prefix"><spring:message code="drugs.datefrom"/><large style="color:red;">*</large></span>
                            </div>
                            <div class="large-6 medium-12 small-12 columns end">
                                <input type="text" value="<c:out value="${fromDate}"/>" data-date-format="mm/dd/yyyy" id="fromDate" name="fromDate" required/>
                            </div>
                        </div>
                    </div>
                    <div class="large-3 medium-12 small-12 columns">
                        <div class="row collapse prefix-radius">
                            <div class="large-6 medium-12 small-12 columns">
                                <span class="prefix"><spring:message code="drugs.dateto"/><large style="color:red;">*</large></span>
                            </div>
                            <div class="large-6 medium-12 small-12 columns end">
                                <input type="text" value="<c:out value="${toDate}"/>" data-date-format="mm/dd/yyyy" id="toDate" name="toDate" required/>
                            </div>
                        </div>
                    </div>
                    <div class="large-3 medium-12 small-12 columns end">
                        <input type="submit" value="<spring:message code="drugs.submit"/>" class="tiny button radius"/>
                    </div>
                    <input type="hidden" id="hasResult" name="hasResult" value="<c:out value="${hasResult}"/>" />
                </div>
            </form>
        </div>

        <!-- Note Section: Display after date range submission -->
        <div class="large-12 medium-12 small-12 columns" id="notebox" style="display:none;">
            <form accept-charset="UTF-8" name="form1" method="get" action="<c:url value="/drugsSaveDrugData"/>" id="form2">
                <div class="row">
                    <div class="large-6 medium-12 small-12 columns">
                        <div class="row collapse prefix-radius">
                            <div class="large-2 medium-12 small-12 columns">
                                <span class="prefix"><spring:message code="drugs.notelabel"/></span>
                            </div>
                            <div class="large-6 medium-12 small-12 columns end">
                                <input type="text" id="inputNote" name="inputNote" value="<c:out value="${inputNote}"/>" placeholder="<spring:message code="drugs.noteplacehoder"/>"/>
                            </div>
                        </div>
                    </div>
                    <div class="large-3 medium-12 small-12 columns end">
                        <input type="submit" value="<spring:message code="drugs.savedrugdatabutton"/>" class="tiny button radius"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div id="svghome"></div>
    <script src="http://d3js.org/d3.v3.min.js"></script>
</div>

<script>

	$(function(){
		$("#fromDate").fdatepicker();
		$("#toDate").fdatepicker();
	});

    var hasResult = document.getElementById("hasResult");
    if (hasResult.value == "yes"){
        drawChart();
        $("#notebox").show();
    }
    // Set the dimensions of the canvas / graph
    function drawChart(){
		var margin = {top: 100, right: 80, bottom: 100, left: 80},
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
                .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

        // Get the data
        var data = null;
        <c:if test="${not empty drugResultSet}">
            data = ${drugResultSet} ;
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

        //Create Y-axis label
        svg.append("text")
                .attr("transform", "rotate(-90)")
                .attr("y", 20 - margin.left)
                .attr("x", 0 - (height / 2))
                .style("text-anchor", "middle")
                .text("Number of Adverse Events")
    }
</script>

