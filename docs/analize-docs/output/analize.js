Ext.data.JsonP.analize({"tagname":"class","name":"analize","autodetected":{},"files":[{"filename":"analize.coffee.js","href":"analize.coffee.html#analize"}],"members":[{"name":"arrayOfMaps_To_CSVStyleArray","tagname":"method","owner":"analize","id":"method-arrayOfMaps_To_CSVStyleArray","meta":{}},{"name":"arrayOfMaps_To_HighChartsSeries","tagname":"method","owner":"analize","id":"method-arrayOfMaps_To_HighChartsSeries","meta":{}},{"name":"calculateA","tagname":"method","owner":"analize","id":"method-calculateA","meta":{}},{"name":"csvStyleArray_To_ArrayOfMaps","tagname":"method","owner":"analize","id":"method-csvStyleArray_To_ArrayOfMaps","meta":{}},{"name":"predict","tagname":"method","owner":"analize","id":"method-predict","meta":{}}],"alternateClassNames":[],"aliases":{},"id":"class-analize","short_doc":"Lumenize Core\n\nLumenize Core is a set of classes and functions that have no dependencies. ...","component":false,"superclasses":[],"subclasses":[],"mixedInto":[],"mixins":[],"parentMixins":[],"requires":[],"uses":[],"html":"<div><pre class=\"hierarchy\"><h4>Files</h4><div class='dependency'><a href='source/analize.coffee.html#analize' target='_blank'>analize.coffee.js</a></div></pre><div class='doc-contents'><h1>Lumenize Core</h1>\n\n<p>Lumenize Core is a set of classes and functions that have no dependencies. It can stand alone or act as the base\nfunctionality for other packages including tzTime, and Lumenize proper.</p>\n\n<p>Simple group-by, 2D pivot-table and even multi-dimensional aggregations (OLAP cube) are provided by:\n  * OLAPCube - Generic OLAP Cube with support for hierarchical roll-ups</p>\n\n<p>Mathematical and statistical functions provided by:\n  * functions - count, sum, standardDeviation, percentile coverage, min, max, etc.\n  * distributions - Taylor approximations for F, T, and Normal distributions including some inverse and inverse-upper forms\n  * histogram - create a histogram of scatter data\n  * RandomPicker - supply a non-parametric distribution and it will randomly pick according to that. Great for\n    non-parametric Monte Carlo simulation</p>\n\n<p>Three transformation functions are provided:\n  * arrayOfMaps_To_CSVStyleArray - Used to transform from record to table format\n  * csvStyleArray_To_ArrayOfMaps - Used to transform from table to record format\n  * arrayOfMaps_To_HighChartsSeries - Used to transform from record format to the format expected by the HighCharts charting library</p>\n\n<p>And last, additional functionality is provided by:\n  * utils - utility methods used by the rest of Lumenize (type, clone, array/object functions, etc.)\n  * table - output Array of Maps style data as a text table</p>\n</div><div class='members'><div class='members-section'><div class='definedBy'>Defined By</div><h3 class='members-title icon-method'>Methods</h3><div class='subsection'><div id='method-arrayOfMaps_To_CSVStyleArray' class='member first-child not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='analize'>analize</span><br/><a href='source/dataTransform.coffee.html#analize-method-arrayOfMaps_To_CSVStyleArray' target='_blank' class='view-source'>view source</a></div><a href='#!/api/analize-method-arrayOfMaps_To_CSVStyleArray' class='name expandable'>arrayOfMaps_To_CSVStyleArray</a>( <span class='pre'>arrayOfMaps, [fields]</span> ) : Array[]<span class=\"signature\"></span></div><div class='description'><div class='short'> ...</div><div class='long'>\n<h3 class=\"pa\">Parameters</h3><ul><li><span class='pre'>arrayOfMaps</span> : Object[]<div class='sub-desc'>\n</div></li><li><span class='pre'>fields</span> : String[] (optional)<div class='sub-desc'><p>If not provided, it will use the first row and get all fields</p>\n</div></li></ul><h3 class='pa'>Returns</h3><ul><li><span class='pre'>Array[]</span><div class='sub-desc'><p>The first row will be the column headers</p>\n\n<p>   <code>arrayOfMaps_To_CSVStyleArray</code> is a convenience function that will convert an array of maps like:</p>\n\n<pre><code>{arrayOfMaps_To_CSVStyleArray} = require('../')\n\narrayOfMaps = [\n  {column1: 10000, column2: 20000},\n  {column1: 30000, column2: 40000},\n  {column1: 50000, column2: 60000}\n]\n</code></pre>\n\n<p>to a CSV-style array like this:</p>\n\n<pre><code>console.log(arrayOfMaps_To_CSVStyleArray(arrayOfMaps))\n\n# [ [ 'column1', 'column2' ],\n#   [ 10000, 20000 ],\n#   [ 30000, 40000 ],\n#   [ 50000, 60000 ] ]\n</code></pre>\n</div></li></ul></div></div></div><div id='method-arrayOfMaps_To_HighChartsSeries' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='analize'>analize</span><br/><a href='source/dataTransform.coffee.html#analize-method-arrayOfMaps_To_HighChartsSeries' target='_blank' class='view-source'>view source</a></div><a href='#!/api/analize-method-arrayOfMaps_To_HighChartsSeries' class='name expandable'>arrayOfMaps_To_HighChartsSeries</a>( <span class='pre'>arrayOfMaps, config</span> ) : Object[]<span class=\"signature\"></span></div><div class='description'><div class='short'> ...</div><div class='long'>\n<h3 class=\"pa\">Parameters</h3><ul><li><span class='pre'>arrayOfMaps</span> : Array[]<div class='sub-desc'>\n</div></li><li><span class='pre'>config</span> : Object<div class='sub-desc'><p>You can use the same config you used to call TimeSeriesCalculator including your yAxis specifications</p>\n</div></li></ul><h3 class='pa'>Returns</h3><ul><li><span class='pre'>Object[]</span><div class='sub-desc'><p>in HighCharts form</p>\n\n<p>Takes an array of arrays that came from a call to TimeSeriesCalculator and looks like this:</p>\n\n<pre><code>{arrayOfMaps_To_HighChartsSeries} = require('../')\n\narrayOfMaps = [\n  {\"Series 1\": 8, \"Series 2\": 5, \"Series3\": 10},\n  {\"Series 1\": 2, \"Series 2\": 3},\n  {\"Series 1\": 1, \"Series 2\": 2, \"Series3\": 40},\n]\n</code></pre>\n\n<p>and a list of series configurations</p>\n\n<pre><code>config = [\n  {name: \"Series 1\", yAxis: 1},\n  {name: \"Series 2\"},\n  {name: \"Series3\"}\n]\n</code></pre>\n\n<p>and extracts the data into seperate series</p>\n\n<pre><code>console.log(arrayOfMaps_To_HighChartsSeries(arrayOfMaps, config))\n# [ { name: 'Series 1', data: [ 8, 2, 1 ], yAxis: 1 },\n#   { name: 'Series 2', data: [ 5, 3, 2 ] },\n#   { name: 'Series3', data: [ 10, null, 40 ] } ]\n</code></pre>\n\n<p>Notice how the extra fields from the series array are included in the output. Also, notice how the missing second\nvalue for Series3 was replaced with a null. HighCharts will skip right over this for category charts as you would\nexpect.</p>\n</div></li></ul></div></div></div><div id='method-calculateA' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='analize'>analize</span><br/><a href='source/multiRegression.coffee.html#analize-method-calculateA' target='_blank' class='view-source'>view source</a></div><a href='#!/api/analize-method-calculateA' class='name expandable'>calculateA</a>( <span class='pre'></span> )<span class=\"signature\"></span></div><div class='description'><div class='short'>Calculates the coefficient matrix for gaussian elimination solution ...</div><div class='long'><p>Calculates the coefficient matrix for gaussian elimination solution</p>\n</div></div></div><div id='method-csvStyleArray_To_ArrayOfMaps' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='analize'>analize</span><br/><a href='source/dataTransform.coffee.html#analize-method-csvStyleArray_To_ArrayOfMaps' target='_blank' class='view-source'>view source</a></div><a href='#!/api/analize-method-csvStyleArray_To_ArrayOfMaps' class='name expandable'>csvStyleArray_To_ArrayOfMaps</a>( <span class='pre'>csvStyleArray, [rowKeys]</span> ) : Object[]<span class=\"signature\"></span></div><div class='description'><div class='short'> ...</div><div class='long'>\n<h3 class=\"pa\">Parameters</h3><ul><li><span class='pre'>csvStyleArray</span> : Array[]<div class='sub-desc'><p>The first row is usually the list of column headers but if not, you can\n  provide your own such list in the second parameter</p>\n</div></li><li><span class='pre'>rowKeys</span> : String[] (optional)<div class='sub-desc'><p>specify the column headers like <code>['column1', 'column2']</code>. If not provided, it will use\n  the first row of the csvStyleArray</p>\n</div></li></ul><h3 class='pa'>Returns</h3><ul><li><span class='pre'>Object[]</span><div class='sub-desc'><p><code>csvStyleArry_To_ArryOfMaps</code> is a convenience function that will convert a csvStyleArray like:</p>\n\n<pre><code>{csvStyleArray_To_ArrayOfMaps} = require('../')\n\ncsvStyleArray = [\n  ['column1', 'column2'],\n  [1         , 2       ],\n  [3         , 4       ],\n  [5         , 6       ]\n]\n</code></pre>\n\n<p>to an Array of Maps like this:</p>\n\n<pre><code>console.log(csvStyleArray_To_ArrayOfMaps(csvStyleArray))\n# [ { column1: 1, column2: 2 },\n#   { column1: 3, column2: 4 },\n#   { column1: 5, column2: 6 } ]\n</code></pre>\n</div></li></ul></div></div></div><div id='method-predict' class='member  not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='analize'>analize</span><br/><a href='source/multiRegression.coffee.html#analize-method-predict' target='_blank' class='view-source'>view source</a></div><a href='#!/api/analize-method-predict' class='name expandable'>predict</a>( <span class='pre'>data, </span> ) : Object<span class=\"signature\"></span></div><div class='description'><div class='short'> ...</div><div class='long'>\n<h3 class=\"pa\">Parameters</h3><ul><li><span class='pre'>data</span> : [][]<div class='sub-desc'><p>A two-dimensional array</p>\n</div></li><li><span class='pre'></span> : Object<div class='sub-desc'><p>Returns a prediction of the output based upon historical data and input \"estimates\"\nThe last column of the Data array is the value we are trying to predict. The other\ncolumns are the inputs.  The input array will order-wise coorespond to the first\nn-1 columns of the data array.</p>\n</div></li></ul><h3 class='pa'>Returns</h3><ul><li><span class='pre'>Object</span><div class='sub-desc'><p>returns {A, Beta, variance, prediction}</p>\n</div></li></ul></div></div></div></div></div></div></div>","meta":{}});