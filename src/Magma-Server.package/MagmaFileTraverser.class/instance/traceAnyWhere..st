actions
traceAnyWhere: aBlock 
	"Answer a path of buffers from the root to the buffer that values true for aBlock. The path is an ordered-collection of buffers where the last one satisfies aBlock."
	self anchorGraphDo:
		[ : each | (aBlock value: each) ifTrue: [ ^ graphBuffer buffers ] ]