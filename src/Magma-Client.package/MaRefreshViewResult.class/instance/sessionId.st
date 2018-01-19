accessing
sessionId
	^ self connection ifNotNil: [ : conn | conn sessionId ]