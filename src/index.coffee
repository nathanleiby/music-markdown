cli = require 'cli'

class Main
  cli.parse
    verbose:   ['v', 'Log all the things']

  cli.main (args, options) ->
    console.log "Doing nothing..."
