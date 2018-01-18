*ma-serializer-core
slotAt: anInteger 
	"Answer the object referenced by the receiver at its anInteger'th slot."
	| namedSize |
	^ anInteger > (namedSize:=self class instSize)
		ifTrue: [ self basicAt: (anInteger-namedSize) ]
		ifFalse: [ self instVarAt: anInteger ]