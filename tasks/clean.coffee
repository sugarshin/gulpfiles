gulp = require 'gulp'
del = require 'del'
C = require('./package.json').config

gulp.task 'clean', (cb) -> del [C.DST], cb
