testing
isPersistent: anObject 
	"Answer whether anObject has been read from the persistent graph."
	^ (anObject maIsLargeCollection and: [ anObject changes isNotPersistent ]) 
		ifTrue: [ false ]
		ifFalse: 
			[ (self serializer hasOidFor: anObject) and: [ (MaOidCalculator isOidForNewObject: (self oidFor: anObject)) not ] ]