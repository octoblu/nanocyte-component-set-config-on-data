ReturnValue = require 'nanocyte-component-return-value'
SetConfigOnData = require '..'

describe 'SetConfigOnData', ->
  beforeEach ->
    @sut = new SetConfigOnData

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with config it should add to object', ->
      beforeEach ->
        @envelope =
          config: "test2"
          data: { 'yo': 'mama'}
      it 'should return the object', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal "test2"

    describe 'when called with null data it should create it and then add', ->
      beforeEach ->
        @envelope =
          config: "test2"
          data: null
      it 'should return the object', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal 'test2'

    describe 'when called with empty data it should add to object', ->
      beforeEach ->
        @envelope =
          config: "test2"
          data: {}
      it 'should return the object', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal 'test2'

    describe 'when called with config in object form', ->
      beforeEach ->
        @envelope =
          config: {"test2" : 50}
          data: {'bleep':'blarg'}
      it 'should return the object', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal {"test2" : 50}
