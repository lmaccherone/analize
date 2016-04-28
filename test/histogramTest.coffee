lumenize = require('../')
histogram = lumenize.histogram
{utils} = require('../')

rows = [
  {age:  7, sex: 'M'},
  {age: 25, sex: 'F'},
  {age: 23, sex: 'F'},
  {age: 27, sex: 'F'},
  {age: 34, sex: 'M'},
  {age: 55, sex: 'F'},
  {age: 42, sex: 'F'},
  {age: 13, sex: 'M'},
  {age: 11, sex: 'M'},
  {age: 23, sex: 'F'},
  {age: 31, sex: 'F'},
  {age: 32, sex: 'F'},
  {age: 29, sex: 'M'},
  {age: 16, sex: 'F'},
  {age: 31, sex: 'F'},
  {age: 22, sex: 'F'},
  {age: 25, sex: 'F'},
]

exports.histogramTest =

  testDisctiminator: (test) ->
    h = histogram.discriminated(rows, 'age', 'sex')

    expected = {
      "categories": ["7-23", "23-39", "39-56"],
      "series": [
        {
          "name": "M",
          "data": [3, 2, 0]
        },
        {
          "name": "F",
          "data": [2, 8, 2]
        }
      ],
      "discriminatorValues": ["M", "F"],
      "stats": [
        {"min": 7, "p25": 11, "median": 13, "p75": 29, "max": 34},
        {"min": 16, "p25": 23, "median": 26, "p75": 31.25, "max": 55}
      ],
      "boxPlotArrays": [
        [ 7, 11, 13, 29   , 34],
        [16, 23, 26, 31.25, 55]
      ]
    }

    test.ok(utils.filterMatch(expected, h))
    test.ok(64 <= h.successfulClassificationRate <= 70)

    test.done()

  testControlledBucketing: (test) ->

    buckets = histogram.buckets([], null, null, 1, 0, 100, 100)

    test.equal(buckets.length, 100)
    for b, index in buckets
      test.equal(b.index, index)

    test.equal(10, histogram.bucket(10.234, buckets).index)
    test.equal(null, histogram.bucket(100, buckets))

    test.done()

  testCalculatedBucketing: (test) ->
    buckets = histogram.buckets(rows, 'age', null, 1)

    expected = [
      { index: 0, startOn: null, endBelow: 16, label: '< 16' },
      { index: 1, startOn: 16, endBelow: 25, label: '16-25' },
      { index: 2, startOn: 25, endBelow: 34, label: '25-34' },
      { index: 3, startOn: 34, endBelow: 43, label: '34-43' },
      { index: 4, startOn: 43, endBelow: null, label: '>= 43' }
    ]

    test.deepEqual(expected, buckets)

    test.equal(0, histogram.bucket(10.234, buckets).index)
    test.equal(0, histogram.bucket(-1234567, buckets).index)
    test.equal(2, histogram.bucket(25, buckets).index)
    test.equal(2, histogram.bucket(25.24, buckets).index)
    test.equal(4, histogram.bucket(1234567, buckets).index)

    h = histogram.histogramFromBuckets(rows, 'age', buckets)

    counts = (row.count for row in h)
    expected = [ 3, 4, 7, 2, 1 ]
    test.deepEqual(counts, expected)

    h2 = histogram.histogram(rows, 'age', null, 1)

    test.deepEqual(h, h2)

    test.done()

  testBy10: (test) ->

    buckets = histogram.buckets(rows, 'age', null, 10)

    expected = [
      { index: 0, startOn: null, endBelow: 10, label: '< 10' },
      { index: 1, startOn: 10, endBelow: 20, label: '10-20' },
      { index: 2, startOn: 20, endBelow: 30, label: '20-30' },
      { index: 3, startOn: 30, endBelow: 40, label: '30-40' },
      { index: 4, startOn: 40, endBelow: null, label: '>= 40' }
    ]

    test.deepEqual(expected, buckets)

    test.done()

  testConstantDepth: (test) ->
    values = [1, 2, 3, 4, 5, 10, 20, 30, 40, 50, 100, 200, 300, 400, 500]

    h = histogram.histogram(values, null, histogram.bucketsConstantDepth, 1, null, null, 3)

    counts = (row.count for row in h)
    test.deepEqual([5, 5, 5], counts)

    test.done()

  testLog: (test) ->
    values = [0.05, 0.5, 5, 50, 500, 5000]

    h = histogram.histogram(values, null, histogram.bucketsLog)

    counts = (row.count for row in h)
    test.deepEqual([1, 1, 1, 1, 1, 1], counts)

    test.done()

  testLogZero: (test) ->
    values = [0, 5, 50, 500, 5000]

    h = histogram.histogram(values, null, histogram.bucketsLog)

    counts = (row.count for row in h)
    test.deepEqual([1, 1, 1, 1, 1], counts)

    test.done()

  testLogHigher: (test) ->
    values = [500, 5000, 50000]

    h = histogram.histogram(values, null, histogram.bucketsLog)

    counts = (row.count for row in h)
    test.deepEqual([1, 1, 1], counts)

    test.done()

  testPercentile: (test) ->
    values = []
    for i in [1..50]
      values.push(i * 10 - 1000)
    for i in [1..50]
      values.push(i * 10 + 1000)

    buckets = histogram.bucketsPercentile(values)

    test.equal(buckets[49].label, '-504.90000000000003-255')

    h = histogram.histogramFromBuckets(values, null, buckets)
    counts = (row.count for row in h)

    for c in counts
      test.equal(c, 1)

    values = []
    for i in [1..100]
      values.push(i * 10 - 1000)
    for i in [1..100]
      values.push(i * 10 + 1000)

    buckets = histogram.bucketsPercentile(values)

    h = histogram.histogramFromBuckets(values, null, buckets)
    counts = (row.count for row in h)

    for c in counts
      test.equal(c, 2)

    test.done()

  testZeroAndOneRows: (test) ->
    rows = [10]
    h = histogram.histogram(rows)
    test.equal(h[0].count, 1)

    rows = []
    h = histogram.histogram(rows)
    test.equal(h[0].count, 0)

    test.done()
    
  testNullNaNEtc: (test) ->
    grades = [
      {name: 'Joe', average: 105}, # extra credit
      {name: 'Jeff', average: NaN}, # missed it by that much
      {name: 'John', average: 1/0},
      {name: 'Jess', average: -1/0},
      {name: 'Joseph', average: null},
      {name: 'Julie', average: undefined},
      {name: 'Juan', average: 75},
      {name: 'Jill', average: 73},
      {name: 'Jon', average: 71},
      {name: 'Jorge', average: 32}
    ]

    buckets = histogram.bucketsPercentile(grades, 'average')
    for bucket, index in buckets
      if index is 0
        test.ok(! bucket.startOn?)
      else
        test.equal(utils.type(bucket.startOn), 'number')
      if index is 99
        test.ok(! bucket.endBelow?)
      else
        test.equal(utils.type(bucket.endBelow), 'number')
    
    test.done()

  testPercentileExample: (test) ->
    grades = [
      # A 90th percentile and above
      {name: 'Joe', average: 105}, # extra credit
      # B 60th percentile and above
      {name: 'Jeff', average: 104.9}, # missed it by that much
      {name: 'John', average: 92},
      {name: 'Jess', average: 90},
      # C 10th percentile and above
      {name: 'Joseph', average: 87},
      {name: 'Julie', average: 87},
      {name: 'Juan', average: 75},
      {name: 'Jill', average: 73},
      {name: 'Jon', average: 71},
      # F rest
      {name: 'Jorge', average: 32}
    ]

    buckets = histogram.bucketsPercentile(grades, 'average')

    getGrade = (average, buckets) ->
      percentile = histogram.bucket(average, buckets).percentileHigherIsBetter
      if percentile >= 90
        return 'A'
      else if percentile >= 60
        return 'B'
      else if percentile >= 10
        return 'C'
      else
        return 'F'

    test.equal(getGrade(grades[0].average, buckets), 'A')
    test.equal(getGrade(grades[1].average, buckets), 'B')
    test.equal(getGrade(grades[2].average, buckets), 'B')
    test.equal(getGrade(grades[3].average, buckets), 'B')
    test.equal(getGrade(grades[4].average, buckets), 'C')
    test.equal(getGrade(grades[5].average, buckets), 'C')
    test.equal(getGrade(grades[6].average, buckets), 'C')
    test.equal(getGrade(grades[7].average, buckets), 'C')
    test.equal(getGrade(grades[8].average, buckets), 'C')
    test.equal(getGrade(grades[9].average, buckets), 'F')

    # 0 Joe A
    # 1 Jeff B
    # 2 John B
    # 3 Jess B
    # 4 Joseph C
    # 5 Julie C
    # 6 Juan C
    # 7 Jill C
    # 8 Jon C
    # 9 Jorge F

    test.done()

  testMerge: (test) ->
    values = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2]

    buckets = histogram.buckets(values, null, histogram.bucketsConstantDepth, null, 1, 3, 3)
    expected = [{
      index: 0,
      startOn: 1,
      endBelow: 3,
      matchingRangeIndexStart: 0,
      matchingRangeIndexEnd: 2,
      label: '1-3'
    }]
    test.deepEqual(buckets, expected)

    buckets = histogram.buckets(values, null, histogram.bucketsConstantDepth, null, 1, 3, 4)
    expected = [{
      index: 0,
      startOn: 1,
      endBelow: 3,
      matchingRangeIndexStart: 0,
      matchingRangeIndexEnd: 3,
      label: '1-3'
    }]
    test.deepEqual(buckets, expected)

    values = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]

    buckets = histogram.buckets(values, null, histogram.bucketsConstantDepth, null, null, null, 3)

    expected = [
      { index: 0, startOn: null, endBelow: 2, label: '< 2' },
      { index: 1, startOn: 2, endBelow: null, matchingRangeIndexStart: 1, matchingRangeIndexEnd: 2, label: '>= 2'}
    ]

    test.deepEqual(buckets, expected)

    test.done()