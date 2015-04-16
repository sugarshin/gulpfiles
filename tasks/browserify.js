var gulp = require('gulp');
var browserify = require('browserify');
var watchify = require('watchify');
var source = require('vinyl-source-stream');
var $ = require('../package.json').settings;

var bOpts = {
  entries: ['./' + $.SRC + '/js/main.coffee'],
  extensions: ['.coffee'],
  transform: ['coffeeify']
};

function bundler(watch) {
  var b;

  if (watch) {
    bOpts.debug = true;
    bOpts.cache = {};
    bOpts.packageCache = {};
    bOpts.fullPath = true;
    b = watchify(browserify(bOpts));
  } else {
    b = browserify(bOpts);
  }

  function bundle() {
    return b
            .bundle()
            .on('error', function(err) {
              console.log('bundle error: ' + err);
            })
            .pipe(source('main.js'))
            .pipe(gulp.dest('' + $.DEST + $.PATH + '/js'));
  }

  b
    .on('update', bundle)
    .on('log', function(message) {
      // todo
      console.log(message);
    });

  return bundle();
}

gulp.task('browserify', function() {
  return bundler();
});

gulp.task('watchify', function() {
  return bundler(true);
});
