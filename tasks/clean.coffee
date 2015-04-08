gulp = require 'gulp'
del = require 'del'
$ = require('../package.json').settings

gulp.task 'clean', (cb) -> del ["#{$.BUILD}#{$.PATH}"], cb
