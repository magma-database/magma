file-specific
close

	file ifNotNil: [ file closed ifFalse: [ file close ] ]