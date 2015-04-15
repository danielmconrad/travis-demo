gulp = require 'gulp'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
{remove} = require 'fs-extra'
sequence = require 'run-sequence'

# Main
gulp.task 'build', (cb) ->
  sequence 'build:clean', ['build:coffee'], cb

gulp.task 'build:clean', (cb) ->
  remove 'lib', (err) ->
    console.log err if err
    cb err

gulp.task 'build:coffee', ->
  source = gulp.src 'src/**/*.coffee'
  stream = coffee({bare: true}).on 'error', gutil.log
  output = gulp.dest 'lib'
  source.pipe(stream).pipe(output)
