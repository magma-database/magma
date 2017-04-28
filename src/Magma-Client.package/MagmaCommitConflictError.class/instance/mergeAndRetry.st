actions
mergeAndRetry
	| stillInConflict |
	stillInConflict := self mergeConflicts.
	stillInConflict
		ifEmpty: [ self retry ]
		ifNotEmpty: [ self pass ]