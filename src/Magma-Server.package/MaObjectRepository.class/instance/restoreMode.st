testing
restoreMode
	^ restoreMode ifNil: [ restoreMode := filer restoreMode ]