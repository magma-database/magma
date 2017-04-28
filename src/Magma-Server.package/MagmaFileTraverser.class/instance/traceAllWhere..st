actions
traceAllWhere: aBlock 
	"Answer a the paths of buffers that value true for aBlock.  Each element is an ordered-collection of buffers where the last one satisfies aBlock."
	^ Array streamContents:
		[ : stream | self anchorGraphDo:
			[ : each | (aBlock value: each) ifTrue: [ stream nextPut: graphBuffer buffers ] ] ]