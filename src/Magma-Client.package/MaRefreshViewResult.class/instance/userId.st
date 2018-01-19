accessing
userId
	^ self connection ifNotNil: [ : conn | conn userId ]