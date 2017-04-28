writebarrier
add: anObject
	"Handle special processing required by Dictionary's."
	anObject addSelfToWriteBarrier: self