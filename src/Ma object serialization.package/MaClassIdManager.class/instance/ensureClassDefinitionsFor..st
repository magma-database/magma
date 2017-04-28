accessing
ensureClassDefinitionsFor: aMaClassDefinition
	"Look for the collection of versions of the same class that aMaClassDefinition is for.  If none exist create and answer the new collection that will hold aMaClassDefinition and its future versions."
	^ (aMaClassDefinition id notNil and: [ classDefinitionsById includesKey: aMaClassDefinition id ])
		ifTrue: [ classDefinitionsById at: aMaClassDefinition id ]
		ifFalse:
			[ classDefinitionsById 
				maDetect: [ : eachDefinitions | eachDefinitions anySatisfy: [ : each | each notNil and: [ each isKnownAs: aMaClassDefinition className ] ] ]
				ifFound:
					[ : foundDefinitions | 
					aMaClassDefinition id: (foundDefinitions detect: [ : eachDefinition | eachDefinition notNil ]) id.
					foundDefinitions ]
				ifNone:
					[ "None found, let's create one."
					| id class |
					"First figure out the id."
					id := aMaClassDefinition hasId
						ifTrue: [ aMaClassDefinition id ]
						ifFalse:
							[ "Make sure not one of the minimumClasses."
							((Smalltalk hasClassNamed: aMaClassDefinition className) and: [ self isMemberOfMinimumClasses: (class := Smalltalk classNamed: aMaClassDefinition className) ])
								ifTrue: [ self idForClass: class ]
								ifFalse: [ self nextClassId ] ].
					aMaClassDefinition id: id.
					classDefinitionsById
						at: id
						put: (OrderedCollection new: 1) ] ]