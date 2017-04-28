debugging
buffersMissingFromWhole
	"Answer whether I have all the object buffers needed to reconstitute my entire graph."
	| oids missing |
	missing := OrderedCollection new.
	oids := Set new.
	self buffersDo: [ : each | oids add: each oid ].
	self buffersDo: 
		[ : each | 
		each isPointers ifTrue: 
			[ each oids do: 
				[ : eachOid | 
				((MaOidCalculator isOidForOptimizedObject: eachOid) not and: [ (oids includes: eachOid) not ]) ifTrue: [ missing add: eachOid -> each independentCopy ] ] ] ].
	^ missing