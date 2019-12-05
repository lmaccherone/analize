{correlate} = require('../')

exports.correlateTest =

  testCorrelate: (test) ->
    data = [
      {col1: 1, col2: 4},
      {col1: 2, col2: 8},
    ]

    actual = correlate.correlate(data, 'col2', 'col1')
    expected = {
      intercept: 0,
      slope: 0.25,
      rSquared: 1,
      description: "y = 0.25 * x + 0 with R^2 of 1 and Pearson's correlation coefficient of 1",
      correlation: 1
    }

    test.deepEqual(actual, expected)

    test.done()

  testCorrelationTable: (test) ->
    data = [
      {col1: 1, col2: 4, col3: -10},
      {col1: 2, col2: 8, col3: -20},
      {col1: 3, col2: 15, col3: -30},
    ]

    actual = correlate.correlationTable(data)
    expected = [
      {input: 'col1', col1: 1, col2: 0.987829161147262, col3: -1},
      {input: 'col2', col1: 0.987829161147262, col2: 1, col3: -0.987829161147262},
      {input: 'col3', col1: -1, col2: -0.987829161147262, col3: 1}
    ]
    test.deepEqual(actual, expected)

    actual = correlate.correlationTable(data, null, null, true)
    expected = [
      {input: 'col1', col1: 1, col2: 0.9758064516129034, col3: 1},
      {input: 'col2', col1: 0.9758064516129034, col2: 1, col3: 0.9758064516129034},
      {input: 'col3', col1: 1, col2: 0.9758064516129034, col3: 1}
    ]
    test.deepEqual(actual, expected)

    actual = correlate.correlationTable(data, ['col1', 'col2'], ['col2', 'col3'])
    expected = [
      {input: 'col1', col2: 0.987829161147262, col3: -1},
      {input: 'col2', col2: 1, col3: -0.987829161147262}
    ]
    test.deepEqual(actual, expected)

    test.done()