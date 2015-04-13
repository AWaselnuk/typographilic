// Generated by CoffeeScript 1.9.1
(function() {
  var ROOT_FONT_SIZE, SCALE_FACTOR_MAP, Typographilic, convertPxToEm, convertPxToRem, normalizeFontSizes, normalizeLineHeight, normalizeScaleFactor, scale, scaleDown, scaleFontSizesToPx, scaleUp;

  ROOT_FONT_SIZE = 16;

  SCALE_FACTOR_MAP = {
    minorSecond: 1.067,
    '15:16': 1.067,
    majorSecond: 1.125,
    '8:9': 1.125,
    minorThird: 1.2,
    '5:6': 1.2,
    majorThird: 1.25,
    '4:5': 1.25,
    perfectFourth: 1.333,
    '3:4': 1.333,
    augmentedFourth: 1.414,
    diminishedFifth: 1.414,
    '1:root2': 1.414,
    perfectFifth: 1.5,
    '2:3': 1.5,
    minorSixth: 1.6,
    '5:8': 1.6,
    goldenRatio: 1.618,
    '1:1.618': 1.618,
    '1:phi': 1.618,
    majorSixth: 1.667,
    '3:5': 1.667,
    minorSeventh: 1.778,
    '9:16': 1.778,
    majorSeventh: 1.875,
    '8:15': 1.875,
    octave: 2,
    '1:2': 2,
    majorTenth: 2.5,
    '2:5': 2.5,
    majorEleventh: 2.667,
    '3:8': 2.667,
    majorTwelfth: 3,
    '1:3': 3,
    doubleOctave: 4,
    '1:4': 4
  };

  normalizeScaleFactor = function(scaleFactor) {
    if (SCALE_FACTOR_MAP[scaleFactor]) {
      return SCALE_FACTOR_MAP[scaleFactor];
    } else {
      return parseFloat(scaleFactor);
    }
  };

  normalizeLineHeight = function(lineHeight) {
    return parseFloat(lineHeight);
  };

  normalizeFontSizes = function(baseFontSizes) {
    if (!(baseFontSizes instanceof Array)) {
      baseFontSizes = [baseFontSizes];
    }
    baseFontSizes.forEach(function(fontSize) {
      return parseFloat(fontSize);
    });
    return baseFontSizes;
  };

  scaleUp = function(size, scaleFactor) {
    return Math.round(size * scaleFactor);
  };

  scaleDown = function(size, scaleFactor) {
    return Math.round(size / scaleFactor);
  };

  scaleFontSizesToPx = function(scaleFactor, baseFontSizes) {
    var fontSizes;
    fontSizes = [];
    baseFontSizes.forEach(function(fontSize) {
      var currentSize, results;
      currentSize = fontSize;
      fontSizes.push(currentSize);
      while ((currentSize = scaleDown(currentSize, scaleFactor)) >= 10) {
        fontSizes.push(currentSize);
      }
      currentSize = fontSize;
      results = [];
      while ((currentSize = scaleUp(currentSize, scaleFactor)) <= 200) {
        results.push(fontSizes.push(currentSize));
      }
      return results;
    });
    return fontSizes.sort(function(a, b) {
      return a - b;
    });
  };

  convertPxToEm = function(pxFontSizes, baseFontSize) {
    return pxFontSizes.map(function(value) {
      return value / baseFontSize;
    });
  };

  convertPxToRem = function(pxFontSizes, rootFontSize) {
    return pxFontSizes.map(function(value) {
      return value / rootFontSize;
    });
  };

  scale = function(scaleFactor, lineHeight, baseFontSizes) {
    var baseFontSize, emFontSizes, pxFontSizes, remFontSizes;
    scaleFactor = normalizeScaleFactor(scaleFactor);
    lineHeight = normalizeLineHeight(lineHeight);
    baseFontSizes = normalizeFontSizes(baseFontSizes);
    baseFontSize = baseFontSizes[0];
    pxFontSizes = scaleFontSizesToPx(scaleFactor, baseFontSizes);
    emFontSizes = convertPxToEm(pxFontSizes, baseFontSize);
    remFontSizes = convertPxToRem(pxFontSizes, ROOT_FONT_SIZE);
    return {
      scaleFactor: scaleFactor,
      lineHeight: lineHeight,
      fontSizes: {
        px: pxFontSizes,
        em: emFontSizes,
        rem: remFontSizes
      }
    };
  };

  Typographilic = {
    scale: scale
  };

  module.exports = Typographilic;

}).call(this);
