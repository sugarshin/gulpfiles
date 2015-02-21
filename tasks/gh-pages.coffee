gulp = require 'gulp'
exec = require('child_process').exec
C = require('./package.json').config

gulp.task 'gh-pages', (cb) ->
  exec "git subtree push --prefix=#{C.DST}/ origin gh-pages --squash", (err, stdout, stderr) ->
    console.log stdout
    console.log stderr
    cb err