Ext.data.JsonP.analize_table({"tagname":"class","name":"analize.table","autodetected":{},"files":[{"filename":"table.coffee.js","href":"table.coffee.html#analize-table"}],"members":[{"name":"toString","tagname":"method","owner":"analize.table","id":"method-toString","meta":{}}],"alternateClassNames":[],"aliases":{},"id":"class-analize.table","component":false,"superclasses":[],"subclasses":[],"mixedInto":[],"mixins":[],"parentMixins":[],"requires":[],"uses":[],"html":"<div><pre class=\"hierarchy\"><h4>Files</h4><div class='dependency'><a href='source/table.coffee.html#analize-table' target='_blank'>table.coffee.js</a></div></pre><div class='doc-contents'>\n</div><div class='members'><div class='members-section'><div class='definedBy'>Defined By</div><h3 class='members-title icon-method'>Methods</h3><div class='subsection'><div id='method-toString' class='member first-child not-inherited'><a href='#' class='side expandable'><span>&nbsp;</span></a><div class='title'><div class='meta'><span class='defined-in' rel='analize.table'>analize.table</span><br/><a href='source/table.coffee.html#analize-table-method-toString' target='_blank' class='view-source'>view source</a></div><a href='#!/api/analize.table-method-toString' class='name expandable'>toString</a>( <span class='pre'>rows, [fields], [sortBy], [descending]</span> ) : String<span class=\"signature\"></span></div><div class='description'><div class='short'> ...</div><div class='long'>\n<h3 class=\"pa\">Parameters</h3><ul><li><span class='pre'>rows</span> : Object[]<div class='sub-desc'>\n</div></li><li><span class='pre'>fields</span> : Object (optional)<div class='sub-desc'><p>If not provided, it will use the fields found in the first row</p>\n<p>Defaults to: <code>&lt;all in 1st row&gt;</code></p></div></li><li><span class='pre'>sortBy</span> : String (optional)<div class='sub-desc'><p>If provided, it will sort the table by this field before returning</p>\n</div></li><li><span class='pre'>descending</span> : Boolean (optional)<div class='sub-desc'><p>By default, the sort will be ascending, setting this to true will sort descending</p>\n<p>Defaults to: <code>false</code></p></div></li></ul><h3 class='pa'>Returns</h3><ul><li><span class='pre'>String</span><div class='sub-desc'><p>Returns a string for the table in Markdown format</p>\n\n<pre><code>t = [\n  {col1: 'hello', col2: 12, col3: true},\n  {col1: 'goodbye', col2: 120, col3: false},\n  {col1: 'yep', col2: -23, col3: true},\n]\n\nconsole.log(require('../').table.toString(t, null, 'col2', true))\n# | col1    | col2 | col3  |\n# | ------- | ---- | ----- |\n# | goodbye | 120  | false |\n# | hello   | 12   | true  |\n# | yep     | -23  | true  |\n</code></pre>\n</div></li></ul></div></div></div></div></div></div></div>","meta":{}});