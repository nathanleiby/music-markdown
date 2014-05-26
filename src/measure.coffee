class Measure
  constructor: ->

  parse: (input) ->
    chords = []
    split = input.split '|'
    for piece in split
      measure = []
      for char in piece
        continue unless char? and char not in [' ']
        continue unless char in ['A','B','C','D','E','F','G']
        measure.push char
      chords.push measure if measure.length
    return chords

module.exports = Measure
