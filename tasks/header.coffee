gulp = require 'gulp'
header = require 'gulp-header'
fs = require 'fs'

getPackageJson = -> JSON.parse(fs.readFileSync('./package.json'))

getBanner = ->
  pkg = getPackageJson()
  banner = """
  ###!
   * @license #{pkg.name} v#{pkg.version}
   * (c) #{new Date().getFullYear()} #{pkg.author} #{pkg.homepage}
   * License: #{pkg.license}
  ###

  """

fileName = 'mixin'

$ =
  SRC: 'src'
  DEST: 'dest'

gulp.task 'header', ->
  gulp.src "#{$.SRC}/#{fileName}.coffee"
    .pipe header(getBanner())
    .pipe gulp.dest("#{$.DEST}")
