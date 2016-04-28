###

# Lumenize Core #

Lumenize Core is a set of classes and functions that have no dependencies. It can stand alone or act as the base
functionality for other packages including tzTime, and Lumenize proper.

Simple group-by, 2D pivot-table and even multi-dimensional aggregations (OLAP cube) are provided by:
  * OLAPCube - Generic OLAP Cube with support for hierarchical roll-ups

Mathematical and statistical functions provided by:
  * functions - count, sum, standardDeviation, percentile coverage, min, max, etc.
  * distributions - Taylor approximations for F, T, and Normal distributions including some inverse and inverse-upper forms
  * histogram - create a histogram of scatter data
  * RandomPicker - supply a non-parametric distribution and it will randomly pick according to that. Great for
    non-parametric Monte Carlo simulation

Three transformation functions are provided:
  * arrayOfMaps_To_CSVStyleArray - Used to transform from record to table format
  * csvStyleArray_To_ArrayOfMaps - Used to transform from table to record format
  * arrayOfMaps_To_HighChartsSeries - Used to transform from record format to the format expected by the HighCharts charting library

And last, additional functionality is provided by:
  * utils - utility methods used by the rest of Lumenize (type, clone, array/object functions, etc.)
  * table - output Array of Maps style data as a text table

###
#exports.utils = tzTime.utils

datatransform = require('./src/dataTransform')
exports.arrayOfMaps_To_CSVStyleArray = datatransform.arrayOfMaps_To_CSVStyleArray
exports.csvStyleArray_To_ArrayOfMaps = datatransform.csvStyleArray_To_ArrayOfMaps
exports.arrayOfMaps_To_HighChartsSeries = datatransform.arrayOfMaps_To_HighChartsSeries
exports.csvString_To_CSVStyleArray = datatransform.csvString_To_CSVStyleArray
exports.csvStyleArray_To_CSVString = datatransform.csvStyleArray_To_CSVString

exports.functions = require('./src/functions').functions

exports.histogram = require('./src/histogram').histogram

exports.multiRegression = require('./src/multiRegression').multiRegression

exports.table = require('./src/table').table

exports.OLAPCube = require('./src/OLAPCube').OLAPCube

exports.anova = require('./src/anova').anova

correlate = require('./src/correlate')
exports.correlate = correlate.correlate
exports.correlationTable = correlate.correlationTable

exports.distributions = require('./src/distributions').distributions

exports.BayesianClassifier = require('./src/Classifier').BayesianClassifier
exports.Classifier = require('./src/Classifier').Classifier

exports.RandomPicker = require('./src/RandomPicker').RandomPicker

exports.utils = require('./src/utils')

exports.top = require('./src/top').top
