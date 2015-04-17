module.exports = (gulp, opt, $) ->
  gulp.task 'replace', ->
    gulp.src opt.src
      .pipe $.replace 'main.js', "main.min.js?v#{Date.now()}"
      .pipe $.replace 'index.css', "index.min.css?v#{Date.now()}"
      .pipe gulp.dest opt.dest
