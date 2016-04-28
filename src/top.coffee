_ = require('lodash')

top = (data, n, sortByField) ->
  sortedData = _.sortBy(data, sortByField)
  sortedData.reverse()
  count = 0
  output = []
  while count < n
    row = sortedData[count]
    if row[sortByField] is priorValue
      row.Rank = priorRank
    else
      row.Rank = count + 1
      priorRank = count + 1
    output.push(row)
    priorValue = row[sortByField]
    count++
    
  while sortedData[count][sortByField] is priorValue
    row = sortedData[count]
    row.Rank = priorRank
    output.push(row)
    count++
    
  return output
  
exports.top = top