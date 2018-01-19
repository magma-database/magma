testing
equivalentOf: anObject 
	"Answer the object in me equivalent to anObject."
	equivalenceAttributes isEmpty ifTrue: [ MagmaUserError signal: 'MagmaSets are not practical without at least one equivalenceAttribute defined.' ].
	(changes objectEqualTo: anObject) ifNotNil: [ : obj | ^ obj ].
	(changes removed includesKey: anObject) ifTrue: [ ^ nil ].
	self isNewCollection ifTrue: [ ^ nil ].
	(self canIndex: anObject) ifFalse: [ ^ nil ].
	^ (self readerFor: anObject)
		detect: [ : each | each = anObject ]
		ifNone: [ nil ]