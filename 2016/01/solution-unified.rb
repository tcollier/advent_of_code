#!/usr/bin/env ruby

require_relative 'lib/solver'

Solver.new(input: ARGF.read).solve!
