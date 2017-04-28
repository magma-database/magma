private
setGlobalReadStrategy: aMaReadStrategy ifNotIn: aSet 
	"Set my ReadStrategy, as well as all other sessions of my sessions linked to me."
	(aSet includes: self) ifTrue: [ ^ self ].
	aSet add: self.
	self readStrategy: aMaReadStrategy.
	self definition ifNotNilDo:
		[ : def | def links do:
			[ : each | each findSession
				setGlobalReadStrategy: aMaReadStrategy
				ifNotIn: aSet ] ]