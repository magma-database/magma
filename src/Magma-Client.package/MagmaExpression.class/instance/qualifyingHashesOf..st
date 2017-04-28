evaluating
qualifyingHashesOf: anObject 
	"Answer an OrderedCollection of Associations detailing which indexes and hashes cause anObject to qualify for the receiver expression.  An empty OC means anObject does not qualify."
	| answer |
	answer := OrderedCollection new.
	self isConjunction 
		ifTrue: 
			[ | subQualifyingHashes |
			subQualifyingHashes := OrderedCollection new.
			self terms do: 
				[ : each | 
				subQualifyingHashes := each qualifyingHashesOf: anObject.
				subQualifyingHashes ifEmpty: [ ^ OrderedCollection new ] ].
			answer addAll: subQualifyingHashes ]
		ifFalse: 
			[ | subQualifyingHashes |
			subQualifyingHashes := OrderedCollection new.
			self terms do: 
				[ : each | 
				subQualifyingHashes := each qualifyingHashesOf: anObject.
				answer addAll: subQualifyingHashes ] ].
	^ answer