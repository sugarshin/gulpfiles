const gulp = require('gulp');
const gutil = require('gulp-util');
const browserify = require('browserify');
const watchify = require('watchify');
const licensify = require('licensify');
const source = require('vinyl-source-stream');
const eventStream = require('event-stream');

const rename = require('../plugins').rename;
const conf = require('../conf').scripts;

const bundler = (entry, isWatch) => {
  const bOpts = conf.browserifyOpts;
  let b;

  bOpts.entries = [conf.common, entry]

  if (isWatch) {
    // bOpts.debug = true
    bOpts.cache = {};
    bOpts.packageCache = {};
    bOpts.fullPath = true;
    b = watchify(browserify(bOpts));
  } else {
    b = browserify(bOpts);
  }

  b.plugin(licensify);

  const bundle = () => {
    return b.bundle()
      .on('error', err => {
        gutil.log(gutil.colors.bgRed('ERROR'), err);
      })
      .pipe(source(entry))
      .pipe(rename({
        dirname: '',
        extname: '.js'
      }))
      .pipe(gulp.dest(conf.dest));
  };

  b
  .on('update', bundle)
  .on('log', message => {
    gutil.log(gutil.colors.bgGreen('Bundle'), gutil.colors.magenta(entry), message);
  });

  return bundle();
};

gulp.task('browserify', () => {
  const tasks = conf.entryFiles.map(entry => {
    return bundler(entry);
  });
  return eventStream.merge.apply(null, tasks);
});

gulp.task('watchify', () => {
  const tasks = conf.entryFiles.map(entry => {
    return bundler(entry, true);
  });
  return eventStream.merge.apply(null, tasks);
});
