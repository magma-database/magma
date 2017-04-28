testing
exists
	| fd |
	fd := FileDirectory on: (FileDirectory dirPathFor: filename).
	^ fd fileExists: self baseName , '.1.' , self extension