private
setGlobalReadStrategy: aMaReadStrategy ifNotIn: aSet 
	"Set my ReadStrategy, as well as all other sessions of my sessions linked to me."
	(aSet addNewElement: self) ifFalse: [ ^ self ].
	self readStrategy: aMaReadStrategy copyForOtherSession.
	self definition ifNotNilDo:
		[ : def | def links do:
			[ : each | each findSession
				setGlobalReadStrategy: aMaReadStrategy copyForOtherSession
				ifNotIn: aSet ] ]