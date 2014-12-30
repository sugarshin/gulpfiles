gulp = require 'gulp'
exec = require('child_process').exec

$ =
  SRC: 'src'
  DEST: 'dest'

gulp.task 'gh-pages', (cb) ->
  exec "git subtree push --prefix=#{$.DEST}/ origin gh-pages --squash", (err, stdout, stderr) ->
    console.log stdout
    console.log stderr
    cb err
