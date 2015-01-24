var exec = require('child_process').exec;
var devDepend = require('../package.json').devDependencies;

var modules = Object.keys(devDepend);

var command = 'npm i -D ' + modules.join(' ');

exec(command, function(err, stdout, stderr) {
  if (err) {
    console.log(err);
  } else {
    console.log('stdout: ' + stdout);
    console.log('stderr: ' + stderr);
  }
});