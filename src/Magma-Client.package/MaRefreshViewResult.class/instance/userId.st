accessing
userId
	^ self connection ifNotNilDo: [ : conn | conn userId ]