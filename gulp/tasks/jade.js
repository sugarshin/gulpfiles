const gulp = require('gulp');

const plugins = require('../plugins');
const conf = require('../conf').jade;

gulp.task('jade', () => {
  return gulp.src(conf.src)
    .pipe(plugins.plumber({
      errorHandler: plugins.notify.onError('<%= error.message %>')
    }))
    .pipe(plugins.jade(conf.opts))
    .pipe(plugins.rename(path => {
      path.dirname = path.dirname.replace('html', '.');
    }))
    .pipe(gulp.dest(conf.dest));
});
