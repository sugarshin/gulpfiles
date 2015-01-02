gulp = require 'gulp'
header = require 'gulp-header'
fs = require 'fs'
$ = require './../config.json'

getPackageJson = -> JSON.parse(fs.readFileSync('./package.json'))

getBanner = ->
  pkg = getPackageJson()
  banner = """
  /*!
   * @license #{pkg.name} v#{pkg.version}
   * (c) #{new Date().getFullYear()} #{pkg.author} #{pkg.homepage}
   * License: #{pkg.license}
   */

  """


gulp.task 'header', ->
  gulp.src "#{$.DEST}/#{$.NAME}.js"
    .pipe header(getBanner())
    .pipe gulp.dest $.DEST
