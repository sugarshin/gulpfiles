const gulp = require('gulp');

const plugins = require('../plugins');
const conf = require('../conf').uglify;

gulp.task('uglify', () => {
  return gulp.src(conf.src)
    .pipe(plugins.uglify(conf.opts))
    .pipe(plugins.rename({ suffix: '.min' }))
    .pipe(gulp.dest(conf.dest));
});
