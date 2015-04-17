del = require 'del'

module.exports = (gulp, opt) ->
  gulp.task 'clean', (cb) -> del opt, cb
