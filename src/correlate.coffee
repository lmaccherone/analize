tableFormatter = require('./table')

###
@class correlate
###
correlate = {}

correlate.correlate = (points, xField = 'x', yField = 'y') ->
  ###
  @method correlate
  @param {Object[]} points
  @param {String} [xField = 'x'] Will consider the field named xField as the x value in the correlation
  @param {String} [yField = 'y'] Will consider the field named yField as the x value in the correlation
  @return {Object} Returns an object with all the calculated correlation values {intercept, slope, rSquared, description, correlation}

      data = [
        {col1: 1, col2: 4},
        {col1: 2, col2: 8},
      ]

      console.log(require('../').correlate.correlate(data, 'col2', 'col1'))
      # {
      #   intercept: 0,
      #   slope: 0.25,
      #   rSquared: 1,
      #   description: "y = 0.25 * x + 0 with R^2 of 1 and Pearson's correlation coefficient of 1",
      #   correlation: 1
      # }

  ###
  n = points.length

  sumX  = 0
  sumY  = 0
  sumXY = 0
  sumX2 = 0
  sumY2 = 0

  for point in points
    if point[xField] and point[yField]
      sumX  += point[xField]
      sumY  += point[yField]
      sumXY += point[xField] * point[yField]
      sumX2 += point[xField] * point[xField]
      sumY2 += point[yField] * point[yField]

  div = (n * sumX2) - (sumX * sumX)

  intercept = ((sumY * sumX2) - (sumX * sumXY)) / div
  slope = ((n * sumXY) - (sumX * sumY)) / div

  num = sumXY - (sumX * sumY / n)
  den = Math.sqrt((sumX2 - Math.pow(sumX, 2) / n) * (sumY2 - Math.pow(sumY, 2) / n))
  if den is 0
    correlation = 0
  else
    correlation = num / den

  rSquared = Math.pow(correlation, 2)

  description = "y = #{slope} * x + #{intercept} with R^2 of #{rSquared} and Pearson's correlation coefficient of #{correlation}"

  return {intercept, slope, rSquared, description, correlation}

correlate.correlationTable = (data, inputFields, outcomeFields, useRSquared = false, rawOutput = false) ->
  ###
  @method correlationTable
  @param {Object[]} data
  @param {String} [inputFields = <all fields in first row>] Defaults to all fields in the first row
  @param {String} [outcomeFields = <all fields in first row>] Defaults to all fields in the first row
  @param {Boolean} [useRSquared = false] By default, the Pearson's correlation value (aka R) will be output. Setting this to `true` will cause it to output R^2
  @param {Boolean} [rawOutput = false] By default, the output will be a markdown formatted table. Setting this to `true` will cause it to output an Array of Objects
  @return {Object[]} Returns an Array of Objects with all the calculated correlation values

      data = [
        {col1: 1, col2: 4, col3: -10},
        {col1: 2, col2: 8, col3: -20},
        {col1: 3, col2: 15, col3: -30},
      ]

      console.log(require('../').correlate.correlationTable(data))
      # | input |  col1 |  col2 |  col3 |
      # | ----- | -----:| -----:| -----:|
      # | col1  |  1.00 |  0.99 | -1.00 |
      # | col2  |  0.99 |  1.00 | -0.99 |
      # | col3  | -1.00 | -0.99 |  1.00 |

  ###
  fields = Object.keys(data[0])
  inputFields = inputFields or fields
  outcomeFields = outcomeFields or fields
  table = [] 
  for inputField in inputFields
    row = {input: inputField}
    for outcomeField in outcomeFields
      correlationResult = correlate.correlate(data, outcomeField, inputField)
      if useRSquared
        row[outcomeField] = correlationResult.rSquared
      else
        row[outcomeField] = correlationResult.correlation
    table.push(row)
  if rawOutput
    return table
  else
    return tableFormatter.table.toString(table, null, null, null, 2)
      
exports.correlate = correlate