"use strict";
const fs = require("fs");

const data = JSON.parse(fs.readFileSync("mod/info.json"));
const name = data.name;
const version = data.version;
const cmd = process.argv[2];
if (typeof(cmd) !== typeof("")) {
	console.error("node getinfo.js {name|version}");
	process.exit(1);
} else if (cmd.toLowerCase() === 'name') {
	console.log(name);
	process.exit(0);
} else if (cmd.toLowerCase() === 'version') {
	console.log(version);
	process.exit(0);
} else {
	console.error("Unknown argument");
	process.exit(2);
}
