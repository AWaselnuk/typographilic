scaleFactorMap =
  minorSecond: 1.067
  '15:16': 1.067
  majorSecond: 1.125
  '8:9': 1.125
  minorThird: 1.2
  '5:6': 1.2
  majorThird: 1.25
  '4:5': 1.25
  perfectFourth: 1.333
  '3:4': 1.333
  augmentedFourth: 1.414
  diminishedFifth: 1.414
  '1:root2': 1.414
  perfectFifth: 1.5
  '2:3': 1.5
  minorSixth: 1.6
  '5:8': 1.6
  goldenRatio: 1.618
  '1:1.618': 1.618
  '1:phi': 1.618
  majorSixth: 1.667
  '3:5': 1.667
  minorSeventh: 1.778
  '9:16': 1.778
  majorSeventh: 1.875
  '8:15': 1.875
  octave: 2
  '1:2': 2
  majorTenth: 2.5
  '2:5': 2.5
  majorEleventh: 2.667
  '3:8': 2.667
  majorTwelfth: 3
  '1:3': 3
  doubleOctave: 4
  '1:4': 4

# Produce a float from the given scale factor
# The scale factor map provides human readable short cuts
normalizeScaleFactor = (scaleFactor) ->
  if scaleFactorMap[scaleFactor]
    scaleFactorMap[scaleFactor]
  else
    parseFloat scaleFactor

# Produce a float from the given lineHeight
normalizeLineHeight = (lineHeight) ->
  parseFloat lineHeight

# Produce an array from the given font sizes
normalizeFontSizes = (baseFontSizes) ->
  unless baseFontSizes instanceof Array
    baseFontSizes = [baseFontSizes]
  baseFontSizes.forEach (fontSize) -> parseFloat fontSize

# The scale function returns an large object with all the typographic tools
scale = (scaleFactor, lineHeight, baseFontSizes) ->
  scaleFactor = normalizeScaleFactor(scaleFactor)
  lineHeight = normalizeLineHeight(lineHeight)
  baseFontSizes = normalizeFontSizes(baseFontSizes)
  {
    scaleFactor: scaleFactor,
    lineHeight: lineHeight,
    fontSizes:
      px: []
      em: []
      rem: []
  }

Typographilic =
  scale: scale

module.exports = Typographilic
