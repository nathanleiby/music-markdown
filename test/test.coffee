Measure = require '../src/measure'

_ = require 'underscore'
assert = require 'assert'
debug = require('debug') 'test'
{inspect} = require 'util'

describe "measure parsing", ->

  _.each {
  	"| A |" : [['A']],
  	"| A | B |" : [['A'], ['B']],
  	}, (expected, input) ->
  	it "finds a single chord per measure in: #{input}", ->
  		measure = new Measure
  		assert.deepEqual expected, measure.parse input

	_.each {
  	"| A B |" : [['A','B']],
  	"| A B | C D |" : [['A','B'], ['C','D']],
  	}, (expected, input) ->
  	it "finds multiple chords per measure in: #{input}", ->
  		measure = new Measure
  		assert.deepEqual expected, measure.parse input

	_.each {
  	"| Q |" : [],
  	"| A | Q |" : [['A']],
  	}, (expected, input) ->
  	it "rejects invalid chord names in: #{input}", ->
  		measure = new Measure
  		assert.deepEqual expected, measure.parse input
