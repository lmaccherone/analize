# [Documentation](https://cdn.rawgit.com/lmaccherone/analize/v1.2.0/docs/analize-docs/index.html)

# Analize #

Copyright (c) 2009-2016, Lawrence S. Maccherone, Jr.

_Core for Lumenize - Illuminating the forest AND the trees in your data_

## Documentation and source code ##

* [API Documentation](https://cdn.rawgit.com/lmaccherone/analize/v1.2.0/docs/analize-docs/index.html)
* [Source Repository](https://github.com/lmaccherone/analize)

## Features ##

* Basic aggregation functions including average, standard deviation, sum, min, max, median, percentiles, and many more
* Fast, light, flexible client-side OLAP Cube with hierarchical rollup support 
* Bayesian classifier with non-parametric modeling and v-optimal bucketing to effectively deal with data in any distribution (asymetric, bi-modal, fat-tail, etc.)
* Correlations
* Histograms
* ANOVA
* Data transformation utilities
* Randomly pick a value from a non-parametric distribution
* Output data in Markdown table format for easy web page generation
* Tested - Over 600 tests
* [Documented](https://cdn.rawgit.com/lmaccherone/analize/v1.2.0/docs/analize-docs/index.html) - Robust documentation and examples
* [DocTested](https://github.com/lmaccherone/coffeedoctest) - The examples will always match 
  the code because it fails automated testing when they don't

## Credits ##

Authors:

* [Larry Maccherone](http://maccherone.com)
* Jennifer Maccherone

## Usage in a browser ##

To use in a browser, either host it on your own site, or if your volume is low enough, you can directly hit the github pages for the deploy version:

`<script type="text/javascript" src="https://cdn.rawgit.com/lmaccherone/analize/v{{version}}/deploy/analize-min.js"></script>`

Replace `{{version}}` with the version of analize you wish to use (probably the latest). See the Changelog section for information about versions. Example:

`<script type="text/javascript" src="https://cdn.rawgit.com/lmaccherone/analize/v1.2.0/deploy/analize-min.js"></script>`

Then at the top of the javascript where you want to call it, put the following:

`var analize = require('./analize');`

And call it like this.

`var stdDev = analize.functions.standardDeviation([20, 30, 50]);`
    
## Usage in node.js ##

To install, run the following from the root folder of your project:

`npm install analize --save`

Then in your code:

`var analize = require('analize')`

And call it like this.

`var stdDev = analize.functions.standardDeviation([20, 30, 50]);`

## Changelog ##

* 1.2.0 - 2016-04-28 - Initial release broken out from Lumenize

## MIT License ##

Copyright (c) 2009-2016 Lawrence S. Maccherone, Jr.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS 
IN THE SOFTWARE.





