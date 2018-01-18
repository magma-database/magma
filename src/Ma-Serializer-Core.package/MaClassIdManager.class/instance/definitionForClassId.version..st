accessing
definitionForClassId: classIdInteger version: classVersionInteger

	^ classVersionInteger = 0
		ifTrue: [ self inImageDefinition: (self classForId: classIdInteger) ]
		ifFalse: [ (self classDefinitionsForId: classIdInteger) at: classVersionInteger ]