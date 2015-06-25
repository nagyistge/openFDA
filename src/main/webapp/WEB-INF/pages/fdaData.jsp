
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
<h1>Get FDA Data</h1>
<h1>${message}</h1>
<small>New item 1</small>
<a href="<c:url value='/getFdaData'/>" onclick="" class="tiny button radius">submit</a>--%>

<%--<!DOCTYPE html>
<meta charset="utf-8">--%>
<style> /* set the CSS */

body { font: 12px Arial;}

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

<%--<body>--%>
<h1><spring:message code = "fdaData.title"/></h1>
<h1>${message}</h1>

<form accept-charset="UTF-8" name="form1" method="post" action="<c:url value="/fdaData"/>" id="form1">
    <div class="row">
        <div class="large-12 columns">
            <spring:message code="fdaData.datefrom"/>: <input type="text" id="fromDate" name="fromDate" value=""/>
        </div>
    </div>
    <div class="row">
        <div class="large-12 columns">
            <spring:message code="fdaData.dateto"/>: <input type="text" id="toDate" name="toDate" value=""/>
        </div>
    </div>
    <div class="row">
        <div class="large-12 columns">
            <input type="submit" value="<spring:message code="fdaData.submit"/>" class="tiny button radius"/>
        </div>
    </div>
    <input type="hidden" id="hasResult" name="hasResult" value="${hasResult}"/>
</form>


<%--<h4>${fdaResultSet}</h4>--%>
<div id="svghome" ></div>
<script src="http://d3js.org/d3.v3.min.js"></script>


<script>


    $(function() {
        $("#fromDate").datepicker();
        $("#toDate").datepicker();
    });

    var hasResult = document.getElementById("hasResult");
    if (hasResult.value == "yes"){
        drawChart()
    }
    // Set the dimensions of the canvas / graph
    /*var margin = {top: 30, right: 20, bottom: 30, left: 50},
     width = 600 - margin.left - margin.right,
     height = 270 - margin.top - margin.bottom;*/
    function drawChart(){
        var margin = {top: 30, right: 20, bottom: 30, left: 50},
                width = 1200 - margin.left - margin.right,
                height = 600 - margin.top - margin.bottom;

        // Parse the date / time
        //var parseDate = d3.time.format("%d-%b-%y").parse;
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
        /* var valueline = d3.svg.line()
         .x(function(d) { return x(d.date); })
         .y(function(d) { return y(d.close); });*/
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
        var data = ${fdaResultSet};
        //var data = [{"time":"20040101","count":1},{"time":"20040102","count":519},{"time":"20040103","count":1},{"time":"20040104","count":58},{"time":"20040105","count":230}];

        //alert(data2);

        //d3.csv("data.csv", function(error, data) {
        data.forEach(function(d) {
            //d.date = parseDate(d.date);
            //d.close = +d.close;
            d.time = parseDate(d.time);
            d.count = +d.count;

            //alert(d.time);
            //alert(d.count);
        });

        // Scale the range of the data
        //x.domain(d3.extent(data, function(d) { return d.date; }));
        //y.domain([0, d3.max(data, function(d) { return d.close; })]);
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

        //});
    }
</script>
<%--</body>--%>
