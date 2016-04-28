correlate = (points, xField = 'x', yField = 'y') ->
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
  rSquared = Math.pow((n * sumXY - sumX * sumY) / Math.sqrt((n * sumX2 - sumX * sumX) * (n * sumY2 - sumY * sumY)), 2)

  num = sumXY - (sumX * sumY / n)
  den = Math.sqrt((sumX2 - Math.pow(sumX, 2) / n) * (sumY2 - Math.pow(sumY, 2) / n))
  if den is 0
    correlation = 0
  else
    correlation = num / den

  description = "y = #{slope} * x + #{intercept} with R^2 of #{rSquared} and Pearson's correlation coefficient of #{correlation}"

  return {intercept, slope, rSquared, description, correlation}

correlationTable = (data, inputFields, outcomeFields) ->
  table = [] 
  for inputField in inputFields
    row = {Input: inputField}
    for outcomeField in outcomeFields
      correlationResult = correlate(data, outcomeField, inputField)
      row[outcomeField] = correlationResult.correlation
    table.push(row)
  return table
      
exports.correlate = correlate
exports.correlationTable = correlationTable