module.exports = (gulp, {uglify}, $) ->
  gulp.task 'uglify', ->
    gulp
    .src uglify.src
    .pipe $.uglify preserveComments: 'some'
    .pipe $.rename suffix: '.min'
    .pipe gulp.dest uglify.dest
