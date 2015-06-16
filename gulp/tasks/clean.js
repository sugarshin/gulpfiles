import del from 'del';

export default function(gulp, {clean}) {
  gulp.task('clean', cb => {
    del(clean, cb);
  });
}
