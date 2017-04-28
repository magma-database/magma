private
segmentContaining: anInteger 
	"My expression is a single clause, therefore the server can immediately give me the segment containing anInteger.  But we must adjust the index being asked for according to the uncommitted adds that have occurred."
	anInteger < 1 ifTrue: [ MagmaUserError signal: 'out of bounds' ].
	^ (self isLoaded and: [ segment includesIndex: anInteger ]) 
		ifTrue: [ segment ]
		ifFalse: 
			[ self 
				getSegmentContaining: anInteger
				withObjects: true ]