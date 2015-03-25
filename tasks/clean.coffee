gulp = require 'gulp'
del = require 'del'
$ = require('./package.json').config

gulp.task 'clean', (cb) -> del ["#{$.BUILD}#{$.PATH}"], cb
