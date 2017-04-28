accessing
sessionId
	^ self connection ifNotNilDo: [ : conn | conn sessionId ]