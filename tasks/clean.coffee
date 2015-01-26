gulp = require 'gulp'
del = require 'del'
$ = require './../config.json'

gulp.task 'clean', (cb) -> del [$.DEST], cb
