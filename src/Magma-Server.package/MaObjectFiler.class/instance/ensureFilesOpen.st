private
ensureFilesOpen

	file ifNotNil: [ file closed ifTrue: [ self openObjectsFile ] ].
	filePositionIndex ifNil: [ self openFilePositionIndex ]