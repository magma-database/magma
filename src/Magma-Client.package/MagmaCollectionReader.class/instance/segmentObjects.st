accessing
segmentObjects
	^ segment
		ifNil: [ Array empty ]
		ifNotNil: [ segment objects ]