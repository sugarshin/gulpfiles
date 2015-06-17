import browserify from 'browserify';
import watchify from 'watchify';
import source from 'vinyl-source-stream';
import eventStream from 'event-stream';

let bundler = (gulp, entry, conf, $, watch) => {
  let bOpts = conf.browserifyOpts;
  let b;

  bOpts.entries = [conf.common, entry]

  if (watch) {
    // bOpts.debug = true
    bOpts.cache = {};
    bOpts.packageCache = {};
    bOpts.fullPath = true;
    b = watchify(browserify(bOpts));
  } else {
    b = browserify(bOpts);
  }

  let bundle = () => {
    return b.bundle()
      .on('error', err => {
        console.log(`bundle error: ${err}`);
      })
      .pipe(source(entry))
      .pipe($.rename({
        dirname: '',
        extname: '.js'
      }))
      .pipe(gulp.dest(conf.dest));
  };

  b
  .on('update', bundle)
  .on('log', message => {
    console.log(message);
  });

  return bundle();
};

export default function(gulp, {scripts}, $) {
  gulp.task('browserify', () => {
    let tasks = scripts.entryFiles.map(entry => {
      return bundler(gulp, entry, scripts, $);
    });
    return eventStream.merge.apply(null, tasks);
  });

  gulp.task('watchify', () => {
    let tasks = scripts.entryFiles.map(entry => {
      return bundler(gulp, entry, scripts, $, true);
    });
    return eventStream.merge.apply(null, tasks);
  });
}
