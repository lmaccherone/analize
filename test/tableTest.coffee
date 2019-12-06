{table} = require('../')

exports.tableTest =

  testTable: (test) ->
    t = [
      {col1: 'hello', col2: 12, col3: true},
      {col1: 'goodbye', col2: 120, col3: false},
      {col1: 'yep', col2: -23, col3: true},
    ]

    actual = table.toString(t, null, 'col2', true)

    expected = '''
      | col1    | col2 | col3  |
      | ------- | ---- | ----- |
      | goodbye | 120  | false |
      | hello   | 12   | true  |
      | yep     | -23  | true  |
    '''

    test.deepEqual(actual, expected)

    t = [
      {col1: 'hello', col2: 120.67, col3: true},
      {col1: 'hello', col2: 120, col3: -1234},
      {col1: 'goodbye', col2: .99, col3: false},
      {col1: 'yep', col2: -0.9, col3: true},
    ]

    actual = table.toString(t, null, null, null, 2)

    expected = '''
      | col1    |   col2 |     col3 |
      | ------- | ------:| --------:|
      | hello   | 120.67 |     true |
      | hello   | 120.00 | -1234.00 |
      | goodbye |   0.99 |    false |
      | yep     |  -0.90 |     true |
    '''

    test.deepEqual(actual, expected)

    test.done()

  testNullAndMissing: (test) ->
    t = [
      {col1: 'hello', col2: 12, col3: null},
      {col1: 'goodbye', col3: false},
      {col2: -23, col3: true},
    ]

    actual = table.toString(t, null, 'col2', false)

    expected = '''
      | col1    | col2 | col3  |
      | ------- | ---- | ----- |
      |         | -23  | true  |
      | hello   | 12   |       |
      | goodbye |      | false |
    '''

    test.deepEqual(actual, expected)

    test.done()

  testNarrowColumns: (test) ->
    t = [
      {c: 'h', c2: 12, col3: true},
      {c: 'g', c2: 40, col3: false},
      {c: 'y', c2: 10, col3: true},
    ]

    actual = table.toString(t, null, 'c2', true)

    expected = '''
      | c   | c2  | col3  |
      | --- | --- | ----- |
      | g   | 40  | false |
      | h   | 12  | true  |
      | y   | 10  | true  |
    '''

    test.deepEqual(actual, expected)

    test.done()