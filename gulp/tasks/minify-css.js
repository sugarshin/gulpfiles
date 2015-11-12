const gulp = require('gulp');

const plugins = require('../plugins');
const conf = require('../conf').minifyCss;

gulp.task('minify-css', () => {
  return gulp.src(conf.src)
    .pipe(plugins.minifyCss())
    .pipe(plugins.rename({ suffix: '.min' }))
    .pipe(gulp.dest(conf.dest));
});
