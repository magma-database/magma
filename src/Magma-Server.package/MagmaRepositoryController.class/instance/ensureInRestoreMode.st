high-availability
ensureInRestoreMode
	repository restoreMode ifFalse: [ repository beginRestore ].
	^ nil