#!/usr/bin/env ruby

require_relative 'lib/solver'

if ARGV[0] == '--standard'
  use_standard = true
  ARGV.shift
else
  use_standard = false
end
Solver.new(input: ARGF.read, standard: use_standard).solve!
