{top} = require('../')

data = [
  {id: 'A', value: 100},
  {id: 'B', value: 100},
  {id: 'C', value: 100},
  {id: 'D', value: 40},
  {id: 'E', value: 11},
  {id: 'F', value: 2},
  {id: 'G', value: 40},
  {id: 'H', value: 40},
  {id: 'I', value: 60}
]

exports.topTest =

  basicTest: (test) ->
    topN = top(data, 5, 'value')
    expected = [
      { id: 'C', value: 100, Rank: 1 },
      { id: 'B', value: 100, Rank: 1 },
      { id: 'A', value: 100, Rank: 1 },
      { id: 'I', value: 60, Rank: 4 },
      { id: 'H', value: 40, Rank: 5 },
      { id: 'G', value: 40, Rank: 5 },
      { id: 'D', value: 40, Rank: 5 }
    ]
    test.deepEqual(topN, expected)

    test.done()

