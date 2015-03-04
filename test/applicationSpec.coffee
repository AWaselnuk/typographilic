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

    it 'returns an object with scaleFactor, lineHeight, and fontSizes', ->
      expect(@scale.scaleFactor).to.be.ok
      expect(@scale.lineHeight).to.be.ok
      expect(@scale.fontSizes).to.be.ok

  describe 'scale().scaleFactor', ->

    it 'accepts human readable values for common scale factors', ->
      expect(typographilic.scale('goldenRatio', 1.4, 16).scaleFactor).to.equal(1.618)
      expect(typographilic.scale('1:1.618', 1.4, 16).scaleFactor).to.equal(1.618)
      expect(typographilic.scale('1:phi', 1.4, 16).scaleFactor).to.equal(1.618)

  describe 'scale().fontSizes', ->

    it 'contains an object with arrays of font sizes in pixels, ems, and rems', ->
      scale = typographilic.scale('goldenRatio', 1.4, 16)
      expect(scale.fontSizes.px).to.be.an.instanceOf(Array)
      expect(scale.fontSizes.em).to.be.an.instanceOf(Array)
      expect(scale.fontSizes.rem).to.be.an.instanceOf(Array)

    it 'accepts a single base font size', ->
      expect(typographilic.scale('goldenRatio', 1.4, 16).fontSizes.px).to.equal(
        [10, 16, 26, 42, 68, 110]
      )

    it 'accepts multiple base font sizes', ->
      expect(typographilic.scale('goldenRatio', 1.4, [12, 16]).fontSizes.px).to.equal(
        [10, 16, 26, 42, 68, 110]
      )



