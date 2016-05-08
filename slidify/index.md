---
title       : How Dangerous is Your State?
subtitle    : USArrests Dataset
author      : Sean Dolan
job         : Developing Data Products
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## How Dangerous is Your State?

Deciding where to retire? Need to relocate for a job? Before you move, find out just how risky a change of location could be ...

This application gives users detailed information about several categories of crime by U.S. state.

It also calculates a "danger index"" using a custom formula, and ranks each state using this index.

Visualizations, such as a map of the United States, help the user to quickly compare different states.

--- .class #danger 

## Trigger Warning

Although the data presented herein is statistical in nature and in no way graphic, it should be noted that it does deal with violent crime.

Any individual who feels that they may be adversely affected by exposure to this type of material should use their best judgement in deciding whether or not to continue.

## Disclaimer

The weights used in the Danger Index formula are presented here for the sake of example only. They have not been scientifically calculated, nor should they be interpreted as representing a values judgement on the author's part regarding the releative physical or psychological impact of different types of crime.

--- .class #id 

## USArrests Datset

This application leverages the publicly available dataset "US Arrests".  It contains Violent Crime Rates by US State, specifically arrests per 100,000 residents for assault, murder, and rape in each of the 50 US states in 1973. We know that this data is not quite current, and we're working on an update using statistics from data.gov - to be released soon!


```
##             Murder Assault Rape       State
## Alabama       13.2     236 21.2     Alabama
## Alaska        10.0     263 44.5      Alaska
## Arizona        8.1     294 31.0     Arizona
## Arkansas       8.8     190 19.5    Arkansas
## California     9.0     276 40.6  California
## Colorado       7.9     204 38.7    Colorado
## Connecticut    3.3     110 11.1 Connecticut
## Delaware       5.9     238 15.8    Delaware
## Florida       15.4     335 31.9     Florida
## Georgia       17.4     211 25.8     Georgia
```

--- .formula #id

## The Formula



The formula calculates an overall "danger index" by giving a different weight to each category of crime. Indexes have been scaled from their raw scores so that the mean raw score becomes a "50".  This 100 point danger scale seems more intuitive for the user than showing scores of "184.03" or "346.65".

```r
  dangerFunction <- function(state){
    murderRisk <- USArrests$Murder[USArrests$State == state]
    assaultRisk <- USArrests$Assault[USArrests$State == state]
    rapeRisk <- USArrests$Rape[USArrests$State == state]
    danger1 <- (2 * murderRisk) + (1.5 * rapeRisk) + (0.8 * assaultRisk)
    danger2 <- danger1/3.68064  # Scale so mean value is equal to 50
    return(round(danger2))
  }
```
Here is the danger index calculated for Ohio:

```
## [1] 39
```

--- .class #id 


## Crimes by Type (Per 100K People)

When the user inputs the name of their state, a column chart is dynamically generated displaying the number of each type of crime per 100K people in the state's population.



<!-- ColumnChart generated in R 3.2.0 by googleVis 0.5.10 package -->
<!-- Sun May 08 00:47:59 2016 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataColumnChartID4c5862c3344d () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Ohio",
7.3,
21.4,
120 
] 
];
data.addColumn('string','State');
data.addColumn('number','Murders');
data.addColumn('number','Rapes');
data.addColumn('number','Assaults');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartColumnChartID4c5862c3344d() {
var data = gvisDataColumnChartID4c5862c3344d();
var options = {};
options["allowHtml"] = true;
options["width"] =    900;
options["height"] =    450;
options["legend"] = "right";

    var chart = new google.visualization.ColumnChart(
    document.getElementById('ColumnChartID4c5862c3344d')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartColumnChartID4c5862c3344d);
})();
function displayChartColumnChartID4c5862c3344d() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartColumnChartID4c5862c3344d"></script>
 
<!-- divChart -->
  
<div id="ColumnChartID4c5862c3344d" 
  style="width: 900; height: 450;">
</div>

--- .class #id 

## Danger Index by State

This interactive map allows the user to explore the entire United States and view each state's danger index by mousing over the area with their cursor.  States are color coded, with deeper shades of red indicating a higher index.  As the scale indicates, the safest state had an index of "13" while the most dangerous scored a "94". 

<!-- GeoChart generated in R 3.2.0 by googleVis 0.5.10 package -->
<!-- Sun May 08 00:47:59 2016 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataGeoChartID4c585b847690 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Alabama",
67 
],
[
 "Alaska",
81 
],
[
 "Arizona",
81 
],
[
 "Arkansas",
54 
],
[
 "California",
81 
],
[
 "Colorado",
64 
],
[
 "Connecticut",
30 
],
[
 "Delaware",
61 
],
[
 "Florida",
94 
],
[
 "Georgia",
66 
],
[
 "Hawaii",
21 
],
[
 "Idaho",
33 
],
[
 "Illinois",
70 
],
[
 "Indiana",
37 
],
[
 "Iowa",
18 
],
[
 "Kansas",
36 
],
[
 "Kentucky",
36 
],
[
 "Louisiana",
72 
],
[
 "Maine",
22 
],
[
 "Maryland",
83 
],
[
 "Massachusetts",
41 
],
[
 "Michigan",
76 
],
[
 "Minnesota",
23 
],
[
 "Mississippi",
72 
],
[
 "Missouri",
55 
],
[
 "Montana",
34 
],
[
 "Nebraska",
31 
],
[
 "Nevada",
80 
],
[
 "New Hampshire",
17 
],
[
 "New Jersey",
46 
],
[
 "New Mexico",
81 
],
[
 "New York",
72 
],
[
 "North Carolina",
87 
],
[
 "North Dakota",
13 
],
[
 "Ohio",
39 
],
[
 "Oklahoma",
45 
],
[
 "Oregon",
49 
],
[
 "Pennsylvania",
33 
],
[
 "Rhode Island",
43 
],
[
 "South Carolina",
78 
],
[
 "South Dakota",
26 
],
[
 "Tennessee",
59 
],
[
 "Texas",
61 
],
[
 "Utah",
37 
],
[
 "Vermont",
16 
],
[
 "Virginia",
47 
],
[
 "Washington",
44 
],
[
 "West Virginia",
24 
],
[
 "Wisconsin",
17 
],
[
 "Wyoming",
45 
] 
];
data.addColumn('string','State');
data.addColumn('number','Danger');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartGeoChartID4c585b847690() {
var data = gvisDataGeoChartID4c585b847690();
var options = {};
options["width"] =    950;
options["height"] =    375;
options["region"] = "US";
options["displayMode"] = "regions";
options["resolution"] = "provinces";
options["colors"] = ['#E42217'];

    var chart = new google.visualization.GeoChart(
    document.getElementById('GeoChartID4c585b847690')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "geochart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartGeoChartID4c585b847690);
})();
function displayChartGeoChartID4c585b847690() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartGeoChartID4c585b847690"></script>
 
<!-- divChart -->
  
<div id="GeoChartID4c585b847690" 
  style="width: 950; height: 375;">
</div>
