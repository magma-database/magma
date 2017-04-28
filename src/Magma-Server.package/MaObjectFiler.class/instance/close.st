actions
close

	file ifNotNil:
		[ file closed ifFalse: [ file close ].
		file := nil ].
	filePositionIndex ifNotNil:
		[ filePositionIndex close.
		filePositionIndex := nil ]