del = require 'del'

module.exports = (gulp, conf) ->
  gulp.task 'clean', (cb) -> del conf, cb
