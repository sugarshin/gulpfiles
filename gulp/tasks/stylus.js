const gulp = require('gulp');
const nib = require('nib');

const plugins = require('../plugins');
const conf = require('../conf').stylus;

gulp.task('stylus', () => {
  return gulp.src(conf.src)
    .pipe(plugins.plumber({
      errorHandler: plugins.notify.onError('<%= error.message %>')
    }))
    .pipe(plugins.stylus({
      use: nib(),
      compress: true
    }))
    .pipe(plugins.rename({
      dirname: './'
    }))
    .pipe(gulp.dest(conf.dest, {
      cwd: './'
    }));
});
