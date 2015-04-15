gulp = require 'gulp'
build = require './build'
test = require './test'
sequence = require 'run-sequence'

gulp.task 'default', (cb) -> sequence 'build', 'test', cb
