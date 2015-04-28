typographilic = require('../src/coffeescript/application.coffee')
expect = require('chai').expect

describe 'Smoketest', ->

  it 'runs chai with mocha', ->
    expect(true).to.be.true

describe 'typographilic', ->

  describe 'scale()', ->

    before ->
      @scale = typographilic.scale(1.618, 1.4, 16)
      @doubleScale = typographilic.scale(1.618, 1.4, [12, 16])

    it 'returns an object', ->
      expect(@scale).to.be.ok
      expect(@doubleScale).to.be.ok

    it 'returns an object with scaleFactor, baseLineHeight, baseFontSizes, baseFontSize, lineHeight, fontSizes', ->
      expect(@scale.scaleFactor).to.be.ok
      expect(@scale.baseLineHeight).to.be.ok
      expect(@scale.baseFontSizes).to.be.ok
      expect(@scale.baseFontSize).to.be.ok
      expect(@scale.lineHeight).to.be.ok
      expect(@scale.fontSizes).to.be.ok

  describe 'scale().scaleFactor', ->

    it 'accepts human readable values for common scale factors', ->
      expect(typographilic.scale('goldenRatio', 1.4, 16).scaleFactor).to.equal(1.618)
      expect(typographilic.scale('1:1.618', 1.4, 16).scaleFactor).to.equal(1.618)
      expect(typographilic.scale('1:phi', 1.4, 16).scaleFactor).to.equal(1.618)
      expect(typographilic.scale('1.618', 1.4, 16).scaleFactor).to.equal(1.618)

    it 'accepts values that are not in SCALE_FACTOR_MAP', ->
      expect(typographilic.scale('1.999', 1.4, 16).scaleFactor).to.equal(1.999)
      expect(typographilic.scale('1:1.999', 1.4, 16).scaleFactor).to.equal(1.999)
      expect(typographilic.scale('6:13', 1.4, 16).scaleFactor).to.equal(2.167)

  describe 'scale().fontSizes', ->

    it 'contains an object with arrays of font sizes in pixels, ems, and rems', ->
      scale = typographilic.scale('goldenRatio', 1.4, 16)
      expect(scale.fontSizes.px).to.be.an.instanceOf(Array)
      expect(scale.fontSizes.em).to.be.an.instanceOf(Array)
      expect(scale.fontSizes.rem).to.be.an.instanceOf(Array)

    it 'returns pixels for a single base font size', ->
      # .eql asserts that target is deeply equal to value
      expect(typographilic.scale('goldenRatio', 1.4, 16).fontSizes.px).to.eql(
        [10, 16, 26, 42, 68, 110, 178]
      )

    it 'returns pixels for multiple base font sizes', ->
      expect(typographilic.scale('goldenRatio', 1.4, [16, 12]).fontSizes.px).to.eql(
        [10, 12, 16, 19, 26, 31, 42, 50, 68, 81, 110, 131, 178]
      )

    it 'returns ems for a single base font size', ->
      # .eql asserts that target is deeply equal to value
      expect(typographilic.scale('goldenRatio', 1.4, 16).fontSizes.em).to.eql(
        [0.625, 1, 1.625, 2.625, 4.25, 6.875, 11.125]
      )

    it 'returns ems for multiple base font sizes, using the first size as the base', ->
      expect(typographilic.scale('goldenRatio', 1.4, [16, 12]).fontSizes.em).to.eql(
        [0.625, 0.75, 1, 1.188, 1.625, 1.938, 2.625, 3.125, 4.25, 5.063, 6.875, 8.188, 11.125]
      )

    it 'returns rems for a single base font size', ->
      # .eql asserts that target is deeply equal to value
      expect(typographilic.scale('goldenRatio', 1.4, 16).fontSizes.rem).to.eql(
        [0.625, 1, 1.625, 2.625, 4.25, 6.875, 11.125]
      )

    it 'returns rems for multiple base font sizes', ->
      expect(typographilic.scale('goldenRatio', 1.4, [16, 12]).fontSizes.rem).to.eql(
        [0.625, 0.75, 1, 1.188, 1.625, 1.938, 2.625, 3.125, 4.25, 5.063, 6.875, 8.188, 11.125]
      )

  describe 'scale().lineHeight', ->

    before ->
      @scale = typographilic.scale('goldenRatio', 1.6, 18)

    it 'contains an object with line height in pixels, ems, and rems', ->
      expect(@scale.lineHeight.px).to.equal(29)
      expect(@scale.lineHeight.em).to.equal(1.611)
      expect(@scale.lineHeight.rem).to.equal(1.813)
