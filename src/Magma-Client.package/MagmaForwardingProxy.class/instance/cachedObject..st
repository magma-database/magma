initialize-release
cachedObject: anObject 
	anObject maIsForwardingProxy ifTrue: 
		[ MaError signal: 'ForwardingProxy should not reference a ForwardingProxy.' ].
	cachedObject := anObject.
	anObject magmaSession ifNotNil: 
		[ : sess | 
		oid := sess oidFor: anObject.
		magmaId := sess magmaId veryDeepCopy	"so we don't share the same object between two repositories." ]