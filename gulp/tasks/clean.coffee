del = require 'del'

module.exports = (gulp, {clean}) ->
  gulp.task 'clean', (cb) -> del clean, cb
