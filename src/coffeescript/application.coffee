ROOT_FONT_SIZE = 16 # Used to calculate REM

SCALE_FACTOR_MAP =
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

# Round to 3 decimal places
round = (num) -> Math.round(num * 1000) / 1000

# Convert ratio like "5:8" to float
ratioToFloat = (ratio) ->
  values = ratio.split(':')
  round(parseFloat values[1] / parseFloat values[0])

# Produce a float from the given scale factor
# The scale factor map provides human readable short cuts
normalizeScaleFactor = (scaleFactor) ->
  return SCALE_FACTOR_MAP[scaleFactor] if SCALE_FACTOR_MAP[scaleFactor]
  return ratioToFloat(scaleFactor) if (typeof scaleFactor == 'string') && (scaleFactor.indexOf(':') != -1)
  parseFloat scaleFactor

# Produce a float from the given lineHeight
normalizeLineHeight = (lineHeight) ->
  parseFloat lineHeight

# Produce an array from the given font sizes
normalizeFontSizes = (baseFontSizes) ->
  unless baseFontSizes instanceof Array
    baseFontSizes = [baseFontSizes]
  baseFontSizes.forEach (fontSize) -> parseFloat fontSize

  baseFontSizes

# Scales up a font size
scaleUp = (size, scaleFactor) -> Math.round(size * scaleFactor)

# Scales down a font size
scaleDown = (size, scaleFactor) -> Math.round(size / scaleFactor)

# Produce an array of font sizes based on a scale factor
scaleFontSizesToPx = (scaleFactor, baseFontSizes) ->
  fontSizes = []
  baseFontSizes.forEach (fontSize) ->
    currentSize = fontSize
    fontSizes.push currentSize
    while (currentSize = scaleDown(currentSize, scaleFactor)) >= 10
      fontSizes.push currentSize
    currentSize = fontSize
    while (currentSize = scaleUp(currentSize, scaleFactor)) <= 200
      fontSizes.push currentSize

  fontSizes.sort (a, b) -> a - b

# Convert an array of pixel sizes to ems
convertPxToEm = (pxFontSizes, baseFontSize) ->
  pxFontSizes.map (value) -> round(value / baseFontSize)

# Convert an array of pixel sizes to rems
convertPxToRem = (pxFontSizes, rootFontSize) ->
  pxFontSizes.map (value) -> round(value / rootFontSize)

# The scale function returns an large object with all the typographic tools
scale = (scaleFactor, baseLineHeight, baseFontSizes) ->
  scaleFactor = normalizeScaleFactor(scaleFactor)

  baseFontSizes = normalizeFontSizes(baseFontSizes)
  baseFontSize = baseFontSizes[0] # The base font size will be the first one passed in
  pxFontSizes = scaleFontSizesToPx(scaleFactor, baseFontSizes)
  emFontSizes = convertPxToEm(pxFontSizes, baseFontSize)
  remFontSizes = convertPxToRem(pxFontSizes, ROOT_FONT_SIZE)

  baseLineHeight = normalizeLineHeight(baseLineHeight)
  pxLineHeight = Math.round(baseFontSize * baseLineHeight)
  emLineHeight = round(pxLineHeight / baseFontSize)
  remLineHeight = round(pxLineHeight / ROOT_FONT_SIZE)

  {
    scaleFactor: scaleFactor,
    baseLineHeight: baseLineHeight,
    baseFontSizes: baseFontSizes,
    baseFontSize: baseFontSize,
    lineHeight:
      px: pxLineHeight
      em: emLineHeight
      rem: remLineHeight
    fontSizes:
      px: pxFontSizes
      em: emFontSizes
      rem: remFontSizes
  }

Typographilic =
  scale: scale

module.exports = Typographilic
