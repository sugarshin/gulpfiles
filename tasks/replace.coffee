# todo
module.exports = (gulp, opt, $) ->
  gulp.task 'replace', ->
    gulp.src opt.src
      .pipe $.replace opt.replacements[0][0], opt.replacements[0][1]
      .pipe $.replace opt.replacements[1][0], opt.replacements[1][1]
      .pipe gulp.dest opt.dest
