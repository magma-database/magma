*ma-serializer-core
slotAt: anInteger put: anObject 
	"Flat slot-access."
	| namedSize |
	^ anInteger > (namedSize:=self class instSize)
		ifTrue:
			[ self
				basicAt: anInteger-namedSize
				put: anObject ]
		ifFalse:
			[ self
				instVarAt: anInteger
				put: anObject ]